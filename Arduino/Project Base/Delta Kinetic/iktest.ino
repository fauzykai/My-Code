#include <Servo.h>

char r, s;
String mystring, header, xstring, ystring, zstring, ledvstring, pumpvstring, footer;
int xv, yv, zv, ledv, pumpv;

float t1, t2, t3;
float x, y, z, t;
float theta1, theta2, theta3, theta;


Servo myservo1; //9
Servo myservo2; //10
Servo myservo3; //11
byte ledpin = 3;
byte pumppin = 6;

void setup() {
  Serial.begin(38400);
  myservo3.attach(9);
  myservo2.attach(10);
  myservo1.attach(11);
  x = 20.051;
  y = -34.344;
  z = -439.259;
  hitung();
}

void loop() {

  while (Serial.available())
  {
    r = Serial.read();
    mystring = mystring + r;
  }
  if (mystring != "")
  {
    parsing();
    fback();
    if (header == "te")
    {
      x=xv;
      y=yv;
      z=zv;
      Serial.println("Format Serial Benar");
      hitung();
      if (theta1 >= 0 && theta2 >= 0 && theta3 >= 0 && t2==0)
      {
        Serial.println("Eksekusi");
        eksekusi();
      }
      else
      {
        Serial.println("Tidak bisa Eksekusi (ada nilai minus)");
        eksekusi();
      }
    }
    else
    {
      Serial.println("Format Serial Salah") ;
    }
  }
  delay(100);
  mystring = "";
  //footer = "";
  header = "";

}
