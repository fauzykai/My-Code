void pengaturan()
{
  //-------------------------------------------------------------
  // sub rutin konstanta GPS
  //-------------------------------------------------------------
  gpslat = -6.914744; //latitude Bandung
  gpslon = 107.609810; //longitude Bandung
  gpsalt = 778; //altitude Bandung

  //-------------------------------------------------------------
  // sub rutin servo holding
  //-------------------------------------------------------------
  buttonA=11;
  buttonB=12;
  stateA=0;
  stateB=0;

  //-------------------------------------------------------------
  // fuzzy LDR heliostat
  //-------------------------------------------------------------
  toleransi_azimuth = 2;
  toleransi_elevasi = 2;

  //-------------------------------------------------------------
  // punya LDR-timer
  //-------------------------------------------------------------
  interval = 100;

  //-------------------------------------------------------------
  // punya Rumus Heliostat
  //-------------------------------------------------------------
  deltaT_GMT = 7; //selisih negara kita dengan Greenwicn Mean Time, perhatikan WIB WITA WIT


  //-------------------------------------------------------------
  // punya smoothmovement (action)
  //-------------------------------------------------------------
  smoothstep = 5;
  smooth = 1;
  lamacari = 10;
  sleepmode=true;
  toleransikompas=3;
  UVIN = A4; //pin sensor uv
  pinaz=5; //pin servo azimuth
  pinel=6; //pin servo elevasi
}



