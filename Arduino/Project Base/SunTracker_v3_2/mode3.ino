void mode3()
{
  kondisi = 3;
  baca_rotary_manual();
  gethead(); //kompass
  gettime(); //rtc
  getldr();
  getuv();
  //getgps();
  waktu_sekarang_m3 = millis();
  if(waktu_sekarang_m3 - waktu_sebelum_m3 > interval_m3) 
  {
    waktu_sebelum_m3 = waktu_sekarang_m3;
    mode1LCDA_manual();
    kirimdata();
  }
}

void baca_rotary_manual()
{
  //=============================================================================================================
  //                     Rotary Encoder Elevasi
  //=============================================================================================================

  n_elevasi_manual = digitalRead(manual_elevasi_A);
  if ((manual_elevasi_A_Last == LOW) && (n_elevasi_manual == HIGH))
  {
    if (digitalRead(manual_elevasi_B) == LOW && manual_elevasi_Pos <= 90 && manual_elevasi_Pos >= -90) 
    {
      manual_elevasi_Pos--;
    } 
    else 
    {
      manual_elevasi_Pos++;
    }
    Serial.print ("Encoder_Elevasi_manual = ");
    Serial.println (manual_elevasi_Pos);
  } 
  manual_elevasi_A_Last = n_elevasi_manual;

  //=============================================================================================================
  //                     Rotary Encoder Azimuth
  //=============================================================================================================

  n_azimuth_manual = digitalRead(manual_azimuth_A);
  if ((manual_azimuth_A_Last == LOW) && (n_azimuth_manual == HIGH))
  {
    if (digitalRead(manual_azimuth_B) == LOW) 
    {
      manual_azimuth_Pos--;
    } 
    else 
    {
      manual_azimuth_Pos++;
    }
    Serial.print ("Encoder_Azimuth_manual = ");
    Serial.println (manual_azimuth_Pos);
  } 
  manual_azimuth_A_Last = n_azimuth_manual;
} 

void mode1LCDA_manual()
{
  LCDA.clear();
  LCDA.printf(0, 0, "==MODE MANUAL==");
  LCDA.printf(0, 1, "UV Ints = %s", dtostrf(uvIntensity, 0, 2, t));
  LCDA.printf(0, 2, "Azimuth =%s", dtostrf(azimuth_manual, 6, 2, t));
  LCDA.printf(0, 3, "Elevasi =%s", dtostrf(elevasi_manual, 6, 2, t));
  /*LCDA.printf(0, 3, "%i", tanggal);
   LCDA.printf(1, 3, "/%i/", bulan);
   LCDA.printf(3, 3, "%i", tahun);
   LCDA.printf(5, 3, "%s", dtostrf(jam, 0, 0, t));
   LCDA.printf(6, 3, ":%s", dtostrf(menit, 0, 0, t));
   */
}

void action_manual()
{
  azimuth_manual = manual_azimuth_Pos + 90;
  elevasi_manual = manual_elevasi_Pos + 90;
  myservo1.write(azimuth_manual);
  myservo2.write(elevasi_manual);
}









