#include <SoftwareSerial.h>
SoftwareSerial SIM800L(2, 3); // RX | TX
#include <Wire.h> //Lib untuk komunikasi i2c
#include <LiquidCrystal_I2C.h> // Lib untuk menggunakan LCD jenis i2c
#include <LCD.h> // Lib untuk mempermudah coding LCD
#define I2CADDR 0x27 // alamat i2c LCD 0x27 / 0x3f
#define BACKLIGHT_PIN 3 // declare PIN LCD
#define EN_PIN 2
#define RW_PIN 1
#define RS_PIN 0
#define D4_PIN 4
#define D5_PIN 5
#define D6_PIN 6
#define D7_PIN 7
LiquidCrystal_I2C lcd(I2CADDR, EN_PIN, RW_PIN, RS_PIN, D4_PIN, D5_PIN, D6_PIN, D7_PIN); // Set the LCD I2C address
#define BUZZ 12
#define REFRESH_INTERVAL 400

void setup() {
  pinMode(BUZZ, OUTPUT);
  // put your setup code here, to run once:
  lcd.begin(16, 2);              // initialize the lcd
  lcd.setBacklightPin(BACKLIGHT_PIN, POSITIVE);
  lcd.setBacklight(HIGH);  // Switch on the backlight
  Serial.begin(9600);
  SIM800L.begin(4800);
  lcd.print("EMERGENCY BUTTON");
  lcd.setCursor ( 0, 1);
  lcd.print("RX-012345-BDG");
  
  BEEPING(4, 100);
  SMS2();
  BEEPING(2, 100);
}

void loop() {
  // put your main code here, to run repeatedly:

}

int BEEPING(int x, int y)
{
  for (int i = 0 ; i < x ; i++)
  {
    digitalWrite(BUZZ, HIGH);
    delay(y);
    digitalWrite(BUZZ, LOW);
    delay(y);
  }
}
void SMS2()
{
  SIM800L.write("AT+CMGF=1\r\n");
  delay(1000);
  SIM800L.write("AT+CMGS=\"083820122335\"\r\n"); //vega
  //SIM800L.write("AT+CMGS=\"085317755816\"\r\n"); // p lucky
  delay(1000);
  SIM800L.write("01234-BDG-UBER-40611-1-KEBAKARAN");
  //Serial.println("kirim");
  //Serial.println(PBN);
  delay(1000);
  SIM800L.write((char)26);
  delay(1000);
  //BEEPING(5, 100);

}
