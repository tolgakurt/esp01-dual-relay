// Pin configuration.
#define PIN_OPEN 0
#define PIN_CLOSE 2
#define PIN_RX 3
#define SWITCH_DELAY 100 // in milliseconds
#define CURTAIN_ACTION_TIMEOUT 30000 // 30 seconds in milliseconds
#define SCHEDULED_ACTION_TIMEOUT 60000 // 1 minute in milliseconds

// NTP client configuration.
#define TIME_OFFSET 10800 // 3 hours in seconds, since Turkey uses GMT+3
#define TIME_DISPLAY_INTERVAL 60000 // 1 minute in milliseconds

// EEPROM configuration.
#define EEPROM_SIZE 1024
#define EXPECTED_SIGNATURE "Tolga Kurt"
#define SIGNATURE_ADDR 0
#define SIGNATURE_LEN 11
#define SIGNATURE_END '\0'
#define CONNECTION_STR_ADDR 11
#define CONNECTION_STR_LEN 244
#define CONNECTION_STR_END '\0'
#define SCHEDULE_ADDR 255
#define SCHEDULE_LEN 257
#define SCHEDULE_END 255
#define UPTIME_ADDR 512
#define UPTIME_LEN 344
#define UPTIME_DEFAULT 0
#define UPTIME_UPDATE_INTERVAL 5400000 // 90 minutes in milliseconds
#define STARTUP_ADDR 856
#define STARTUP_LEN 168
#define STARTUP_DEFAULT 0
#define EEPROM_IO_DELAY 4 // in milliseconds

// SOFT RESET CODES
#define RX_RESET 101
#define IOT_CONN_FAIL_RESET 102
#define WIFI_CONN_TIMEOUT_RESET 103

// IOT Hub configuration.
#define MESSAGE_MAX_LEN 256
#define MAX_COMMANDS 64
#define IOTHUB_MESSAGING_INTERVAL 2000 // 2 seconds in milliseconds
#define IOTHUB_RETRY_TIMEOUT 3600 // 1 hour in seconds
#define THREAD_SLEEP 100 // in milliseconds

// Other configuration.
#define LOOP_INTERVAL 100 // in milliseconds
#define RESTART_DELAY 3000 // 3 seconds in milliseconds