void servo_hold()
{
  servo_elevasi = elevasi;
  //servo_azimuth = 0;

  if (azimuth > 180)
  {
    kompas_hitung = 180 - azimuth;
    kompas_hitung = 360 + kompas_hitung;
    Serial.print("kompas equivalen azimuthnya > 180 = ");
    Serial.println(kompas_hitung);
  }
  else
  {
    kompas_hitung = 180 - azimuth;
    Serial.print("kompas equivalen azimuthnya < 180 = ");
    Serial.println(kompas_hitung);
  }

  if (kompas_hitung > 180)
  {
    servo_azimuth = 360 - kompas_hitung;
    Serial.print("servo_azimuth > 180= ");
    Serial.println(servo_azimuth);
    if (servo_elevasi <= 90)
    {
      servo_elevasi = 180 - servo_elevasi;
      Serial.print("servo_elevasi < 90= ");
      Serial.println(servo_elevasi);
    }
    else
    {
      servo_elevasi = 90 - servo_elevasi;
      Serial.print("servo_elevasi > 90= ");
      Serial.println(servo_elevasi);
    }
  }
  else
  {
    servo_azimuth = kompas_hitung;
    Serial.print("servo_azimuth < 180 = ");
    Serial.println(servo_azimuth);

    servo_elevasi = servo_elevasi;
    Serial.print("servo_elevasi = ");
    Serial.println(servo_elevasi);

  }
  max_servo_azimuth = servo_azimuth + toleransi_azimuth;
  min_servo_azimuth = servo_azimuth - toleransi_azimuth;

  max_servo_elevasi = servo_elevasi + toleransi_elevasi;
  min_servo_elevasi = servo_elevasi - toleransi_elevasi;

  Serial.print("posisi badan = ");
  Serial.println(posisi_badan);

  //Serial.print("max_servo_azimuth = ");
  //Serial.println(max_servo_azimuth);
  //Serial.print("min_servo_azimuth = ");
  //Serial.println(min_servo_azimuth);
  //Serial.print("max_servo_elevasi = ");
  //Serial.println(max_servo_elevasi);
  //Serial.print("min_servo_elevasi = ");
  //Serial.println(min_servo_elevasi);
}

void action()
{
  azimuth_out = azimuth_ldr + encoder_azimuth_Pos;
  elevasi_out = elevasi_ldr + encoder_elevasi_Pos;
  if (azimuth_out < 0)
  {
    azimuth_out = 0;
  } 
  else if (azimuth_out > 180)
  {
    azimuth_out = 180;
  } 
  else
  {
    azimuth_out = azimuth_ldr + encoder_azimuth_Pos;
  }

  if (elevasi_out < 0)
  {
    elevasi_out = 0;
  } 
  else if (elevasi_out > 180)
  {
    elevasi_out = 180;
  } 
  else
  {
    elevasi_out = elevasi_ldr + encoder_elevasi_Pos;
  }

  Serial.print("encoder_azimuth_Pos =  ");
  Serial.println(encoder_azimuth_Pos);
  Serial.print("encoder_elevasi_Pos =  ");
  Serial.println(encoder_elevasi_Pos);
  myservo1.write(azimuth_out);
  myservo2.write(elevasi_out);
}

void sleep_mode()
{
  kondisi = 4;
  gettime(); //rtc

  azimuth_out = 90 + encoder_azimuth_Pos;
  elevasi_out = 90 + encoder_elevasi_Pos;
  myservo1.write(azimuth_out);
  myservo2.write(elevasi_out); 

  LCDA.clear();
  LCDA.printf(0, 0, " ==SLEEP MODE==");
  LCDA.printf(0, 1, "zzZZZ...");
  LCDA.printf(0, 3, "%i", tanggal);
  LCDA.printf(1, 3, "/%i/", bulan);
  LCDA.printf(3, 3, "%i", tahun);
  LCDA.printf(5, 3, "%s", dtostrf(jam, 0, 0, t));
  LCDA.printf(6, 3, ":%s", dtostrf(menit, 0, 0, t));
  delay(5000);
}
void inisial()
{
  int dlysm = 2500;

  //myservo1.write(0);
  //myservo2.write(0);
  delay(dlysm);
  myservo1.write(90);
  myservo2.write(90);
  delay(dlysm);
  //myservo1.write(180);
  myservo2.write(180);
  delay(dlysm);
  //myservo1.write(90);
  myservo2.write(90);
  delay(dlysm);
}

void kirimdata()
{
  //byte x = 0;
  //LPN,status,tanggal,bulan,tahun,jam,menit,lat,lon,alt,head,az,el,uv,tail
  Serial2.print("LPNST");
  Serial2.print(",");
  Serial2.print(kondisi);
  Serial2.print(",");
  Serial2.print(tanggal);
  Serial2.print(",");
  Serial2.print(bulan);
  Serial2.print(",");
  Serial2.print(tahun);
  Serial2.print(",");
  Serial2.print(jam);
  Serial2.print(",");
  Serial2.print(menit);
  Serial2.print(",");
  Serial2.print(detik);
  Serial2.print(",");
  Serial2.print(gpslat);
  Serial2.print(",");
  Serial2.print(gpslon);
  Serial2.print(",");
  Serial2.print(gpsalt);
  Serial2.print(",");
  Serial2.print(headingDegrees);
  Serial2.print(",");
  Serial2.print(azimuth); //hasil rumus heliostat
  Serial2.print(",");
  Serial2.print(elevasi); //hasil rumus heliostat
  Serial2.print(",");
  Serial2.print(encoder_azimuth_Pos); //hasil kalibrasi yg disimpan di EEPROM
  Serial2.print(",");
  Serial2.print(encoder_elevasi_Pos); //hasil kalibrasi yg disimpan di EEPROM
  Serial2.print(",");
  Serial2.print(manual_azimuth_Pos); //dalam mode manual (rotary encoder)
  Serial2.print(",");
  Serial2.print(manual_elevasi_Pos); //dalam mode manual (rotary encoder)
  Serial2.print(",");
  Serial2.print(LDR_Right_Top);
  Serial2.print(",");
  Serial2.print(LDR_Right_Bottom);
  Serial2.print(",");
  Serial2.print(LDR_Left_Top);
  Serial2.print(",");
  Serial2.print(LDR_Left_Bottom);
  Serial2.print(",");
  Serial2.print(uvIntensity);
  Serial2.print(",");
  if (flip==0)
  {
    Serial2.println("*");
    flip=1;
  }
  else
  {
    Serial2.println("**");
    flip=0;
  }
}










