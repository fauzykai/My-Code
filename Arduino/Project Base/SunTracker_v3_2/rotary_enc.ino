void baca_rotary()
{
  //=============================================================================================================
  //                     Rotary Encoder Elevasi
  //=============================================================================================================

  n_elevasi = digitalRead(encoder_elevasi_A);
  if ((encoder_elevasi_A_Last == LOW) && (n_elevasi == HIGH))
  {
    if (digitalRead(encoder_elevasi_B) == LOW && encoder_elevasi_Pos <= 90 && encoder_elevasi_Pos >= -90) 
    {
      encoder_elevasi_Pos--;
      //=============================================================================================================
      //                     Rotary Encoder Elevasi ke EEPROM
      //=============================================================================================================
      if (encoder_elevasi_Pos < 0)
      {
        encoder_elevasi_eeprom = 255 + encoder_elevasi_Pos;
      }
      else
      {
        encoder_elevasi_eeprom = encoder_elevasi_Pos;
      }
      //=============================================================================================================
      //                     Simpan ke EEPROM
      //=============================================================================================================
      EEPROM.write(addr_elevasi, encoder_elevasi_eeprom);
    } 
    else 
    {
      encoder_elevasi_Pos++;
      //=============================================================================================================
      //                     Rotary Encoder Elevasi ke EEPROM
      //=============================================================================================================
      if (encoder_elevasi_Pos < 0)
      {
        encoder_elevasi_eeprom = 255 + encoder_elevasi_Pos;
      }
      else
      {
        encoder_elevasi_eeprom = encoder_elevasi_Pos;
      }
      //=============================================================================================================
      //                     Simpan ke EEPROM
      //=============================================================================================================
      EEPROM.write(addr_elevasi, encoder_elevasi_eeprom);
    }
    Serial.print ("Encoder_Elevasi = ");
    Serial.println (encoder_elevasi_Pos);
  } 
  encoder_elevasi_A_Last = n_elevasi;

  //=============================================================================================================
  //                     Rotary Encoder Azimuth
  //=============================================================================================================

  n_azimuth = digitalRead(encoder_azimuth_A);
  if ((encoder_azimuth_A_Last == LOW) && (n_azimuth == HIGH))
  {
    if (digitalRead(encoder_azimuth_B) == LOW) 
    {
      encoder_azimuth_Pos--;
      //=============================================================================================================
      //                     Rotary Encoder Azimuth ke EEPROM
      //=============================================================================================================
      if (encoder_azimuth_Pos < 0)
      {
        encoder_azimuth_eeprom = 255 + encoder_azimuth_Pos;
      }
      else
      {
        encoder_azimuth_eeprom = encoder_azimuth_Pos;
      }
      //=============================================================================================================
      //                     Simpan ke EEPROM
      //=============================================================================================================
      EEPROM.write(addr_azimuth, encoder_azimuth_eeprom);
    } 
    else 
    {
      encoder_azimuth_Pos++;
      //=============================================================================================================
      //                     Rotary Encoder Azimuth ke EEPROM
      //=============================================================================================================
      if (encoder_azimuth_Pos < 0)
      {
        encoder_azimuth_eeprom = 255 + encoder_azimuth_Pos;
      }
      else
      {
        encoder_azimuth_eeprom = encoder_azimuth_Pos;
      }
      //=============================================================================================================
      //                     Simpan ke EEPROM
      //=============================================================================================================
      EEPROM.write(addr_azimuth, encoder_azimuth_eeprom);
    }
    Serial.print ("Encoder_Azimuth = ");
    Serial.println (encoder_azimuth_Pos);
  } 
  encoder_azimuth_A_Last = n_azimuth;
} 








