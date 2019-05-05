void configModeCallback(WiFiManager* myWiFiManager)
{
  Serial.println("Entered config mode.");
  Serial.println(WiFi.softAPIP());
  Serial.println(myWiFiManager->getConfigPortalSSID());
}

void initWiFi()
{
  wiFiManager.setAPCallback(configModeCallback);
  if (wiFiManager.autoConnect() == false)
  {
    Serial.println("Failed to connect and hit timeout.");
    writeResetEvent(WIFI_CONN_TIMEOUT_RESET);
    ESP.restart();
    delay(RESTART_DELAY);
  }
  Serial.println("Connected.");
}

void resetWiFiSettings()
{
  Serial.println("Resetting WiFi settings.");
  wiFiManager.resetSettings();
  delay(RESTART_DELAY);
}