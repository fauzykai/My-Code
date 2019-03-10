#include <Wire.h> //Lib untuk komunikasi i2c
#define REFRESH_INTERVAL 500 // interval dalam 1 loop
#define DEB_MODE 1 // 0 untuk debug state, 1 untuk debug jarak
#define H_BAUD 9600 // baud rate yang dipakai untuk debug
#define S_BAUD 9600 // baud rate yang dipakai untuk komunikasi dgn esp
#define BUZZ A3 // Deklarasi Pin Buzzer
#define LED 13 // Deklarasi Pin Led

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
  Serial.println("BRD V1 FW V3.1");
  pinMode(BUZZ, OUTPUT);
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
  delay(REFRESH_INTERVAL);
}
