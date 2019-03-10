void LCD_Main()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 1, 0 );
  lcd.print("FIT PARKING SENSOR");
  //------------------------
  lcd.setCursor ( 0, 1 );
  lcd.print ("A1=");
  lcd.setCursor ( 3, 1 );
  lcd.print (State[0]);
  lcd.setCursor ( 4, 1 );
  lcd.print ("/");
  lcd.setCursor ( 5, 1 );
  lcd.print (Distance[0]);
  lcd.setCursor ( 11, 1 );
  lcd.print ("A2=");
  lcd.setCursor ( 14, 1 );
  lcd.print (State[1]);
  lcd.setCursor ( 15, 1 );
  lcd.print ("/");
  lcd.setCursor ( 16, 1 );
  lcd.print (Distance[1]);

  lcd.setCursor ( 0, 2 );
  lcd.print ("A3=");
  lcd.setCursor ( 3, 2 );
  lcd.print (State[2]);
  lcd.setCursor ( 4, 2 );
  lcd.print ("/");
  lcd.setCursor ( 5, 2 );
  lcd.print (Distance[2]);
  lcd.setCursor ( 11, 2 );
  lcd.print ("A4=");
  lcd.setCursor ( 14, 2 );
  lcd.print (State[3]);
  lcd.setCursor ( 15, 2 );
  lcd.print ("/");
  lcd.setCursor ( 16, 2 );
  lcd.print (Distance[3]);

  lcd.setCursor ( 0, 3 );
  lcd.print ("A5=");
  lcd.setCursor ( 3, 3 );
  lcd.print (State[4]);
  lcd.setCursor ( 4, 3 );
  lcd.print ("/");
  lcd.setCursor ( 5, 3 );
  lcd.print (Distance[4]);

  lcd.setCursor ( 8, 3 );
  lcd.print ("Free Slot=");
  lcd.setCursor ( 18, 3 );
  lcd.print (Free_Slot);
  lcd.setCursor ( 19, 3 );
  lcd.print ("!");
}

void LCD_Init()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 0, 0 );
  lcd.print("FIT PARKING SENSOR");
  lcd.setCursor ( 0, 1 );
  lcd.print ("Nurul Anisah");
  lcd.setCursor ( 0, 2 );
  lcd.print ("6302130107");
  lcd.setCursor ( 0, 3 );
  lcd.print ("Telkom University");
  delay(3000);
  lcd.clear();
}

void LCD_Info()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 0, 0 );
  lcd.print("FIT PARK SENSOR V1");
  lcd.setCursor ( 0, 1 );
  lcd.print ("ARDUINO NANO V3 128");
  lcd.setCursor ( 0, 2 );
  lcd.print ("5x SENSOR HCSR-04");
  lcd.setCursor ( 0, 3 );
  lcd.print ("FIRMWARE HW V3");
  delay(3000);
  lcd.clear();
}

