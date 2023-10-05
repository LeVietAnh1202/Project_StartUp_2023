#define flameSensorDigit  D7
#define flameSensorAna  A0
#define led  D5

void setup() 
{
  Serial.begin(9600);
  pinMode(flameSensorDigit, INPUT);
  pinMode(flameSensorAna, INPUT);
  pinMode(led, OUTPUT);
}

void loop() 
{
  int digitValue = digitalRead(flameSensorDigit);
  Serial.print(digitValue);
  Serial.print("   ");
  Serial.println(analogRead(flameSensorAna));
  if (digitValue == 0) {
    digitalWrite(led, LOW);
  }
  else {
    digitalWrite(led, HIGH);
  }
}
