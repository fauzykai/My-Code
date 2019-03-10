#include <Wire.h> //Lib untuk komunikasi i2c
#define REFRESH_INTERVAL 500 // interval dalam 1 loop
#define DEB_MODE 1 // 0 untuk debug state, 1 untuk debug jarak
#define H_BAUD 9600 // baud rate yang dipakai untuk debug
#define S_BAUD 9600 // baud rate yang dipakai untuk komunikasi dgn esp
#define BUZZ A3 // Deklarasi Pin Buzzer
#define LED 13 // Deklarasi Pin Led
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
//----------Ping Settings----------
#include <NewPing.h> // ini Lib untuk baca sensor Ping
#define SONAR_NUM     5 // Banyaknya sensor yang dipakai
#define MAX_DISTANCE 100 // Batas maksimal pembacaan sensor, diatas nilai maksimal dijadikan 0
#define PING_INTERVAL 50 // Delay Antara Pembacaan Sensor, diatas 33ms untuk menghindari echo
#define DETECT_MIN_DISTANCE 5 // deteksi objek minimum
#define DETECT_MAX_DISTANCE 30 // deteksi objek maksimum
// jika nilai pembacaan sensor diantara nilai min dan maks, berarti objek terdeteksi

NewPing Sonar[SONAR_NUM] = {
  NewPing(12, 11, MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 1 (trigger pin, echo pin, jarak maksimum)
  NewPing(10, 9, MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 2 (trigger pin, echo pin, jarak maksimum)
  NewPing(8, 7, MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 3 (trigger pin, echo pin, jarak maksimum)
  NewPing(6, 5, MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 4 (trigger pin, echo pin, jarak maksimum)
  NewPing(4, A0, MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 4 (trigger pin, echo pin, jarak maksimum)
};
byte Distance[SONAR_NUM]; // variable untuk menyimpan data nilai jarak objek
byte State[SONAR_NUM]; // variable untuk menyimpan data status objek, 1 = ada, 0 = tidak ada
byte State_Temp[SONAR_NUM]; // variable untuk menyimpan data status objek sebelumnya , 1 = ada, 0 = tidak ada
bool Match; // variable flag hasil perbandingan nilai status sekarang dengan sebelumnya, 1 = sama, 0 = tidak sama
char DebugVar[3];
byte Used_Slot;
byte Free_Slot;

void setup() {
  Serial.begin(H_BAUD); // baud rate yang dipakai untuk debug
  Serial.println("FIT PARKING SENSOR V1");
  lcd.begin(20, 4);              // initialize the lcd
  lcd.setBacklightPin(BACKLIGHT_PIN, POSITIVE);
  lcd.setBacklight(HIGH);  // Switch on the backlight
  pinMode(BUZZ, OUTPUT);

  Initialize();
}

void loop() {
  Scan_Sensor();
  Debug();
  if ((Check_Arrays(State, State_Temp, SONAR_NUM)) != true) // scan, ada perubaham?
  {
    //Serial.println("berubah");
    Notify(2, 50);
    Match = true; // reset var match
  }
  Fill_Temp();
  LCD_Main();
  delay(REFRESH_INTERVAL);
}
