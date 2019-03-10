void readRTC()
{
  DateTime now = rtc.now();
  tahun = now.year(), DEC;
  bulan = now.month(), DEC;
  hari = now.day(), DEC;
  jam = now.hour(), DEC;
  menit = now.minute(), DEC;
  detik = now.second(), DEC;
  Serial.println(menit);
}
