#ifndef STATEMANAGER_H_
#define STATEMANAGER_H_

#include <EEPROM.h>
#include "ButtonManager.h"

enum AppState {
  Startup = 1,
  NoDisplay,
  InfoDisplay,
  SelectSet,
  TimeComp,
  MessageDisplay,
  OpenCurtain,
  CloseCurtain,
  StopCurtain
};

enum SetState {
  OneTimeOpen = 0,
  CurrentTime,
  OpenWeekdays,
  CloseWeekdays,
  OpenWeekends,
  CloseWeekends,
  FactoryReset
};

enum CompState {
  Hour = 0,
  Minute,
  Year,
  Month,
  Date
};

struct TimeComps {
  uint8_t min;
  uint8_t hr;
  uint16_t yr;
  uint8_t mon;
  uint8_t date;
};

struct ScheduleComps {
  uint8_t min;
  uint8_t hr;
};

struct Action {
  AppState appState;
  SetState setState;
  CompState compState;
  TimeComps timeComps;
  String msgLine1;
  String msgLine2;
};

class StateManager {
public:
  StateManager() {}

  void init(DS1302* _rtc) {
    rtc = _rtc;

    readScheduleFromEEPROM();
  }

  Action update(ButtonState btnState) {
    if (appState == AppState::Startup) {
      appState = AppState::NoDisplay;
      return getStateAction();
    }

    if (appState == AppState::NoDisplay) {
      if (btnState == ButtonState::CtlPressing || btnState == ButtonState::CtlShortPressed) {
        lastInfoDisplayTime = millis();
        appState = AppState::InfoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::IncPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Opening curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::OpenCurtain;
        return getStateAction();
      }
      if (btnState == ButtonState::DecPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Closing curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::CloseCurtain;
        return getStateAction();
      }
    }

    if (appState == AppState::InfoDisplay) {
      if (millis() - lastInfoDisplayTime > DISPLAY_INFO_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::CtlPressing || btnState == ButtonState::CtlShortPressed) {
        lastInfoDisplayTime = millis();
        return getEmptyAction();
      }
      if (btnState == ButtonState::CtlLongPressed) {
        lastSetTime = millis();
        appState = AppState::SelectSet;
        setState = SetState::OneTimeOpen;
        return getStateAction();
      }
    }

    if (appState == AppState::SelectSet) {
      if (millis() - lastSetTime > SET_IDLE_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::IncPressed) {
        lastSetTime = millis();
        setState = (SetState)(setState + 1 == 7 ? 0 : setState + 1);
        return getStateAction();
      }
      if (btnState == ButtonState::DecPressed) {
        lastSetTime = millis();
        setState = (SetState)(setState - 1 == -1 ? 6 : setState - 1);
        return getStateAction();
      }
      if (btnState == ButtonState::CtlShortPressed || btnState == ButtonState::CtlLongPressed) {
        lastSetTime = millis();
        if (setState == SetState::FactoryReset) {
          factoryReset();
          readScheduleFromEEPROM();
          lastAckTime = millis();
          appState = AppState::MessageDisplay;
        }
        else {
          appState = AppState::TimeComp;
          compState = CompState::Hour;
          setCurrentTimeComps();
        }
        return getStateAction();
      }
    }

    if (appState == AppState::TimeComp) {
      if (millis() - lastSetTime > SET_IDLE_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::IncPressed) {
        lastSetTime = millis();
        incrementCurrentTimeComp();
        return getStateAction();
      }
      if (btnState == ButtonState::DecPressed) {
        lastSetTime = millis();
        decrementCurrentTimeComp();
        return getStateAction();
      }
      if (btnState == ButtonState::CtlShortPressed || btnState == ButtonState::CtlLongPressed) {
        uint8_t totalCompCount = setState == SetState::CurrentTime ? 5 : 2;
        if (compState + 1 == totalCompCount) {
          saveTimeComps();
          lastAckTime = millis();
          appState = AppState::MessageDisplay;
        }
        else {
          lastSetTime = millis();
          compState = (CompState)(compState + 1);
        }
        return getStateAction();
      }
    }

    if (appState == AppState::MessageDisplay) {
      if (millis() - lastAckTime > ACTION_ACK_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
    }

    if (appState == AppState::OpenCurtain) {
      if (millis() - lastCurtainTime > CURTAIN_ACTION_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::DecPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Closing curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::CloseCurtain;
        return getStateAction();
      }
      if (btnState == ButtonState::CtlShortPressed || btnState == ButtonState::CtlLongPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Stopped curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::StopCurtain;
        return getStateAction();
      }
    }

    if (appState == AppState::CloseCurtain) {
      if (millis() - lastCurtainTime > CURTAIN_ACTION_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
      if (btnState == ButtonState::IncPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Opening curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::OpenCurtain;
        return getStateAction();
      }
      if (btnState == ButtonState::CtlShortPressed || btnState == ButtonState::CtlLongPressed) {
        lastCurtainTime = millis();
        msgLine1 = "Stopped curtain";
        msgLine2 = "due to keypress!";
        appState = AppState::StopCurtain;
        return getStateAction();
      }
    }

    if (appState == AppState::StopCurtain) {
      if (millis() - lastCurtainTime > ACTION_ACK_TIMEOUT) {
        appState = AppState::NoDisplay;
        return getStateAction();
      }
    }

    if (millis() - lastScheduleCheckTime > 60005) {
      lastScheduleCheckTime = millis();
      if (timeToOpen() && !oneTimeOpenTimeout) {
        lastCurtainTime = millis();
        msgLine1 = "Opening curtain";
        msgLine2 = "due to schedule!";
        appState = AppState::OpenCurtain;
        return getStateAction();
      }
      if (timeToClose()) {
        lastCurtainTime = millis();
        msgLine1 = "Closing curtain";
        msgLine2 = "due to schedule!";
        appState = AppState::CloseCurtain;
        return getStateAction();
      }
    }

    if (oneTimeOpenActive && millis() > oneTimeOpenTimeout) {
      lastCurtainTime = millis();
      oneTimeOpenActive = false;
      msgLine1 = "Opening curtain";
      msgLine2 = "for once!";
      appState = AppState::OpenCurtain;
      return getStateAction();
    }

    return getEmptyAction();
  }

private:
  DS1302* rtc;

  unsigned long lastInfoDisplayTime = 0;
  unsigned long lastSetTime = 0;
  unsigned long lastAckTime = 0;
  unsigned long lastCurtainTime = 0;
  unsigned long lastScheduleCheckTime = 0;
  unsigned long oneTimeOpenTimeout = 0;
  bool oneTimeOpenActive = false;

  AppState appState = AppState::Startup;
  SetState setState = SetState::OneTimeOpen;
  CompState compState = CompState::Hour;
  TimeComps timeComps;
  String msgLine1;
  String msgLine2;

  ScheduleComps weekdaysOpenSchedule;
  ScheduleComps weekdaysCloseSchedule;
  ScheduleComps weekendsOpenSchedule;
  ScheduleComps weekendsCloseSchedule;
  ScheduleComps oneTimeOpenDefaults;

  Action getEmptyAction() {
    return Action { };
  }

  Action getStateAction() {
    return Action {
      appState,
      setState,
      compState,
      timeComps,
      msgLine1,
      msgLine2
    };
  }

  void readScheduleFromEEPROM() {
    // Memory is organized as such:
    // Weekdays open hr, min
    // Weekdays close hr, min
    // Weekends open hr, min
    // Weekends close hr, min
    // One time open defaults hr, min
    String formatted;

    EEPROM.get(sizeof(ScheduleComps) * 0, weekdaysOpenSchedule);
    formatted = String(weekdaysOpenSchedule.hr) + ":" + String(weekdaysOpenSchedule.min);
    Serial.print("Weekdays open: "); Serial.println(formatted);

    EEPROM.get(sizeof(ScheduleComps) * 1, weekdaysCloseSchedule);
    formatted = String(weekdaysCloseSchedule.hr) + ":" + String(weekdaysCloseSchedule.min);
    Serial.print("Weekdays close: "); Serial.println(formatted);

    EEPROM.get(sizeof(ScheduleComps) * 2, weekendsOpenSchedule);
    formatted = String(weekendsOpenSchedule.hr) + ":" + String(weekendsOpenSchedule.min);
    Serial.print("Weekends open: "); Serial.println(formatted);

    EEPROM.get(sizeof(ScheduleComps) * 3, weekendsCloseSchedule);
    formatted = String(weekendsCloseSchedule.hr) + ":" + String(weekendsCloseSchedule.min);
    Serial.print("Weekends close: "); Serial.println(formatted);

    EEPROM.get(sizeof(ScheduleComps) * 4, oneTimeOpenDefaults);
    formatted = String(oneTimeOpenDefaults.hr) + ":" + String(oneTimeOpenDefaults.min);
    Serial.print("One time open defaults: "); Serial.println(formatted);
  }

  void setCurrentTimeComps() {
    if (setState == SetState::CurrentTime) {
      Time t = rtc->time();
      timeComps.hr = t.hr;
      timeComps.min = t.min;
      timeComps.date = t.date;
      timeComps.mon = t.mon;
      timeComps.yr = t.yr;
    }
    else if (setState == SetState::OpenWeekdays) {
      timeComps.hr = weekdaysOpenSchedule.hr;
      timeComps.min = weekdaysOpenSchedule.min;
    }
    else if (setState == SetState::CloseWeekdays) {
      timeComps.hr = weekdaysCloseSchedule.hr;
      timeComps.min = weekdaysCloseSchedule.min;
    }
    else if (setState == SetState::OpenWeekends) {
      timeComps.hr = weekendsOpenSchedule.hr;
      timeComps.min = weekendsOpenSchedule.min;
    }
    else if (setState == SetState::CloseWeekends) {
      timeComps.hr = weekendsCloseSchedule.hr;
      timeComps.min = weekendsCloseSchedule.min;
    }
    else if (setState == SetState::OneTimeOpen) {
      timeComps.hr = oneTimeOpenDefaults.hr;
      timeComps.min = oneTimeOpenDefaults.min;
    }
  }

  void incrementCurrentTimeComp() {
    if (compState == CompState::Hour) {
      timeComps.hr = (timeComps.hr + 1) % 24;
    }
    else if (compState == CompState::Minute) {
      uint8_t increment = setState == SetState::CurrentTime ? 1 : 15;
      timeComps.min = (timeComps.min + increment) % 60;
    }
    else if (compState == CompState::Year) {
      timeComps.yr = (timeComps.yr + 1) == 2100 ? 2000 : timeComps.yr + 1;
    }
    else if (compState == CompState::Month) {
      timeComps.mon = (timeComps.mon + 1) == 13 ? 1 : timeComps.mon + 1;
    }
    else if (compState == CompState::Date) {
      static uint8_t days[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
      uint8_t daysInMonth = days[timeComps.mon - 1];
      if (daysInMonth == 28 && timeComps.yr % 4 == 0) daysInMonth = 29;
      timeComps.date = timeComps.date == daysInMonth ? 1 : timeComps.date + 1;
    }
  }

  void decrementCurrentTimeComp() {
    if (compState == CompState::Hour) {
      timeComps.hr = (timeComps.hr - 1 + 24) % 24;
    }
    else if (compState == CompState::Minute) {
      uint8_t increment = setState == SetState::CurrentTime ? 1 : 15;
      timeComps.min = (timeComps.min - increment + 60) % 60;
    }
    else if (compState == CompState::Year) {
      timeComps.yr = (timeComps.yr - 1) == 1999 ? 2099 : timeComps.yr - 1;
    }
    else if (compState == CompState::Month) {
      timeComps.mon = (timeComps.mon - 1) == 0 ? 12 : timeComps.mon - 1;
    }
    else if (compState == CompState::Date) {
      static uint8_t days[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
      uint8_t daysInMonth = days[timeComps.mon - 1];
      if (daysInMonth == 28 && timeComps.yr % 4 == 0) daysInMonth = 29;
      timeComps.date = timeComps.date == 1 ? daysInMonth : timeComps.date - 1;
    }
  }

  Time::Day dayofweek(uint8_t d, uint8_t m, uint16_t y) {
    static uint8_t t[] = { 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 };
    y -= m < 3; 
    return (Time::Day)((y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7 + 1);
  }

  void saveTimeComps() {
    if (setState == SetState::CurrentTime) {
      Time::Day day = dayofweek(timeComps.date, timeComps.mon, timeComps.yr);
      Time t(timeComps.yr, timeComps.mon, timeComps.date, timeComps.hr, timeComps.min, 0, day);
      rtc->time(t);
      msgLine1 = "Time is updated!";
      msgLine2 = "Remember battery";
    }
    else if (setState == SetState::OpenWeekdays) {
      weekdaysOpenSchedule.hr = timeComps.hr;
      weekdaysOpenSchedule.min = timeComps.min;
      EEPROM.put(sizeof(ScheduleComps) * 0, weekdaysOpenSchedule);
      msgLine1 = "Weekdays open";
      msgLine2 = "schedule is set!";
    }
    else if (setState == SetState::CloseWeekdays) {
      weekdaysCloseSchedule.hr = timeComps.hr;
      weekdaysCloseSchedule.min = timeComps.min;
      EEPROM.put(sizeof(ScheduleComps) * 1, weekdaysCloseSchedule);
      msgLine1 = "Weekdays close";
      msgLine2 = "schedule is set!";
    }
    else if (setState == SetState::OpenWeekends) {
      weekendsOpenSchedule.hr = timeComps.hr;
      weekendsOpenSchedule.min = timeComps.min;
      EEPROM.put(sizeof(ScheduleComps) * 2, weekendsOpenSchedule);
      msgLine1 = "Weekends open";
      msgLine2 = "schedule is set!";
    }
    else if (setState == SetState::CloseWeekends) {
      weekendsCloseSchedule.hr = timeComps.hr;
      weekendsCloseSchedule.min = timeComps.min;
      EEPROM.put(sizeof(ScheduleComps) * 3, weekendsCloseSchedule);
      msgLine1 = "Weekends close";
      msgLine2 = "schedule is set!";
    }
    else if (setState == SetState::OneTimeOpen) {
      oneTimeOpenDefaults.hr = timeComps.hr;
      oneTimeOpenDefaults.min = timeComps.min;
      EEPROM.put(sizeof(ScheduleComps) * 4, oneTimeOpenDefaults);
      msgLine1 = "Will open after";
      msgLine2 = String(timeComps.hr) + "hrs and " + String(timeComps.min) + "mins";

      unsigned long minutesAfter = timeComps.hr * 60 + timeComps.min;
      oneTimeOpenTimeout = millis() + minutesAfter * 60000;
      oneTimeOpenActive = true;
    }
  }

  bool isWeekend(Time::Day day) {
    return day == Time::Day::kSunday || day == Time::Day::kSaturday;
  }

  bool timeToOpen() {
    Time t = rtc->time();
    if (isWeekend(t.day)) {
      return weekendsOpenSchedule.hr == t.hr && weekendsOpenSchedule.min == t.min;
    }
    else {
      return weekdaysOpenSchedule.hr == t.hr && weekdaysOpenSchedule.min == t.min;
    }
  }

  bool timeToClose() {
    Time t = rtc->time();
    if (isWeekend(t.day)) {
      return weekendsCloseSchedule.hr == t.hr && weekendsCloseSchedule.min == t.min;
    }
    else {
      return weekdaysCloseSchedule.hr == t.hr && weekdaysCloseSchedule.min == t.min;
    }
  }

  void factoryReset() {
    Time t(2020, 3, 8, 14, 00, 00, Time::kSunday);
    rtc->time(t);

    for (int i = 0; i < EEPROM.length(); i++) {
      EEPROM.put(i, 0);
    }

    msgLine1 = "Time reset!";
    msgLine2 = "Schedule reset!";
  }
};



#endif