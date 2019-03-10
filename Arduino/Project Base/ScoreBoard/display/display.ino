byte digit1 = 24; //PWM Display pin 1
byte digit2 = 25; //PWM Display pin 2
byte digit3 = 26; //PWM Display pin 6
byte digit4 = 27; //PWM Display pin 8
byte digit5 = 28;

byte segA = 0; //Display pin 14
byte segB = 1; //Display pin 16
byte segC = 2; //Display pin 13
byte segD = 3; //Display pin 3
byte segE = 4; //Display pin 5
byte segF = 5; //Display pin 11
byte segG = 6; //Display pin 15

void setup() {
  // put your setup code here, to run once:
  pinMode(segA, OUTPUT);
  pinMode(segB, OUTPUT);
  pinMode(segC, OUTPUT);
  pinMode(segD, OUTPUT);
  pinMode(segE, OUTPUT);
  pinMode(segF, OUTPUT);
  pinMode(segG, OUTPUT);

  pinMode(digit1, OUTPUT);
  pinMode(digit2, OUTPUT);
  pinMode(digit3, OUTPUT);
  pinMode(digit4, OUTPUT);
  pinMode(digit5, OUTPUT);
  Serial.begin(9600);
  tampil("12");
}

void loop() {
  // put your main code here, to run repeatedly:
//tampil("1234");
}

void tampil (char* number)
{
  
int len = strlen(number);
Serial.println(len);  
  }
