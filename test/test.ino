#define CLOSEPIN 0
#define OPENPIN 2
#define RESETPIN 3

void setup()
{
  // start serial monitor.
  Serial.begin(115200, SERIAL_8N1, SERIAL_TX_ONLY);

  // set pin roles.
  Serial.println("Setting up pin roles.");
  pinMode(CLOSEPIN, OUTPUT);
  pinMode(OPENPIN, OUTPUT);
  pinMode(RESETPIN, INPUT_PULLUP);
  pinMode(LED_BUILTIN, OUTPUT);

  // signal user.
  signalQuick(5, 200);
  delay(3000);

  // initialize output pins.
  Serial.println("Initializing output pins.");
  digitalWrite(CLOSEPIN, LOW);
  digitalWrite(OPENPIN, LOW);
  delay(1000);

  // signal user.
  signalQuick(10, 50);
  delay(3000);
}

bool isActing = false;
int action = 0; // 0 close, 1 standby, 2 open, 3 stand by
unsigned long actionStart = 0;
const int actionTimeout = 5 * 1000;

void loop()
{
  // light up the built-in led if the reset switch is closed.
  digitalWrite(LED_BUILTIN, digitalRead(RESETPIN));

  if (isActing && millis() > actionStart + actionTimeout)
  {
    isActing = false;
    action = (action + 1) % 4;
  }

  if (action == 0 && !isActing) {
    isActing = true;
    actionStart = millis();
    closeCurtain();
  }
  else if ((action == 1 || action == 3) && !isActing) {
    isActing = true;
    actionStart = millis();
    standByCurtain();
  }
  else if (action == 2 && !isActing) {
    isActing = true;
    actionStart = millis();
    openCurtain();
  }
}

void signalQuick(int n, int d)
{
  for (int i = 0; i < n; i++)
  {
    digitalWrite(LED_BUILTIN, LOW); delay(d);
    digitalWrite(LED_BUILTIN, HIGH); delay(d);
  }
}

void openCurtain()
{
  Serial.println("Opening curtain...");
  digitalWrite(CLOSEPIN, LOW); delay(100);
  digitalWrite(OPENPIN, HIGH); delay(100);
}

void closeCurtain()
{
  Serial.println("Closing curtain...");
  digitalWrite(OPENPIN, LOW); delay(100);
  digitalWrite(CLOSEPIN, HIGH); delay(100);
}

void standByCurtain()
{
  Serial.println("Standing by curtain...");
  digitalWrite(OPENPIN, LOW);
  digitalWrite(CLOSEPIN, LOW);
}


