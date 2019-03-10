/*
  Mega multple serial test
 
 Receives from the main serial port, sends to the others. 
 Receives from serial port 1, sends to the main serial (Serial 0).
 
 This example works only on the Arduino Mega
 
 The circuit: 
 * Any serial device attached to Serial port 1
 * Serial monitor open on Serial port 0:
 
 created 30 Dec. 2008
 by Tom Igoe
 
 This example code is in the public domain.
 
 */


void setup() {
  // initialize both serial ports:
  Serial.begin(9600);
  Serial1.begin(9600);
  Serial2.begin(9600);
  Serial3.begin(9600);
  pinMode(13, OUTPUT);
}

void loop() {
  // read from port 1, send to port 0:
  
    Serial.print("s0");
    Serial.print(""
    );
   Serial1.print("s1");
   Serial2.print("s2"); 
   Serial3.print("s3");             
delay(300); 

  digitalWrite(13, HIGH);   // set the LED on
  delay(100);
  digitalWrite(13, LOW);   // set the LED on
  delay(100);
  digitalWrite(13, HIGH);   // set the LED on
  delay(100);
  digitalWrite(13, LOW);   // set the LED on
  delay(1000);
}
