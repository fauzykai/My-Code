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
String NUMBER1 =  "083820122335";
//#define NUMBER2 "083820122335"
String IDX = "01234-BDG-UBER-40611-";
//be update
//id & num var
//battery backup
//rtc
//pending notify
//cek pulsa
//pressed notify
//my info

int LED[] = {A2, 5, 7, 9, 11};
int PB[] = {A3, 4, 6, 8, 10};
byte PBS[6];
byte PBN;
char* STAT;
String ATCMGS;
String CONTENT;
char ATCMGSFIN[30];
char CONTENTFIN[30];
void setup() {
  // put your setup code here, to run once:
  for (int i = 0; i < 5; i++)
  {
    pinMode(LED[i], OUTPUT);
    pinMode(PB[i], INPUT);
  }
  pinMode(BUZZ, OUTPUT);
  //pinMode(PB2, INPUT);

  lcd.begin(16, 2);              // initialize the lcd
  lcd.setBacklightPin(BACKLIGHT_PIN, POSITIVE);
  lcd.setBacklight(HIGH);  // Switch on the backlight
  //lcd.print("EMERGENCY BUTTON");
  //lcd.setCursor ( 0, 1);
  //lcd.print("ID = 40611-BDG");
  Serial.begin(9600);
  SIM800L.begin(9600);
  delay(2000);
  BEEPING(3, 100);
}

void loop() {
  // put your main code here, to run repeatedly:
  SCANPB();
  STATING();
  //DISPLAYING();
  LEDACT();
  //Serial.println(stat);
  //BLINKING(10, 1, 50);
  delay(REFRESH_INTERVAL);
  PBN = 0;
}

void SMS1()
{
  SIM800L.write("AT+CMGF=1\r\n");
  delay(1000);
  ATCMGS = "AT+CMGS=\""+NUMBER1 + "\"\r\n";
  ATCMGS.toCharArray(ATCMGSFIN,30);
  SIM800L.write(ATCMGSFIN);
  //SIM800L.write("AT+CMGS=\"083820122335\"\r\n");
  delay(1000);
  CONTENT = IDX + STAT;
  CONTENT.toCharArray(CONTENTFIN,30);
  //SIM800L.write(IDX+STAT);
  SIM800L.write(CONTENTFIN);
  //SIM800L.write(STAT);
  delay(1000);
  SIM800L.write((char)26);
  delay(1000);
  BEEPING(2, 100);
}
void SMS2()
{ 
    SIM800L.write("AT+CMGF=1\r\n");
    delay(1000);
    //SIM800L.write("AT+CMGS=\"083820122335\"\r\n"); //vega
    SIM800L.write("AT+CMGS=\"085317755816\"\r\n"); // p lucky
    delay(1000);
    switch (PBN)
    {
    case 1:
    SIM800L.write("01234-BDG-UBER-40611-1-KEBAKARAN");
    //Serial.println("ahai");
    break;
    case 2:
    SIM800L.write("01234-BDG-UBER-40611-2-BANJIR");
    break;
    case 3:
    SIM800L.write("01234-BDG-UBER-40611-3-HURUHARA");
    break;
    case 4:
    SIM800L.write("01234-BDG-UBER-40611-4-GEMPABUMI");
    break;
    case 5:
    SIM800L.write("01234-BDG-UBER-40611-5-PENYELAMATAN");
    break;
    default:
    break;
    }
    Serial.println("kirim");
    Serial.println(PBN);
    delay(1000);
    SIM800L.write((char)26);
    delay(1000);
    BEEPING(5, 100);
  
}
void DISPLAYING()
{
  BLINKING(10, PBN, 100);
  lcd.clear();
  //delay(100);
  lcd.setCursor ( 0, 0);
  lcd.print(STAT);
  delay(100);
  lcd.setCursor ( 0, 1);
  lcd.write("MENGIRIM SMS");
  SMS2();
  delay(3000);
  BLINKING(20, PBN, 200);
  lcd.clear();
  lcd.setCursor ( 0, 0 );
  lcd.print(STAT);
  lcd.setCursor ( 0, 1 );
  lcd.print("SMS TERKIRIM");

  delay(3000);
}
int BLINKING(int x, int y, int z)
{
  for (int i = 0 ; i < x ; i++)
  {
    digitalWrite(LED[y - 1], HIGH);
    delay(z);
    digitalWrite(LED[y - 1], LOW);
    delay(z);
  }
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
void CLEARING()
{
  lcd.clear();
  lcd.print("EMERGENCY BUTTON");
  lcd.setCursor ( 0, 1);
  lcd.print("40611-UBER-BDG");
}

void STATING()
{
  switch (PBN)
  {
    case 1:
      STAT = "BANJIR";
      DISPLAYING();
      break;
    case 2:
      STAT = "KEBAKARAN";
      DISPLAYING();
      break;
    case 3:
      STAT = "LONGSOR";
      DISPLAYING();
      break;
    case 4:
      STAT = "PENCURIAN";
      DISPLAYING();
      break;
    case 5:
      STAT = "BENCANA-5";
      DISPLAYING();
      break;
    default:
      CLEARING();
      break;
  }

}

void SCANPB()
{
  for (int i = 0 ; i < 5 ; i++)
  {
    PBS[i] = digitalRead(PB[i]);
    if (PBS[i] == HIGH)
    {
      //Serial.print("0");
    }
    else {
      //Serial.print("1");
      PBN = i + 1;
    }
  }
  //Serial.println("");
}
void LEDACT2()
{
  for (int i = 0 ; i < 5 ; i++)
  {
    if (PBS[i] == LOW)
    { digitalWrite(LED[i], HIGH);
    }

    else
    {
      digitalWrite(LED[i], LOW);
    }
  }
}

void LEDACT()
{
  for (int i = 0 ; i < 5 ; i++)
  {
    digitalWrite(LED[i], HIGH);

    delay(70);
    digitalWrite(LED[i], LOW);
    //delay(100);
  }
}

