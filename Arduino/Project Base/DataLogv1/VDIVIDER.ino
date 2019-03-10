void readVOLT()
{
  //for (int i = 0; i <= SENS_NUM; i++){
  
      VOLT_OUT[0] = MeasureVoltage(VOLT_PIN_SENS[0], DENOM[0]) + VOLT_CALIB[0];
  //}
}

float MeasureVoltage(byte pin, float denomi)
{
  float average = 0;
  float voltage = 0;
  for (int i = 0; i < SAMPLE_RATE; i++) {
    voltage = analogRead(pin);
    //Serial.println(voltage);
    voltage = (voltage / 1024) * 5.0;
    voltage = voltage / denomi;
    average = average + voltage;
    delay(1);
  }
  average = average / SAMPLE_RATE;
  return average;
}

