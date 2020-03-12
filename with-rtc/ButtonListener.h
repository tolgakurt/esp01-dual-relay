#ifndef BUTTONLISTENER_H_
#define BUTTONLISTENER_H_

enum ButtonEvent {
  Idle = 1,
  JustPressed,
  LongPressed,
  ShortReleased,
  LongReleased
};

class ButtonListener {
public:
  ButtonListener() {}

  void initialize(int _btnPin) {
    btnPin = _btnPin;

    pinMode(btnPin, INPUT);
  }

  ButtonEvent getEvent() {
    if (digitalRead(btnPin) == HIGH) {
      if (lastEvent == ButtonEvent::Idle) {
        lastEvent = ButtonEvent::JustPressed;
        lastPressTime = millis();
      }
      else if (millis() - lastPressTime > LONG_PRESS_TIME && lastEvent == ButtonEvent::JustPressed) {
        lastEvent = ButtonEvent::LongPressed;
      }
    }
    else {
      if (lastEvent == ButtonEvent::JustPressed) {
        lastEvent = ButtonEvent::ShortReleased;
      }
      else if (lastEvent == ButtonEvent::LongPressed) {
        lastEvent = ButtonEvent::LongReleased;
      }
      else {
        lastEvent = ButtonEvent::Idle;
      }
    }
    return lastEvent;
  }

private:
  int btnPin;
  ButtonEvent lastEvent = ButtonEvent::Idle;
  long lastPressTime = 0;
};

#endif