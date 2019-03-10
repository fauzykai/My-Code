int led = 13; // Pin 13
 
void setup()
{
pinMode(led, OUTPUT); // Set pin 13 as digital out
 
// Start up serial connection
Serial.begin(115200); // baud rate
Serial3.begin(115200); // baud rate
//Serial.flush();
Serial.println("test");
}
 
void loop()
{
String input = "";
 
// Read any serial input
while (Serial3.available() > 0)
{
input += (char) Serial3.read(); // Read in one char at a time
delay(5); // Delay for 5 ms so the next char has time to be received
}
 
if (input == "1")
{
digitalWrite(led, HIGH); // on
}
else if (input == "2")
{
digitalWrite(led, LOW); // off
}
}
