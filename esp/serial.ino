bool isSerialStarted = false;
void initSerial(bool txOnly)
{
  if (isSerialStarted)
  {
    delay(1000);
    Serial.end();
  }

  if (txOnly)
  {
    Serial.begin(115200, SERIAL_8N1, SERIAL_TX_ONLY);
  }
  else
  {
    Serial.begin(115200);
  }
  isSerialStarted = true;

  Serial.setDebugOutput(true);
  Serial.printf("Serial successfully initialized. TX only: %s\r\n", txOnly ? "True" : "False");
}

void flushSerial()
{
  Serial.println("Flushing serial buffer.");
  while (Serial.available())
  {
    Serial.read();
  }
}

/* Read a string whose length should in (0, maxLen) from Serial and return it.
 *        prompt   - the interact message and buf should be allocaled already and return true.
 *        maxLen   - the buf's len, which should be upper bound of the read-in string's length, this should > 0
 *        timeout  - If after timeout(ms), return false with nothing saved to buf.
 *                   If no timeout <= 0, this function will not return until there is something read.
 */
String readFromSerial(String prompt, int maxLen, int timeout)
{
  // Nothing can be read if maximum buffer length is not set to something greater than 0.
  if (maxLen <= 0)
  {
    Serial.printf("Serial is set to read %d characters. Returning.", maxLen);
    return "";
  }

  flushSerial();
  Serial.println(prompt);

  int timer = 0, delayTime = 1000;
  while (1)
  {
    if (Serial.available())
    {
      String input = Serial.readString();
      int len = input.length();
      Serial.printf("You input %d character(s). Your input:\r\n%s\r\n", len, input.c_str());
      if (len > maxLen)
      {
        Serial.printf("Your input should be less than %d character(s). Try again.\r\n", maxLen);
      }
      else if (len > 0)
      {
        Serial.println("Your input is valid. Returning.");
        return input;
      }
    }

    // if timeout, return false directly
    timer += delayTime;
    if (timeout > 0 && timer >= timeout)
    {
      Serial.println("You input nothing valid, skipping...");
      return "";
    }

    // delay a time before next read
    delay(delayTime);
  }
}