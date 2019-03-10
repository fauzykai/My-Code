#define REFRESH_RATE 1000
#define SAMPLE_RATE 10
#define HEADER "DLV1"
//----------LCD Settings----------
#include <LiquidCrystal_I2C.h> // Lib untuk menggunakan LCD jenis i2c
#include <LCD.h> // Lib untuk mempermudah coding LCD
#define I2CADDR 0x3F // alamat i2c LCD
#define BACKLIGHT_PIN 3 // declare PIN LCD
#define EN_PIN 2
#define RW_PIN 1
#define RS_PIN 0
#define D4_PIN 4
#define D5_PIN 5
#define D6_PIN 6
#define D7_PIN 7
LiquidCrystal_I2C lcd(I2CADDR, EN_PIN, RW_PIN, RS_PIN, D4_PIN, D5_PIN, D6_PIN, D7_PIN); // Set the LCD I2C address
//----------RTC Settings----------
#include <Wire.h>
#include "RTClib.h"
RTC_DS3231 rtc;
int tahun;
byte bulan, hari, jam, menit, detik;
//----------ACS Settings----------
#include "ACS712.h"
#define SENS_NUM 3
ACS712 ACS_SENS[SENS_NUM] = {
  ACS712 (ACS712_30A, A0), // type / pin
  ACS712 (ACS712_30A, A0),
  ACS712 (ACS712_30A, A0),
};
float ACS_CALIB[SENS_NUM] = { -0.03, 0, 0};
float ACS_OUT[SENS_NUM];
//----------VDIV Settings----------
float DENOM[SENS_NUM];
float R1[SENS_NUM] = {687000, 0, 0};
float R2[SENS_NUM] = {100600, 0, 0};
float VOLT_CALIB[SENS_NUM] = { -0.77, 0, 0};
int VOLT_PIN_SENS[SENS_NUM] = {A1, A1, A1};
float VOLT_OUT[SENS_NUM];
//----------MSD Settings----------
#include <SPI.h>
#include <SD.h>
const int chipSelect = 10;
//----------Timer Settings----------
unsigned long previousMillis = 0;
const long interval = 1000;
byte timer01 = 0;
void setup() {
  //rtc.adjust(DateTime(2017, 9, 11, 13, 17, 0));
  // put your setup code here, to run once:
  Serial.begin(9600);
  lcd.begin(16, 2);              // initialize the lcd
  lcd.setBacklightPin(BACKLIGHT_PIN, POSITIVE);
  lcd.setBacklight(HIGH);  // Switch on the backlight
  for (int i = 0; i <= SENS_NUM; i++)
  {
    DENOM[i] = R2[i] / ( R1[i] + R2[i] );
    ACS_SENS[i].calibrate();
  }
  MsdInit();
}

void loop() {

  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;

    readRTC();
    readACS();
    readVOLT();
    LCDshow3();
  //delay(REFRESH_RATE);
}
