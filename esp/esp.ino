#include <Time.h>
#include <TimeLib.h>
#include <WiFiManager.h>
#include <WiFiUdp.h>
#include <EEPROM.h>
#include <AzureIoTHub.h>
#include <AzureIoTProtocol_MQTT.h>
#include <AzureIoTUtility.h>

#include "config.h"
#include "structs.h"

static WiFiManager wiFiManager;

static char* connectionStr;
static IOTHUB_CLIENT_LL_HANDLE iotHubClientHandle;

static unsigned char commandCount = 0;
static struct Command* commands;

static unsigned long lastUptimeUpdate = 0;

String getStartupInfo()
{
  String info = String("Startup info: ");
  info += String(ESP.getSdkVersion()) + " - ";
  info += String(ESP.getCoreVersion().c_str()) + " - ";
  info += String(ESP.getBootVersion()) + " - ";
  info += String(ESP.getBootMode()) + " - ";
  info += String(ESP.getCpuFreqMHz()) + " - ";
  info += String(ESP.getResetReason().c_str());
  return info;
}

void setup()
{
  String startupInfo = getStartupInfo();

  initSerial(false); // Initialize serial without RX disabled, since we will read connection string from serial.
  Serial.println(startupInfo);

  initEEPROM();
  initUptimeId();
  initStartupId();

  initCurtainPins();
  initWiFi();
  initTime();
  readConnectionStr();
  readSchedule();
  serializeSchedule();
  initSerial(true);
  initRXPin();

  iotHubClientHandle = IoTHubClient_LL_CreateFromConnectionString(connectionStr, MQTT_Protocol);
  if (iotHubClientHandle == NULL)
  {
    Serial.println("Failed on IoTHubClient_CreateFromConnectionString.");
    writeResetEvent(IOT_CONN_FAIL_RESET);
    ESP.restart();
    delay(RESTART_DELAY);
  }

  IoTHubClient_LL_SetOption(iotHubClientHandle, "product_info", "ESP8266-01");
  IoTHubClient_LL_SetConnectionStatusCallback(iotHubClientHandle, connectionStatusCallback, NULL);
  IoTHubClient_LL_SetRetryPolicy(iotHubClientHandle, IOTHUB_CLIENT_RETRY_INTERVAL, IOTHUB_RETRY_TIMEOUT);
  IoTHubClient_LL_SetMessageCallback(iotHubClientHandle, receiveMessageCallback, NULL);
  IoTHubClient_LL_SetDeviceMethodCallback(iotHubClientHandle, deviceMethodCallback, NULL);

  sendMessage(iotHubClientHandle, startupInfo.c_str());
}

static bool curtainActing = false;
static unsigned long curtainActionStart = 0;
static unsigned long scheduledActionStart = 0;
static unsigned long lastTimeDisplay = 0;

void loop()
{
  // Update the uptime if a certain period is passed.
  if (millis() > lastUptimeUpdate + UPTIME_UPDATE_INTERVAL)
  {
    updateUptime();
  }

  // If user pushed RX switch, reset WiFi credentials and then ESP.
  if (digitalRead(PIN_RX) == LOW)
  {
    resetWiFiSettings();
    writeResetEvent(RX_RESET);
    ESP.restart();
    delay(RESTART_DELAY);
  }

  // If the curtain is acting but the action needs to time out, stand by curtain.
  if (curtainActing && millis() > curtainActionStart + CURTAIN_ACTION_TIMEOUT)
  {
    standByCurtain();
  }

  // Display the time if a certain period is passed.
  if (lastTimeDisplay == 0 || millis() > lastTimeDisplay + TIME_DISPLAY_INTERVAL)
  {
    displayTime();
  }

  // Check if any scheduled curtain action should be triggered, if the last
  // scheduled action start is timed out.
  if (millis() > scheduledActionStart + SCHEDULED_ACTION_TIMEOUT)
  {
    checkSchedule();
  }

  // Take care of any IOT Hub communication events.
  IoTHubClient_LL_DoWork(iotHubClientHandle);
  ThreadAPI_Sleep(THREAD_SLEEP);

  delay(LOOP_INTERVAL);
}
