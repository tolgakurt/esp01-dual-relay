void initCurtainPins()
{
  Serial.println("Setting up curtain pin roles.");
  pinMode(PIN_CLOSE, OUTPUT);
  pinMode(PIN_OPEN, OUTPUT);
  delay(100);

  Serial.println("Initializing curtain pins as output.");
  digitalWrite(PIN_CLOSE, HIGH);
  digitalWrite(PIN_OPEN, HIGH);
}

void initRXPin()
{
  Serial.println("Setting up RX pin as an input.");
  pinMode(PIN_RX, INPUT_PULLUP);
  delay(100);
}

void openCurtain()
{
  Serial.println("Opening curtain...");
  curtainActing = true;
  curtainActionStart = millis();
  digitalWrite(PIN_CLOSE, HIGH); delay(SWITCH_DELAY);
  digitalWrite(PIN_OPEN, LOW); delay(SWITCH_DELAY);
}

void closeCurtain()
{
  Serial.println("Closing curtain...");
  curtainActing = true;
  curtainActionStart = millis();
  digitalWrite(PIN_OPEN, HIGH); delay(SWITCH_DELAY);
  digitalWrite(PIN_CLOSE, LOW); delay(SWITCH_DELAY);
}

void standByCurtain()
{
  Serial.println("Standing by curtain...");
  curtainActing = false;
  digitalWrite(PIN_OPEN, HIGH); delay(SWITCH_DELAY);
  digitalWrite(PIN_CLOSE, HIGH); delay(SWITCH_DELAY);
}
