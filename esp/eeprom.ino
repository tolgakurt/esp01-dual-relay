void initEEPROM()
{
  // Print the whole EEPROM.
  Serial.println("Content of EEPROM is as following:");
  char* content = (char*)malloc(EEPROM_SIZE);
  readEEPROM(0, EEPROM_SIZE, content, false, 0);
  for (int i = 0; i < EEPROM_SIZE; i++)
  {
    Serial.printf("%d ", content[i]);
  }
  free(content);
  Serial.println("\r\nEEPROM serialization end.");

  // Check if EEPROM is initialized with default values.
  // First region in EEPROM should contain "Tolga Kurt".
  char signature[SIGNATURE_LEN] = EXPECTED_SIGNATURE;
  char* eepromSignature = (char*)malloc(EEPROM_SIZE);
  readEEPROM(SIGNATURE_ADDR, SIGNATURE_LEN, eepromSignature, true, SIGNATURE_END);
  // If it doesn't ...
  if (strcmp(signature, eepromSignature) != 0)
  {
    // ... write signature ...
    Serial.printf("Signature is not is as it should be. Writing %s to signature region in EEPROM.\r\n", signature);
    writeEEPROM(SIGNATURE_ADDR, signature, SIGNATURE_LEN);

    // ... initialize connection string region with connection string termination char ...
    Serial.printf("Initializing connection string region in EEPROM with %d\r\n", CONNECTION_STR_END);
    char* connectionFill = (char*)malloc(CONNECTION_STR_LEN);
    memset(connectionFill, CONNECTION_STR_END, CONNECTION_STR_LEN);
    writeEEPROM(CONNECTION_STR_ADDR, connectionFill, CONNECTION_STR_LEN);
    free(connectionFill);

    // ... initialize schedule region with schedule termination char ...
    Serial.printf("Initializing schedule region in EEPROM with %d\r\n", SCHEDULE_END);
    char* scheduleFill = (char*)malloc(SCHEDULE_LEN);
    memset(scheduleFill, SCHEDULE_END, SCHEDULE_LEN);
    writeEEPROM(SCHEDULE_ADDR, scheduleFill, SCHEDULE_LEN);
    free(scheduleFill);

    // ... initialize uptime region with uptime termination char ...
    Serial.printf("Initializing uptime region in EEPROM with %d\r\n", UPTIME_DEFAULT);
    char* uptimeFill = (char*)malloc(UPTIME_LEN);
    memset(uptimeFill, UPTIME_DEFAULT, UPTIME_LEN);
    writeEEPROM(UPTIME_ADDR, uptimeFill, UPTIME_LEN);
    free(uptimeFill);

    // ... initialize startup region with startup termination char ...
    Serial.printf("Initializing startup region in EEPROM with %d\r\n", STARTUP_DEFAULT);
    char* startupFill = (char*)malloc(STARTUP_LEN);
    memset(startupFill, STARTUP_DEFAULT, STARTUP_LEN);
    writeEEPROM(STARTUP_ADDR, startupFill, STARTUP_LEN);
    free(startupFill);
  }
  free(eepromSignature);
}

void readConnectionStr()
{
  Serial.println("Will try to read connection string either from EEPROM or from user input.");

  // Assign memory for connection string.
  connectionStr = (char*)calloc(CONNECTION_STR_LEN, sizeof(char));

  // Try to read the connection string from EEPROM.
  int connectionStrLen = readEEPROM(CONNECTION_STR_ADDR, CONNECTION_STR_LEN, connectionStr, true, CONNECTION_STR_END);

  // If EEPROM doesn't contain connection string or if the user decides to reset that, ...
  if (connectionStrLen == 0 || needEraseEEPROM())
  {
    // ... read connection string from Serial and save to EEPROM.
    String input = readFromSerial("Input your Azure IoT hub device connection string: ", CONNECTION_STR_LEN, 0);
    if (input != "")
    {
      strcpy(connectionStr, input.c_str());
      // Add 1 to strlen, since it won't count for the termination char, but
      // we want the termination char to be written to EEPROM.
      writeEEPROM(CONNECTION_STR_ADDR, connectionStr, strlen(connectionStr) + 1);
    }
  }
}

void readSchedule()
{
  Serial.println("Will try to read schedule from EEPROM.");

  // Read schedule information from EEPROM.
  char* schedule = (char*)malloc(SCHEDULE_LEN);
  int scheduleLen = readEEPROM(SCHEDULE_ADDR, SCHEDULE_LEN, schedule, true, SCHEDULE_END);
  schedule = (char*)realloc(schedule, scheduleLen);

  // Set command count and memory for scheduled commands.
  commandCount = scheduleLen / sizeof(Command);
  commands = (Command*)malloc(scheduleLen);
  memcpy(commands, schedule, scheduleLen);
  free(schedule);
}

bool updateSchedule(const unsigned char* message, size_t size)
{
  // Return if the message size is invalid.
  if (size % sizeof(Command) != 0)
  {
    Serial.printf("Invalid schedule size: %d\r\nReceived schedule: %s\r\n", size, message);
    return false;
  }

  // Return if the message contains commands more than maximum allowable commands.
  if (size / sizeof(Command) > MAX_COMMANDS)
  {
    Serial.printf("Received a schedule of size %d which contains more than %d commands.\r\nReceived schedule: %s\r\n", size, MAX_COMMANDS, message);
    return false;
  }

  Serial.printf("Will update the schedule with a message of size %d.\r\n", size);

  // Update command count.
  commandCount = size / sizeof(Command);

  // Write the message to EEPROM and schedule in the memory.
  commands = (Command*)malloc(commandCount * sizeof(Command));
  memcpy(commands, message, size * sizeof(unsigned char));
  writeEEPROM(SCHEDULE_ADDR, (const char*)message, size);

  // Terminate the schedule region in EEPROM just after the written commands.
  terminateEEPROMRegion(SCHEDULE_ADDR + size, SCHEDULE_END);

  return true;
}

int getNextId(int id, unsigned long limit)
{
  if (id == limit) return 1;
  return id + 1;
}

static unsigned short uptimeId = 0;
static int uptimeAddr = 0;

void initUptimeId()
{
  // Look at the UPTIME region in EEPROM and find the record with the greatest id.
  // Also keep the address of this record.
  Serial.println("Will try to find uptime id and address for this session.");

  Uptime uptime;
  unsigned long maxUptimeId = 0;
  int maxUptimeAddr = UPTIME_ADDR - sizeof(Uptime); // since this may never be updated during loop.
  int uptimeBlockCount = UPTIME_LEN / sizeof(Uptime);
  for (int i = 0; i < uptimeBlockCount; i++)
  {
    int addr = UPTIME_ADDR + i * sizeof(Uptime);
    readEEPROM(addr, sizeof(Uptime), (char*)&uptime, false, 0);
    if (uptime.id > maxUptimeId)
    {
      maxUptimeId = uptime.id;
      maxUptimeAddr = addr;
    }
  }

  // Set current uptime id.
  uptimeId = getNextId(maxUptimeId, ULONG_MAX);

  // If the logs reached to the end of UPTIME region, get back to the beginning.
  if (maxUptimeAddr == UPTIME_ADDR + UPTIME_LEN - sizeof(Uptime))
  {
    uptimeAddr = UPTIME_ADDR;
  }
  else
  {
    uptimeAddr = maxUptimeAddr + sizeof(Uptime);
  }

  Serial.printf("Uptime record for this session will have id = %d and will be written at %d\r\n", uptimeId, uptimeAddr);

  // Write uptime even if it is too small, because a reset should occur before UPTIME_UPDATE_INTERVAL
  updateUptime();
}

void updateUptime()
{
  // Record uptime on top of the region determined for this session.
  lastUptimeUpdate = millis();
  Uptime uptime;
  uptime.id = uptimeId;
  uptime.millis = lastUptimeUpdate;

  Serial.printf("Updating uptime record with id = %d and millis = %d at address = %d\r\n", uptimeId, lastUptimeUpdate, uptimeAddr);
  writeEEPROM(uptimeAddr, (char*)&uptime, sizeof(Uptime));
}

static unsigned short startupId = 0;
static int startupAddr = 0;

void initStartupId()
{
  // Look at the STARTUP region in EEPROM and find the record with the greatest id.
  // Also keep the address of this record.
  Serial.println("Will try to find startup id and address for this session.");

  Startup startup;
  unsigned short maxStartupId = 0;
  int maxStartupAddr = STARTUP_ADDR - sizeof(Startup); // since this may never be updated during loop.
  int startupBlockCount = STARTUP_LEN / sizeof(Startup);
  for (int i = 0; i < startupBlockCount; i++)
  {
    int addr = STARTUP_ADDR + i * sizeof(Startup);
    readEEPROM(addr, sizeof(Startup), (char*)&startup, false, 0);
    if (startup.id > maxStartupId)
    {
      maxStartupId = startup.id;
      maxStartupAddr = addr;
    }
  }

  // Set current startup id.
  startupId = getNextId(maxStartupId, USHRT_MAX);

  // If the logs reached to the end of STARTUP region, get back to the beginning.
  if (maxStartupAddr == STARTUP_ADDR + STARTUP_LEN - sizeof(Startup))
  {
    startupAddr = STARTUP_ADDR;
  }
  else
  {
    startupAddr = maxStartupAddr + sizeof(Startup);
  }

  Serial.printf("Startup record for this session will have id = %d and will be written at %d\r\n", startupId, startupAddr);

  // Write startup reason to EEPROM.
  rst_info* resetInfo = ESP.getResetInfoPtr();
  writeResetEvent(resetInfo->reason);
}

// Can take a value from ESP reset reason, or some custom value which can be found in
// config.h, SOFT RESET CODES region
void writeResetEvent(unsigned char reason)
{
  Startup startup;
  startup.id = startupId;
  startup.reason = reason;

  Serial.printf("Writing reset event with id = %d and reason = %d at address = %d\r\n", startupId, reason, startupAddr);
  writeEEPROM(startupAddr, (char*)&startup, sizeof(Startup));

  // Update startup id and address so that if a soft reset occurs, it can be recorded.
  startupId = getNextId(startupId, USHRT_MAX);

  if (startupAddr == STARTUP_ADDR + STARTUP_LEN - sizeof(Startup))
  {
    startupAddr = STARTUP_ADDR;
  }
  else
  {
    startupAddr = startupAddr + sizeof(Startup);
  }
}

bool needEraseEEPROM()
{
  if (readFromSerial("Enter 'y' to erase memory. Will skip after 10 seconds.", 1, 10000) == "y")
  {
    terminateEEPROMRegion(CONNECTION_STR_ADDR, CONNECTION_STR_END);
    terminateEEPROMRegion(SCHEDULE_ADDR, SCHEDULE_END);
    return true;
  }
  return false;
}

void terminateEEPROMRegion(int addr, char terminationChar)
{
  Serial.printf("Terminating EEPROM region at %d\r\n", addr);

  EEPROM.begin(EEPROM_SIZE);
  if (EEPROM.read(addr) != terminationChar)
  {
    EEPROM.write(addr, terminationChar);
  }
  EEPROM.commit();
  EEPROM.end();
}

void writeEEPROM(int addr, const char* data, int size)
{
  if (size > EEPROM_SIZE - addr)
  {
    Serial.printf("Cannot write. Given address is %d. Given size is %d. EEPROM size is %d.\r\n", addr, size, EEPROM_SIZE);
    return;
  }

  Serial.printf("Will write EEPROM from address %d to %d with %.*s\r\n", addr, addr + size, size, data);
  
  EEPROM.begin(EEPROM_SIZE);
  for (int i = 0; i < size; i++)
  {
    if (EEPROM.read(addr + i) != data[i])
    {
      EEPROM.write(addr + i, data[i]);
    }
    delay(EEPROM_IO_DELAY);
  }
  EEPROM.commit();
  EEPROM.end();
}

// Read bytes from addr until maxLen bytes are read. Terminates if it should terminate when given character is encountered.
// Return the length of read out.
int readEEPROM(int addr, int maxLen, char* data, bool shouldTerminate, char terminationChar)
{
  Serial.printf(
    "Will read EEPROM from address %d until %d bytes are read%s.\r\n",
    addr,
    maxLen,
    shouldTerminate ? " or a termination char is encountered" : ""
  );

  int count = 0;

  EEPROM.begin(EEPROM_SIZE);
  for (int i = 0; i < maxLen; i++)
  {
    unsigned char c = EEPROM.read(addr + i);
    if (shouldTerminate && c == terminationChar)
    {
      break;
    }
    data[i] = c;
    count = i + 1;
    delay(EEPROM_IO_DELAY);
  }
  EEPROM.end();

  Serial.printf("%d byte(s) are read from EEPROM.\r\n", count);

  return count;
}
