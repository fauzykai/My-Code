void readACS()
{
  //for (int i = 0; i <= SENS_NUM; i++)
  //{
  //ACS_OUT[0] = ACS_SENS[0].getCurrentDC() + ACS_CALIB[0];
  ACS_OUT[0] = MeasureAmperage(0) + ACS_CALIB[0];
  //}
}
float MeasureAmperage(int num)
{
  float average = 0;
  float amp = 0;
  for (int i = 0; i < SAMPLE_RATE; i++) {
    amp = ACS_SENS[num].getCurrentDC();
    average = average + amp;
    delay(1);
  }
  average = average / SAMPLE_RATE;
  return average;
}

