
//============================================================================================================================================================
// INISIALISASI
//============================================================================================================================================================
//-------------------------------------------------------------
//define EEPROM
//-------------------------------------------------------------
#include <EEPROM.h>

//-------------------------------------------------------------
//define GPS
//-------------------------------------------------------------
#include <TinyGPS++.h>
//#include <SoftwareSerial.h>

//-------------------------------------------------------------
//define LCD
//-------------------------------------------------------------
//stdlib.h
char buffer[40];
char t[10];

//-------------------------------------------------------------
//define RTC dan Kompas Digital
//-------------------------------------------------------------
#include "Wire.h"

//-------------------------------------------------------------
//define RTC
//-------------------------------------------------------------
#define DS3231_I2C_ADDRESS 0x68

//-------------------------------------------------------------
//define Kompas Digital
//-------------------------------------------------------------
#define address 0x1E //0011110b, I2C 7bit address of HMC5883

//-------------------------------------------------------------
//define servo
//-------------------------------------------------------------
#include <Servo.h>

//-------------------------------------------------------------
//define LCD
//-------------------------------------------------------------
#include "LCD12864RSPI.h"

//============================================================================================================================================================
// VARIABEL
//============================================================================================================================================================
//-------------------------------------------------------------
// kirim data via radio
//-------------------------------------------------------------
int kondisi = 0;
byte flip = 0;

//-------------------------------------------------------------
// simpan eeprom
//-------------------------------------------------------------
int addr_azimuth = 0;
int addr_elevasi = 1;
byte encoder_azimuth_eeprom;
byte encoder_elevasi_eeprom;

//-------------------------------------------------------------
// sub rutin servo holding
//-------------------------------------------------------------
int posisi_badan;
int kompas_hitung;
int servo_azimuth;
int servo_elevasi;
int servo_azimuth_out;
int servo_elevasi_out;
int buttonA=11;
int buttonB=12;
int stateA=0;
int stateB=0;

//-------------------------------------------------------------
// fuzzy LDR heliostat
//-------------------------------------------------------------
int max_servo_azimuth;
int min_servo_azimuth;
int max_servo_elevasi;
int min_servo_elevasi;
int toleransi_azimuth = 2;
int toleransi_elevasi = 2;

//-------------------------------------------------------------
// punya GPS
//-------------------------------------------------------------
//static const uint32_t GPSBaud = 9600;
TinyGPSPlus gps;
float gpslat;
float gpslon;
float gpsalt;

//-------------------------------------------------------------
// punya kompas digital
//-------------------------------------------------------------
int x,y,z; //triple axis data
float headingDegrees;

//-------------------------------------------------------------
// punya rotary encoder mode 2
//------------------------------------------------------------- 
int val; 

int encoder_elevasi_A = 3;
int encoder_elevasi_B = 4;
int encoder_elevasi_Pos = 0;
int encoder_elevasi_A_Last = LOW;
int n_elevasi = LOW;

int encoder_azimuth_A = 7;
int encoder_azimuth_B = 8;
int encoder_azimuth_Pos = 0;
int encoder_azimuth_A_Last = LOW;
int n_azimuth = LOW;

byte azimuth_kalibrasi;
byte elevasi_kalibrasi;

//-------------------------------------------------------------
// punya rotary encoder mode 3
//------------------------------------------------------------- 
int val_manual; 

int manual_elevasi_A = 3;
int manual_elevasi_B = 4;
int manual_elevasi_Pos = 0;
int manual_elevasi_A_Last = LOW;
int n_elevasi_manual = LOW;

int manual_azimuth_A = 7;
int manual_azimuth_B = 8;
int manual_azimuth_Pos = 0;
int manual_azimuth_A_Last = LOW;
int n_azimuth_manual = LOW;

byte azimuth_manual;
byte elevasi_manual;

//-------------------------------------------------------------
// punya servo
//-------------------------------------------------------------
int azimuth_out;
int elevasi_out;

//-------------------------------------------------------------
// punya servo
//-------------------------------------------------------------
Servo myservo1; //azimuth
Servo myservo2; //elevasi

int elevasi_ldr;    
int azimuth_ldr;

//-------------------------------------------------------------
// punya LDR
//-------------------------------------------------------------
int selisih_kanan;
int selisih_kiri;
int selisih_atas;
int selisih_bawah;

//-------------------------------------------------------------
// punya LDR-timer
//-------------------------------------------------------------
int waktu_sebelum = 0;
int waktu_sekarang= 0;
int interval = 10;

//-------------------------------------------------------------
// punya Mode 2-timer
//-------------------------------------------------------------
int waktu_sebelum_m2 = 0;
int waktu_sekarang_m2= 0;
int interval_m2 = 500;

//-------------------------------------------------------------
// punya Mode 3-timer
//-------------------------------------------------------------
int waktu_sebelum_m3 = 0;
int waktu_sekarang_m3= 0;
int interval_m3 = 500;

//-------------------------------------------------------------
// punya Rumus Heliostat
//-------------------------------------------------------------
float detik;
float menit; 
float jam;
float hari;
int tanggal;
int bulan;
int tahun;

float deltaT_GMT = 7; //selisih negara kita dengan Greenwicn Mean Time, perhatikan WIB WITA WIT
float LSTM; //Local Standard Time Meridian
float dayOfYear; //jumlah hari dihitung dari awal tahun
float B; //(360/365)(dayOfYear-81)
float B_rad;
float EoT; //Equation of Time
float TC; //Time Correction Factor
float LT; //Local Time in hours
float LST; //Local Solar Time
float HRA; //Hour Angle
float declination; //(23.45)sin[(360/365)(dayOfYear-81)]
double elevasi; //nilai elevasi hasil rumus, arcsin[sin declination sin phi + cos declination cos phi cos (HRA)] --> phi = latitude
double azimuth; //nilai azimuth hasil rumus, arcos[(sin declination cos tetha - cos declination sin tetha cos (HRA))/cos alpha] --> phi = latitude
double elevasi_temp; //nilai elevasi hasil rumus (masih dalam radian)
double azimuth_temp; //nilai azimuth hasil rumus (masih dalam radian)e
float alpha_utara; //90-phi+declination --> phi = latitude
float alpha_selatan; //90+phi-declination --> phi = latitude

float pi = 3.14159265;

//-------------------------------------------------------------
// punya LDR-ADC
//-------------------------------------------------------------
int LDR_Right_Bottom;// = analogRead(A0);
int LDR_Right_Top;//= analogRead(A1);
int LDR_Left_Bottom; //= analogRead(A2);
int LDR_Left_Top; //= analogRead(A3);

//-------------------------------------------------------------
// punya RTC
//-------------------------------------------------------------
byte second, minute, hour, dayOfWeek, dayOfMonth, month, year;

//-------------------------------------------------------------
// punya smoothmovement (action)
//-------------------------------------------------------------
int yawold = 0;
int yawnew = 0;
int pitchold = 0;
int pitchnew = 0;
int YawValue = 0;
int PitchValue = 0;
byte smoothstep = 5;
int smooth = 1;

int radiasi = 0;
byte lamacari = 10;
int tungguvalid =0;
boolean sleepmode;
byte toleransikompas;
int UVIN = A4;
byte pinaz=5;
byte pinel=6;

//============================================================================================================================================================
// UV sensor ML8511
//============================================================================================================================================================
int uvLevel;
float outputVoltage ;
float uvIntensity;

//============================================================================================================================================================
// SETUP
//============================================================================================================================================================

void setup()
{
  //-------------------------------------------------------------
  //setup untuk ambil arah kompas 
  //-------------------------------------------------------------
  gethead(); //kompass

  //-------------------------------------------------------------
  //setup untuk ambil waktu  
  //-------------------------------------------------------------
  gettime(); //rtc

  //-------------------------------------------------------------
  //setup untuk baca EEPROM 
  //-------------------------------------------------------------
  encoder_azimuth_eeprom = EEPROM.read(addr_azimuth);
  encoder_elevasi_eeprom = EEPROM.read(addr_elevasi);

  //--------------- Nilai Azimuth yg tersimpan
  if (encoder_azimuth_eeprom >= 127)
  {
    encoder_azimuth_Pos = encoder_azimuth_eeprom - 255;
  }
  else
  {
    encoder_azimuth_Pos = encoder_azimuth_eeprom;
  }

  //--------------- Nilai Elevasi yg tersimpan
  if (encoder_elevasi_eeprom >= 127)
  {
    encoder_elevasi_Pos = encoder_elevasi_eeprom - 255;
  }
  else
  {
    encoder_elevasi_Pos = encoder_elevasi_eeprom;
  }

  //-------------------------------------------------------------
  //setup untuk mengubah konstanta 
  //-------------------------------------------------------------
  pengaturan();

  Wire.begin();
  Serial.begin(9600); //debug USB (komputer)

  //-------------------------------------------------------------
  //setup untuk GPS
  //-------------------------------------------------------------
  Serial1.begin(9600); //baudrate GPS

  //-------------------------------------------------------------
  //setup untuk Radio
  //-------------------------------------------------------------
  Serial2.begin(9600); //baudrate Radio

  //-------------------------------------------------------------
  //setup untuk Sensor Radiasi
  //-------------------------------------------------------------
  Serial3.begin(9600); //baudrate Sensor Radiasi

  //-------------------------------------------------------------
  //setup servo
  //-------------------------------------------------------------
  myservo1.attach(pinaz,1020,2047);//azimuth ms1min=1020 ms1max=2047
  myservo2.attach(pinel,935,2250);//elevasi ms2min=935 ms2max=2250 

    //-------------------------------------------------------------
  //setup LCD
  //-------------------------------------------------------------
  LCDA.initialise();
  delay(100);

  //-------------------------------------------------------------
  //setup azimuth-elevasi auto
  //-------------------------------------------------------------
  elevasi_ldr = 20;
  azimuth_ldr = 20;

  //-------------------------------------------------------------
  //setup untuk switch mode
  //-------------------------------------------------------------
  pinMode(buttonA,INPUT);
  pinMode(buttonB,INPUT);

  //-------------------------------------------------------------
  //setup untuk rotary encoder
  //-------------------------------------------------------------
  pinMode (encoder_elevasi_A,INPUT);
  pinMode (encoder_elevasi_B,INPUT);
  pinMode (encoder_azimuth_A,INPUT);
  pinMode (encoder_azimuth_B,INPUT);
  
  //-------------------------------------------------------------
  //setup untuk pin Ultra Violet
  //-------------------------------------------------------------
  pinMode (UVIN, INPUT);
}

//============================================================================================================================================================
// PROGRAM UTAMA
//============================================================================================================================================================
void loop()
{
  //-------------------------------------------------------------
  //ambil waktu  
  //-------------------------------------------------------------
  gettime(); //rtc

  if (stateA==HIGH && stateB==HIGH)
  {
    baca_rotary();
    azimuth_kalibrasi = 90 + encoder_azimuth_Pos;
    elevasi_kalibrasi = 90 + encoder_elevasi_Pos;
    myservo1.write(azimuth_kalibrasi);
    myservo2.write(elevasi_kalibrasi);
  } 
  else if (stateA==LOW && stateB==HIGH)
  {
    baca_rotary_manual();
    azimuth_manual = 90 + manual_azimuth_Pos;
    elevasi_manual = 90 + manual_elevasi_Pos;
    myservo1.write(azimuth_manual);
    myservo2.write(elevasi_manual);
    //Serial.println("loop utama mode 3");
  }

  waktu_sekarang = millis();
  if(waktu_sekarang - waktu_sebelum > interval) 
  {
    waktu_sebelum = waktu_sekarang;
    //-------------------------------------------------------------
    //algoritma pilih mode
    //-------------------------------------------------------------
    stateA=digitalRead(buttonA);
    stateB=digitalRead(buttonB);
    //Serial.println(stateA);
    //Serial.println(stateB);
    if (stateA==HIGH && stateB==LOW)
    {
      if (jam <= 19 && jam >= 5)
      {
        Serial.println("mode1");
        mode1();
      }
      else if (sleepmode==true)
      {
        Serial.println("sleep mode");
        sleep_mode();
      }
      else
      {
        Serial.println("else mode1");
        mode1();
      }
    }
    else if (stateA==HIGH && stateB==HIGH)
    {
      //Serial.println("mode2");
      mode2();
    }
    else
    {
      Serial.println("mode3");
      mode3();
    }

    //Serial.println("loop");
    while (Serial1.available())
    {
      char c = Serial1.read();
      //if (gps.encode(c));
      //newData=true;
      gps.encode(c);
    }
  }
}

//=========================================================================================


















