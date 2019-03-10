void mode1()
{
  posisi_badan = headingDegrees;
  getuv();
  if ((!(posisi_badan >= 0 && posisi_badan <= (0+toleransikompas)) && (!(posisi_badan >= (360-toleransikompas) && posisi_badan <= 360))))
  {
    kondisi = 11;
    gethead(); //kompass
    LCDA.clear();
    LCDA.printf(0, 0, " ==ARAH SALAH==");
    LCDA.printf(0, 1, "  arahkan alat");
    LCDA.printf(0, 2, "hingga kompas 0");
    LCDA.printf(0, 3, "Kompas = %s", dtostrf(headingDegrees, 6, 2, t));
    azimuth_out = 90 + encoder_azimuth_Pos;
    elevasi_out = 90 + encoder_elevasi_Pos;
    myservo1.write(azimuth_out);
    myservo2.write(elevasi_out);
    delay(1000); 
  }
  else
  {
    if (tungguvalid <= lamacari) //jika tunggu valid kurang dari batas waktu (5 mnt diawal nyala)
    {
      kondisi = 121;
      getgps();
      ////gettime(); //rtc
      gethead(); //kompass
      getldr(); //ldr
      Serial.println("loopnya jika tunggu valid");
      if (gps.location.isValid() == true)
      {
        kondisi = 1211;
        //getuv();
        Rumus_Matahari(); //helio
        servo_hold(); //
        azimuth_elevasi_auto(); // nambah ldr
        yawnew = azimuth_ldr;
        pitchnew = elevasi_ldr;
        action();

        mode1LCDA();
        delay(2000);
        mode1LCDB();
        delay(2000);
        Serial.println("loopnya jika sudah valid");
      }
      else
      {
        kondisi = 1212;
        mode1LCDC(); //gps masih null
        azimuth_out = 90 + encoder_azimuth_Pos;
        elevasi_out = 90 + encoder_elevasi_Pos;
        myservo1.write(azimuth_out);
        myservo2.write(elevasi_out); 
        delay(5000);
        Serial.println("loopnya else (ngga valid)");
      }
      tungguvalid++;
      Serial.print("jumlah looping ke = ");
      Serial.println(tungguvalid);
    }
    else if (tungguvalid > lamacari && (gps.location.isValid() == true) ) //jika sudah lama & gps sudah dapet nilai valid
    {
      kondisi = 122;
      //gettime(); //rtc
      gethead(); //kompass
      getldr(); //ldr
      //getuv();
      Rumus_Matahari(); //helio
      servo_hold(); //
      azimuth_elevasi_auto(); // nambah ldr
      yawnew = azimuth_ldr;
      pitchnew = elevasi_ldr;
      action();

      mode1LCDA();
      delay(2000);
      mode1LCDB();
      delay(2000);
      Serial.println("loopnya jika sudah lama dan gps valid ");
    }
    else // gps gak valid valid & lebih dari batas waktu
    {
      kondisi = 123;
      getgps();
      gpslat = -6.914744; //latitude Bandung
      gpslon = 107.609810; //longitude Bandung
      gpsalt = 778; //altitude Bandung
      //gettime(); //rtc
      gethead(); //kompass
      getldr(); //ldr
      //getuv();
      Rumus_Matahari(); //helio
      servo_hold(); //
      azimuth_elevasi_auto(); // nambah ldr
      yawnew = azimuth_ldr;
      pitchnew = elevasi_ldr;
      action();

      mode1LCDA();
      delay(2000);
      mode1LCDB();
      delay(2000);
      Serial.println("loopnya gps ngga valid dan lebih dr batas waktu");
    }
  }
  kirimdata();
}
void mode1LCDA()
{
  LCDA.clear();
  LCDA.printf(0, 0, "UV Ints = %s", dtostrf(uvIntensity, 0, 2, t));
  LCDA.printf(0, 1, "Azimuth =%s", dtostrf(azimuth, 6, 2, t));
  LCDA.printf(0, 2, "Elevasi =%s", dtostrf(elevasi, 6, 2, t));
  LCDA.printf(0, 3, "%i", tanggal);
  LCDA.printf(1, 3, "/%i/", bulan);
  LCDA.printf(3, 3, "%i", tahun);
  LCDA.printf(5, 3, "%s", dtostrf(jam, 0, 0, t));
  LCDA.printf(6, 3, ":%s", dtostrf(menit, 0, 0, t));
}
void mode1LCDB()
{
  LCDA.clear();
  LCDA.printf(0, 0, "Lat  =%s", dtostrf(gpslat, 6, 2, t));
  LCDA.printf(0, 1, "Lon  =%s", dtostrf(gpslon, 6, 2, t));
  LCDA.printf(0, 2, "Alt  =%s", dtostrf(gpsalt, 6, 2, t));
  LCDA.printf(0, 3, "Head =%s", dtostrf(headingDegrees, 6, 2, t));
}
void mode1LCDC() // kalo belum dapet gps
{
  LCDA.clear();
  LCDA.printf(0, 0, "UV ints = %s", dtostrf(uvIntensity, 0, 2, t));
  LCDA.printf(0, 1, "Azimuth = NULL");
  LCDA.printf(0, 2, "Elevasi = NULL");
  LCDA.printf(0, 3, "%i", tanggal);
  LCDA.printf(1, 3, "/%i/", bulan);
  LCDA.printf(3, 3, "%i", tahun);
  LCDA.printf(5, 3, "%s", dtostrf(jam, 0, 0, t));
  LCDA.printf(6, 3, ":%s", dtostrf(menit, 0, 0, t));
}
void debugalldata()
{
  //gpslat = -6.914744;
  //gpslon = 107.609810;
  //gpsalt = 778;
  getgps();
  printgps();
  //gettime();
  printtime();
  gethead();
  printhead();
  getldr();
  printldr();
  print_rh();
  servo_hold();
  Serial.println("--------------------------------------------------------");
}


















