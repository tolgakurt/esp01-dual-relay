#ifndef BUTTONMANAGER_H_
#define BUTTONMANAGER_H_

#include "ButtonListener.h"

enum ButtonState {
  Meaningless = 1,
  CtlPressing,
  CtlShortPressed,
  CtlLongPressed,
  IncPressed,
  DecPressed
};

class ButtonManager {
public:
  ButtonManager() {
    btnCtlListener.initialize(BTN_CTL_PIN);
    btnIncListener.initialize(BTN_INC_PIN);
    btnDecListener.initialize(BTN_DEC_PIN);
  }

  ButtonState getState() {
    long currentTime = millis();

    if (currentTime - lastGetStateTime < GET_STATE_INTERVAL) return ButtonState::Meaningless;
    lastGetStateTime = currentTime;

    ButtonEvent btnCtlEvent = btnCtlListener.getEvent();
    ButtonEvent btnIncEvent = btnIncListener.getEvent();
    ButtonEvent btnDecEvent = btnDecListener.getEvent();

    uint8_t idleCount = 0;
    if (btnCtlEvent == ButtonEvent::Idle) idleCount++;
    if (btnIncEvent == ButtonEvent::Idle) idleCount++;
    if (btnDecEvent == ButtonEvent::Idle) idleCount++;

    if (idleCount != 2) return ButtonState::Meaningless;

    if (btnCtlEvent == ButtonEvent::JustPressed || btnCtlEvent == ButtonEvent::LongPressed) return ButtonState::CtlPressing;
    if (btnCtlEvent == ButtonEvent::ShortReleased) return ButtonState::CtlShortPressed;
    if (btnCtlEvent == ButtonEvent::LongReleased) return ButtonState::CtlLongPressed;
    if (btnIncEvent == ButtonEvent::ShortReleased || btnIncEvent == ButtonEvent::LongReleased) return ButtonState::IncPressed;
    if (btnDecEvent == ButtonEvent::ShortReleased || btnDecEvent == ButtonEvent::LongReleased) return ButtonState::DecPressed;

    return ButtonState::Meaningless;
  }

private:
  ButtonListener btnCtlListener;
  ButtonListener btnIncListener;
  ButtonListener btnDecListener;
  long lastGetStateTime = 0;
};

#endif