

void MsdInit() {
  Serial.print("Initializing SD card...");
  // see if the card is present and can be initialized:
  if (!SD.begin(chipSelect)) {
    Serial.println("Card failed, or not present");
    // don't do anything more:
    return;
  }
  Serial.println("card initialized.");
}

void Logging() {
  String dataString = "";
  String dateString = "";
  String FinalString = "";
  dateString = String(tahun) + "," + String(bulan) + "," + String(hari) + "," + String(jam) + "," + String(menit) + "," + String(detik);
  dataString = String(ACS_OUT[0]) + "," + String(ACS_OUT[1]) + "," + String(ACS_OUT[2]) + "," + String(VOLT_OUT[0]) + "," + String(VOLT_OUT[1]) + "," + String(VOLT_OUT[2]);
  FinalString = HEADER + dateString + dataString;

  File dataFile = SD.open("datalog.txt", FILE_WRITE);

  if (dataFile) {
    dataFile.println(FinalString);
    dataFile.close();
    // print to the serial port too:
    Serial.println(FinalString);
  }
  else {
    Serial.println("error opening datalog.txt");
  }
}
