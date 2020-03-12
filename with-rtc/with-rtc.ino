#include <stdio.h>
#include <Wire.h> 
#include <DS1302.h>
#include <LiquidCrystal_I2C.h>
#include "conf.h"
#include "ButtonManager.h"
#include "StateManager.h"

DS1302 rtc(RTC_CE_PIN, RTC_IO_PIN, RTC_CLK_PIN);
LiquidCrystal_I2C lcd(LCD_SLV_ADDR, LCD_COLS, LCD_ROWS);
ButtonManager buttons;
StateManager stateManager;

void setup() {
  Serial.begin(9600);

  pinMode(CURTAIN_OPEN_PIN, OUTPUT);
  pinMode(CURTAIN_CLOSE_PIN, OUTPUT);
  digitalWrite(CURTAIN_OPEN_PIN, LOW);
  digitalWrite(CURTAIN_CLOSE_PIN, LOW);

  rtc.writeProtect(false);
  Serial.print("Time at setup(): "); Serial.println(getFormattedTime());

  lcd.begin();
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(3, 0);
  lcd.print(STARTUP_MSG_LINE_1);
  lcd.setCursor(4, 1);
  lcd.print(STARTUP_MSG_LINE_2);

  stateManager.init(&rtc);

  delay(STARTUP_DELAY);
}

void loop() {
  ButtonState btnState = buttons.getState();
  Action action = stateManager.update(btnState);

  serializeAction(action);

  if (action.appState == AppState::NoDisplay) {
    stopCurtain();
    closeLCD();
  }
  else if (action.appState == AppState::InfoDisplay) {
    displayInfo();
  }
  else if (action.appState == AppState::SelectSet) {
    selectSet(action.setState);
  }
  else if (action.appState == AppState::TimeComp) {
    displayTimeComp(action.setState, action.compState, action.timeComps);
  }
  else if (action.appState == AppState::MessageDisplay) {
    displayMessage(action.msgLine1, action.msgLine2);
  }
  else if (action.appState == AppState::OpenCurtain) {
    displayMessage(action.msgLine1, action.msgLine2);
    openCurtain();
  }
  else if (action.appState == AppState::CloseCurtain) {
    displayMessage(action.msgLine1, action.msgLine2);
    closeCurtain();
  }
  else if (action.appState == AppState::StopCurtain) {
    displayMessage(action.msgLine1, action.msgLine2);
    stopCurtain();
  }

  delay(LOOP_DELAY);
}

void serializeAction(Action action) {
  if (action.appState == 0) return;

  Serial.println("=====================");
  Serial.print("App state: "); Serial.println(action.appState);
  Serial.print("Set state: "); Serial.println(action.setState);
  Serial.print("Comp state: "); Serial.println(action.compState);
  String formatted = String(action.timeComps.hr) + ":" + String(action.timeComps.min) + " " + String(action.timeComps.date) + "/" + String(action.timeComps.mon) + "/" + String(action.timeComps.yr);
  Serial.print("Time comps: "); Serial.println(formatted);
  Serial.print("Message line 1: "); Serial.println(action.msgLine1);
  Serial.print("Message line 2: "); Serial.println(action.msgLine2);
}

void closeLCD() {
  lcd.clear();
  lcd.noCursor();
  lcd.noBacklight();
}

void displayInfo() {
  lcd.clear();
  lcd.backlight();
  lcd.print(getFormattedTime());
}

void selectSet(SetState setState) {
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("Select category:");
  lcd.setCursor(0, 1);

  if (setState == SetState::OneTimeOpen) {
    lcd.print("One time open");
  }
  else if (setState == SetState::CurrentTime) {
    lcd.print("Current time");
  }
  else if (setState == SetState::OpenWeekdays) {
    lcd.print("Weekdays open");
  }
  else if (setState == SetState::CloseWeekdays) {
    lcd.print("Weekdays close");
  }
  else if (setState == SetState::OpenWeekends) {
    lcd.print("Weekends open");
  }
  else if (setState == SetState::CloseWeekends) {
    lcd.print("Weekends close");
  }
  else if (setState == SetState::FactoryReset) {
    lcd.print("Factory reset");
  }
}

void displayTimeComp(SetState setState, CompState compState, TimeComps timeComps) {
  lcd.clear();
  lcd.backlight();

  if (setState == SetState::OneTimeOpen) {
    lcd.print("Will open after");
  }
  else if (setState == SetState::CurrentTime) {
    lcd.print("Current time");
  }
  else if (setState == SetState::OpenWeekdays) {
    lcd.print("Weekdays open");
  }
  else if (setState == SetState::CloseWeekdays) {
    lcd.print("Weekdays close");
  }
  else if (setState == SetState::OpenWeekends) {
    lcd.print("Weekends open");
  }
  else if (setState == SetState::CloseWeekends) {
    lcd.print("Weekends close");
  }

  if (compState == CompState::Hour) {
    lcd.setCursor(0, 1);
    lcd.print("Set hour: ");
    lcd.print(timeComps.hr);
  }
  else if (compState == CompState::Minute) {
    lcd.setCursor(0, 1);
    lcd.print("Set minute: ");
    lcd.print(timeComps.min);
  }
  else if (compState == CompState::Year) {
    lcd.setCursor(0, 1);
    lcd.print("Set year: ");
    lcd.print(timeComps.yr);
  }
  else if (compState == CompState::Month) {
    lcd.setCursor(0, 1);
    lcd.print("Set month: ");
    lcd.print(timeComps.mon);
  }
  else if (compState == CompState::Date) {
    lcd.setCursor(0, 1);
    lcd.print("Set date: ");
    lcd.print(timeComps.date);
  }
}

void displayMessage(String line1, String line2) {
  lcd.clear();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print(line1);
  lcd.setCursor(0, 1);
  lcd.print(line2);
}

void openCurtain() {
  digitalWrite(CURTAIN_CLOSE_PIN, LOW);
  delay(CURTAIN_PIN_TIMEOUT);
  digitalWrite(CURTAIN_OPEN_PIN, HIGH);
}

void closeCurtain() {
  digitalWrite(CURTAIN_OPEN_PIN, LOW);
  delay(CURTAIN_PIN_TIMEOUT);
  digitalWrite(CURTAIN_CLOSE_PIN, HIGH);
}

void stopCurtain() {
  digitalWrite(CURTAIN_OPEN_PIN, LOW);
  digitalWrite(CURTAIN_CLOSE_PIN, LOW);
  delay(CURTAIN_PIN_TIMEOUT);
}

String formatDateComponent(int comp) {
  comp = comp % 1000;
  return comp < 10 ? "0" + String(comp) : String(comp);
}

String convertDayToAbbr(Time::Day day) {
  if (day == Time::Day::kSunday) return "Sun";
  if (day == Time::Day::kMonday) return "Mon";
  if (day == Time::Day::kTuesday) return "Tue";
  if (day == Time::Day::kWednesday) return "Wed";
  if (day == Time::Day::kThursday) return "Thu";
  if (day == Time::Day::kFriday) return "Fri";
  if (day == Time::Day::kSaturday) return "Sat";
}

String getFormattedTime() {
  Time t = rtc.time();
  String date = formatDateComponent(t.date);
  String mon = formatDateComponent(t.mon);
  String year = formatDateComponent(t.yr);
  String day = convertDayToAbbr(t.day);
  String hour = formatDateComponent(t.hr);
  String min = formatDateComponent(t.min);
  return date + "/" + mon + "/" + year + day + hour + ":" + min;
}