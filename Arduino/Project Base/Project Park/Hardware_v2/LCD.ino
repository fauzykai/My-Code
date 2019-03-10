void LCD_Main()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 1, 0 );
  lcd.print("FIT PARKING SENSOR");
  //------------------------
  lcd.setCursor ( 0, 1 );
  lcd.print ("192.168.0.50");
  lcd.setCursor ( 15, 1 );
  lcd.print ("P=");
  lcd.setCursor ( 17, 1 );
  lcd.print ("800");
  //----------------------------
  lcd.setCursor ( 0, 2 );
  lcd.print (ESP_SSID);
  lcd.setCursor ( 10, 2 );
  lcd.print ("Connecting");
  //------------------------------
  lcd.setCursor ( 0, 4 );
  lcd.print ("1=");
  lcd.setCursor ( 2, 4 );
  lcd.print (State[0]);

  lcd.setCursor ( 4, 4 );
  lcd.print ("2=");
  lcd.setCursor ( 6, 4 );
  lcd.print (State[1]);

  lcd.setCursor ( 8, 4 );
  lcd.print ("3=");
  lcd.setCursor ( 10, 4 );
  lcd.print (State[2]);

  lcd.setCursor ( 12, 4 );
  lcd.print ("4=");
  lcd.setCursor ( 14, 4 );
  lcd.print (State[3]);

  lcd.setCursor ( 16, 4 );
  lcd.print ("5=");
  lcd.setCursor ( 18, 4 );
  lcd.print (State[4]);
  //delay ( 1000 );
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
  lcd.print ("FIRMWARE HW V1");
  lcd.setCursor ( 0, 2 );     
  lcd.print ("VB SW:FPSV1");
  lcd.setCursor ( 0, 3 );      
  lcd.print ("ESP8266-01:AT FIRM");
  delay(3000);
  lcd.clear();
}

