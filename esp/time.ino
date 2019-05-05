void initTime()
{
  Serial.println("Initializing time.");

  time_t epochTime;
  configTime(TIME_OFFSET, 0, "pool.ntp.org", "time.nist.gov");
  delay(1000);

  while (true)
  {
    epochTime = time(NULL);

    if (epochTime == 0)
    {
      Serial.println("Fetching NTP epoch time failed! Waiting 2 seconds to retry.");
      delay(2000);
    }
    else
    {
      Serial.printf("Fetched NTP epoch time is: %lu.\r\n", epochTime);
      setTime(epochTime);
      break;
    }
  }
}

void displayTime()
{
  Serial.printf("Time is %d.%d.%d %d:%d:%d\r\n", day(), month(), year(), hour(), minute(), second());
  lastTimeDisplay = millis();
}
