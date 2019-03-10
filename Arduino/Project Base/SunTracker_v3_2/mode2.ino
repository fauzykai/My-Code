void mode2()
{
  kondisi = 2;
  baca_rotary();
  gethead(); //kompass
  gettime(); //rtc
  getldr();
  getuv();
  waktu_sekarang_m2 = millis();
  if(waktu_sekarang_m2 - waktu_sebelum_m2 > interval_m2) 
  {
    waktu_sebelum_m2 = waktu_sekarang_m2;
    lcdkalibrasi();
    kirimdata();
  }
}








