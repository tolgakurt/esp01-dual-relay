#ifndef CONF_H_
#define CONF_H_

#define RTC_CE_PIN 11 // RTC Chip Enable
#define RTC_IO_PIN 10 // RTC Input/Output
#define RTC_CLK_PIN 9 // RTC Serial Clock
#define LCD_SLV_ADDR 0x27 // LCD I2C Slave Address
#define LCD_COLS 16 // LCD Column Count
#define LCD_ROWS 2 // LCD Row Count
#define BTN_CTL_PIN 5 // Control Button Pin
#define BTN_INC_PIN 6 // Increment Button Pin
#define BTN_DEC_PIN 7 // Decrement Button Pin
#define LONG_PRESS_TIME 500 // Amount of Time in Milliseconds for Long Press
#define GET_STATE_INTERVAL 25 // Amount of TIme in Milliseconds to Not Detect Another Button State
#define STARTUP_DELAY 6000 // Amount of Time in Milliseconds for startup delay
#define STARTUP_MSG_LINE_1 "YARRAMI YE" // Message to display at startup, line 1
#define STARTUP_MSG_LINE_2 "KUTALMIS" // Message to display at startup, line 2
#define DISPLAY_INFO_TIMEOUT 5000 // Amount of time in Milliseconds to close lcd in display info state
#define SET_IDLE_TIMEOUT 10000 // Amount of time in Milliseconds to close lcd in set state
#define ACTION_ACK_TIMEOUT 3000 // Amount of time in Milliseconds to close lcd in message display
#define CURTAIN_ACTION_TIMEOUT 30000 // Amount of time in Milliseconds for curtain actions
#define CURTAIN_OPEN_PIN 3
#define CURTAIN_CLOSE_PIN 4
#define CURTAIN_PIN_TIMEOUT 50 //Amount of time to wait after setting a curtain pin
#define LOOP_DELAY 10 // Amount of time to wait in between Arduino loops

#endif