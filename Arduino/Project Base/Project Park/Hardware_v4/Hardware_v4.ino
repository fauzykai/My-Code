#define REFRESH_INTERVAL 500 // interval dalam 1 loop
#define H_BAUD 9600 // baud rate yang dipakai untuk debug
#define SENS_NUM 4
#define LED_COLOR 1 // 1 = detect will green, 0 detect will red
//----------IR Settings----------
#include <SharpIR.h>
#define IR_PIN A7
#define IR_MODEL 1080
SharpIR SharpIR (IR_PIN,IR_MODEL);
#define IR_DETECT_MIN_DISTANCE 5 // deteksi objek minimum
#define IR_DETECT_MAX_DISTANCE 15 // deteksi objek maksimum
//----------LED Settings----------
#define LAMP_NUM 5
const int Led[LAMP_NUM] = {
  9, A0, A1, A2, A3
};
//----------Ping Settings----------
#include <NewPing.h> // ini Lib untuk baca sensor Ping
#define SONAR_NUM     3 // Banyaknya sensor yang dipakai
#define US_MAX_DISTANCE 100 // Batas maksimal pembacaan sensor, diatas nilai maksimal dijadikan 0
#define PING_INTERVAL 50 // Delay Antara Pembacaan Sensor, diatas 33ms untuk menghindari echo
#define US_DETECT_MIN_DISTANCE 5 // deteksi objek minimum
#define US_DETECT_MAX_DISTANCE 15 // deteksi objek maksimum
// jika nilai pembacaan sensor diantara nilai min dan maks, berarti objek terdeteksi

NewPing Sonar[SONAR_NUM] = {
  NewPing(3, 2, US_MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 1 (trigger pin, echo pin, jarak maksimum)
  NewPing(5, 4, US_MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 2 (trigger pin, echo pin, jarak maksimum)
  NewPing(7, 6, US_MAX_DISTANCE), //definisi pin yang dipakai untuk sensor ping urutan 3 (trigger pin, echo pin, jarak maksimum)
};
byte Distance[SENS_NUM]; // variable untuk menyimpan data nilai jarak objek
byte State[SENS_NUM]; // variable untuk menyimpan data status objek, 1 = ada, 0 = tidak ada
byte State_Temp[SENS_NUM]; // variable untuk menyimpan data status objek sebelumnya , 1 = ada, 0 = tidak ada
bool Match; // variable flag hasil perbandingan nilai status sekarang dengan sebelumnya, 1 = sama, 0 = tidak sama
char DebugVar[3];
void setup() {
  Serial.begin(H_BAUD); // baud rate yang dipakai untuk debug
  Serial.println("BRD V1 FW V41 Opt");
  //pinMode(BUZZ, OUTPUT);
  for (int i = 0 ; i < LAMP_NUM; i++)
  {
    pinMode(Led[i], OUTPUT);
  }
}

void loop() {
  Scan_Sensor_US();
  Scan_Sensor_IR();
  Debug_Sensor_Distance();
  //UDebug_Sensor_State();
  Led_Act();
  if ((Check_Arrays(State, State_Temp, SONAR_NUM)) != true) // scan, ada perubaham?
  {
    //Serial.println("berubah");
    Match = true; // reset var match
  }
  Fill_Temp();
  delay(REFRESH_INTERVAL);
}
