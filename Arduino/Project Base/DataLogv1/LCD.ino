void LCDshow()
{
  timer01++;
  if (timer01 > 9 )
  {
    timer01 = 0;
  }
  else if (timer01 > 6 )
  {
    LCDshow3();
  }
  else if (timer01 > 3)
  {
    LCDshow2();
  }
  else if (timer01 < 3)
  {
    LCDshow1();
  }
  //Logging();
}
}


void LCDshow1()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 0, 0 );
  lcd.print("VS"); // v source
  lcd.print(VOLT_OUT[0]); // v source

  lcd.setCursor ( 8, 0 );
  lcd.print("VL"); // v load
  lcd.print("11.6"); // v load

  lcd.setCursor ( 0, 1 );
  lcd.print("AS"); // a source
  lcd.print(ACS_OUT[0]); // a source

  lcd.setCursor ( 8, 1 );
  lcd.print("AL"); // a load
  lcd.print("16.2"); // a load

  /*
    mode 1 (detail)
    VS   AS  WS
    VS   AL  WL

    mode 2 (time)
    30/12/2017
    diff : +50W / 30%

    WS    WL    DIFF
  */
}

void LCDshow2()
{
  lcd.home ();
  lcd.clear();
  lcd.setCursor ( 0, 0 );
  lcd.print(hari);
  lcd.print("/");
  lcd.print(bulan);
  lcd.print("/");
  lcd.print(tahun - 2000);
  lcd.print("-");
  lcd.print(jam);
  lcd.print(":");
  lcd.print(menit);
  lcd.print(":");
  lcd.print(detik);

  lcd.setCursor ( 0, 1 );
  lcd.print("Diff:");
  lcd.print("+");
  lcd.print("60");
  lcd.print("W/");
  lcd.print("20");
  lcd.print("%");
}


void LCDshow3()
{
  lcd.setCursor ( 0, 0 );
  lcd.print("In:");
  lcd.print("280");
  lcd.print("W");

  lcd.setCursor ( 11, 0 );
  lcd.print("VB:");

  lcd.setCursor ( 0, 1 );
  lcd.print("Out:");
  lcd.print("280");
  lcd.print("W");

  lcd.setCursor ( 11, 1 );
  lcd.print("%B:");


}

