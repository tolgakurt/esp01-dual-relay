String dayToString(unsigned char day)
{
  switch (day)
  {
    case 1: return "Sunday";
    case 2: return "Monday";
    case 3: return "Tuesday";
    case 4: return "Wednesday";
    case 5: return "Thursday";
    case 6: return "Friday";
    case 7: return "Saturday";
    default: return "";
  }
}

String actionToString(unsigned char action)
{
  switch (action)
  {
    case 1: return "Close";
    case 2: return "Open";
    default: return "";
  }
}

void checkSchedule()
{
  for (size_t i = 0; i < commandCount; i++)
  {
    if (commands[i].day == weekday() && commands[i].hour == hour() && commands[i].minute == minute())
    {
      String action = actionToString(commands[i].action);
      String day = dayToString(commands[i].day);
      Serial.printf("Scheduled action: %s on %s %d:%d\r\n", action.c_str(), day.c_str(), commands[i].hour, commands[i].minute);
      switch (commands[i].action)
      {
        case 1: closeCurtain(); break;
        case 2: openCurtain(); break;
      }
      scheduledActionStart = millis();
    }
  }
}

void serializeSchedule()
{
  Serial.println("Here are the scheduled commands:");

  if (commandCount == 0)
  {
    Serial.println("There are no scheduled commands.");
    return;
  }
  
  for (size_t i = 0; i < commandCount; i++)
  {
    String action = actionToString(commands[i].action);
    String day = dayToString(commands[i].day);
    Serial.printf("%s on %s %d:%d\r\n", action.c_str(), day.c_str(), commands[i].hour, commands[i].minute);
  }
}