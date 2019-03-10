void Rumus_Matahari()
{
  if (tahun % 4 == 0){
    switch(bulan){
    case 1:
      dayOfYear = 0;
      break;
    case 2:
      dayOfYear = 31;
      break;
    case 3:
      dayOfYear = 60;
      break;
    case 4:
      dayOfYear = 91;
      break;
    case 5:
      dayOfYear = 121;
      break;
    case 6:
      dayOfYear = 152;
      break;
    case 7:
      dayOfYear = 182;
      break;
    case 8:
      dayOfYear = 213;
      break;
    case 9:
      dayOfYear = 244;
      break;
    case 10:
      dayOfYear = 274;
      break;
    case 11:
      dayOfYear = 305;
      break;
    case 12:
      dayOfYear = 335;
      break;
    }
  } 
  else
  {
    switch(bulan){
    case 1:
      dayOfYear = 0;
      break;
    case 2:
      dayOfYear = 31;
      break;
    case 3:
      dayOfYear = 59;
      break;
    case 4:
      dayOfYear = 90;
      break;
    case 5:
      dayOfYear = 120;
      break;
    case 6:
      dayOfYear = 151;
      break;
    case 7:
      dayOfYear = 181;
      break;
    case 8:
      dayOfYear = 212;
      break;
    case 9:
      dayOfYear = 243;
      break;
    case 10:
      dayOfYear = 273;
      break;
    case 11:
      dayOfYear = 304;
      break;
    case 12:
      dayOfYear = 334;
      break;
    }
  }

  dayOfYear = dayOfYear + tanggal;
  //dayOfYear = 289;
  LSTM = 15*deltaT_GMT;
  B = 0.98630136986301369863013698630137*(dayOfYear-81); //0.98630136986301369863013698630137 = (360/365)
  B_rad = B*(pi/180);
  EoT = ((9.87*sin(2*B_rad))-(7.53*cos(B_rad))-(1.5*sin(B_rad)));
  TC = (4*(gpslon-LSTM))+EoT;
  LT = (menit/60) + jam;
  //LT = 13;
  LST = LT+(TC/60);
  HRA = 15*(LST-12);
  declination = 23.45*sin(B_rad); 
  elevasi_temp = asin((sin(declination*(pi/180))*sin(gpslat*(pi/180)))+(cos(declination*(pi/180))*cos(gpslat*(pi/180))*cos(HRA*(pi/180))));
  elevasi = elevasi_temp*(180/pi);
  azimuth_temp = acos(((sin(declination*(pi/180))*cos(gpslat*(pi/180)))-(cos(declination*(pi/180))*sin(gpslat*(pi/180))*cos(HRA*(pi/180))))/cos(elevasi_temp*(pi/180)));
  //azimuth_temp = atan2(sin(HRA*(pi/180)),((cos(HRA*(pi/180))*sin(gpslat*(pi/180)))-tan(declination*(pi/180))*cos(gpslat*(pi/180))));
  azimuth = azimuth_temp*(180/pi);
  if (LST < 12 || HRA < 0)
  {
    azimuth = azimuth; 
  }
  else
  {
    azimuth = 360 - azimuth; 
  }

}

void print_rh()
{
  Serial.print("Day of year = ");
  Serial.println(dayOfYear);
  Serial.print("Elevasi = ");
  Serial.println(elevasi);
  Serial.print("Azimuth = ");
  Serial.println(azimuth); 
  //Serial.print("B = ");
  //Serial.println(B);
  //Serial.print("EoT = ");
  //Serial.println(EoT);
  //Serial.print("TC = ");
  //Serial.println(TC);
  //Serial.print("HRA = ");
  //Serial.println(HRA);
  //Serial.print("declination = ");
  //Serial.println(declination);
}


