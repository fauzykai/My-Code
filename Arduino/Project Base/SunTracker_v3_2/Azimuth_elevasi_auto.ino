void azimuth_elevasi_auto() 
{ 
  //=============================================================================================================
  //                     Ambil Nilai LDR
  //=============================================================================================================

  int LDR_Right_Bottom = analogRead(A0);
  int LDR_Right_Top = analogRead(A1);
  int LDR_Left_Bottom = analogRead(A2);
  int LDR_Left_Top = analogRead(A3);

  /*Serial.print("LDR_Right_Bottom = ");
   Serial.println(LDR_Right_Bottom);
   Serial.print("LDR_Right_Top = ");
   Serial.println(LDR_Right_Top);
   Serial.print("LDR_Left_Bottom = ");
   Serial.println(LDR_Left_Bottom);
   Serial.print("LDR_Left_Top = ");
   Serial.println(LDR_Left_Top);
   Serial.println("========================================");
   */

  //=============================================================================================================
  //                    Selisih servo kanan dan kiri
  //=============================================================================================================
  selisih_kanan = LDR_Right_Top - LDR_Right_Bottom;
  selisih_kanan = abs(selisih_kanan);
  Serial.print("selisih_kanan = ");
  Serial.println(selisih_kanan);

  selisih_kiri = LDR_Left_Top - LDR_Left_Bottom;
  selisih_kiri = abs(selisih_kiri);
  Serial.print("selisih_kiri = ");
  Serial.println(selisih_kiri);

  //=============================================================================================================
  //                    ELEVASI
  //=============================================================================================================
  if (selisih_kanan > 100 || selisih_kiri > 100)
  {
    if (LDR_Right_Top && LDR_Left_Top < LDR_Right_Bottom && LDR_Left_Bottom)
    { 
      if (elevasi_ldr < 160)
      {
        elevasi_ldr++;
      }
    }
    else
    {
      if (elevasi_ldr > 20)
      {
        elevasi_ldr--; 
      }
    }
    if (elevasi_ldr > max_servo_elevasi)
    {
      elevasi_ldr = max_servo_elevasi;
      //myservo1.write(elevasi_ldr);
      //action();        
    }
    else if (elevasi_ldr < min_servo_elevasi)
    {
      elevasi_ldr = min_servo_elevasi;
      //myservo1.write(elevasi_ldr);  
      //action();        
    }
    else 
    {
      elevasi_ldr = elevasi_ldr;
      //myservo1.write(elevasi_ldr);                   
    }
    Serial.print("Elevasi LDR=");
    Serial.print(elevasi_ldr);
    Serial.print(" Azimuth LDR=");
    Serial.println(azimuth_ldr);

  }
  else
  {
    elevasi_ldr = elevasi_ldr;
    if (elevasi_ldr > max_servo_elevasi)
    {
      elevasi_ldr = max_servo_elevasi;
      //myservo1.write(elevasi_ldr);                   
    }
    else if (elevasi_ldr < min_servo_elevasi)
    {
      elevasi_ldr = min_servo_elevasi;
      //myservo1.write(elevasi_ldr);                   
    }
    else 
    {
      elevasi_ldr = elevasi_ldr;
      //myservo1.write(elevasi_ldr);                   
    }
    Serial.print("Elevasi LDR=");
    Serial.print(elevasi_ldr);
    Serial.print(" Azimuth LDR=");
    Serial.println(azimuth_ldr);

  }

  //=============================================================================================================
  //                    Selisih servo atas dan bawah
  //=============================================================================================================
  selisih_atas = LDR_Right_Top - LDR_Left_Top;
  selisih_atas = abs(selisih_atas);
  Serial.print("selisih_atas = ");
  Serial.println(selisih_atas);

  selisih_bawah = LDR_Right_Bottom - LDR_Left_Bottom;
  selisih_bawah = abs(selisih_bawah);
  Serial.print("selisih_bawah = ");
  Serial.println(selisih_bawah);

  //=============================================================================================================
  //                    AZIMUTH
  //=============================================================================================================
  if (selisih_atas > 100 || selisih_bawah > 100)
  {
    if (LDR_Right_Top && LDR_Right_Bottom < LDR_Left_Top && LDR_Left_Bottom)
    { 
      if (azimuth_ldr < 160)
      {
        azimuth_ldr++;
      }
    }
    else
    {
      if (azimuth_ldr > 20)
      {
        azimuth_ldr--; 
      }
    }
    if (azimuth_ldr > max_servo_azimuth)
    {
      azimuth_ldr = max_servo_azimuth;
      //myservo2.write(azimuth_ldr);                   
    }
    else if (azimuth_ldr < min_servo_azimuth)
    {
      azimuth_ldr = min_servo_azimuth;
      //myservo2.write(azimuth_ldr);                   
    }
    else 
    {
      azimuth_ldr = azimuth_ldr;
      //myservo2.write(azimuth_ldr);                   
    }
    Serial.print("Elevasi LDR=");
    Serial.print(elevasi_ldr);
    Serial.print(" Azimuth LDR=");
    Serial.println(azimuth_ldr);
  }
  else
  {
    azimuth_ldr = azimuth_ldr;
    if (azimuth_ldr > max_servo_azimuth)
    {
      azimuth_ldr = max_servo_azimuth;
      //myservo2.write(azimuth_ldr);                   
    }
    else if (azimuth_ldr < min_servo_azimuth)
    {
      azimuth_ldr = min_servo_azimuth;
      //myservo2.write(azimuth_ldr);                   
    }
    else 
    {
      azimuth_ldr = azimuth_ldr;
      //myservo2.write(azimuth_ldr);                   
    }
    Serial.print("Elevasi LDR=");
    Serial.print(elevasi_ldr);
    Serial.print(" Azimuth LDR=");
    Serial.println(azimuth_ldr);
  }

} 





