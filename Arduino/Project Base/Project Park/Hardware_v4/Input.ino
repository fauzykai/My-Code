void Scan_Sensor_US() // algoritma pembacaan sensor secara berututan
{
  for (byte i = 0; i < SONAR_NUM; i++)
  {
    Distance[i] = Sonar[i].ping_cm();
    if (Distance[i] > US_DETECT_MIN_DISTANCE && Distance[i] < US_DETECT_MAX_DISTANCE && Distance[i] != 0)
    {
      State[i] = 1;
    }
    else
    {
      State[i] = 0;
    }
    delay(PING_INTERVAL);
  }
}
void Led_Act2()
{
  digitalWrite(Led[1],State[1]);
  
  }


void Led_Act()
{
  for (byte i = 0; i < SENS_NUM; i++)
  {
    if (State[i] == LED_COLOR) // red
    {
      digitalWrite(Led[i], HIGH);
    }
    else
    {
      digitalWrite(Led[i], LOW);
    }
  }

}

void Scan_Sensor_IR()
{
  delay(PING_INTERVAL);
  Distance[3] = SharpIR.distance();
  if (Distance[3] > IR_DETECT_MIN_DISTANCE && Distance[3] < IR_DETECT_MAX_DISTANCE && Distance[3] != 0)
  {
    State[3] = 1;
  }
  else
  {
    State[3] = 0;
  }
  delay(PING_INTERVAL);
}

void Debug_Sensor_State()
{
  for (byte i = 0; i < SENS_NUM; i++)
  {
    Serial.print(State[i]);
    Serial.print(",");
  }
  Serial.println();
}

void Debug_Sensor_Distance()
{
  for (byte i = 0; i < SENS_NUM; i++)
  {
    //Serial.print(Distance[i]);
    sprintf(DebugVar, "%03d", Distance[i]);
    Serial.print(DebugVar);
    Serial.print(",");
  }
  Serial.print("000");
  Serial.println();
}

void Fill_Temp() // algoritma pengisian array sebelumnya dengan array yang sekarang
{
  for (byte i = 0 ; i < SONAR_NUM; i++)
  {
    State_Temp[i] = State[i];
  }
}

boolean Check_Arrays(byte ArrayA[], byte ArrayB[], byte NumItem) // algoritma pembanding array status sebelumnya dengan array status sekarang
{
  boolean Same = true;
  byte i = 0;
  while (i < NumItem && Same)
  {
    Same = ArrayA[i] == ArrayB[i];
    i++;
  }
  return Same;
}

