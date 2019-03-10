void Initialize()
{
  Notify(2, 50);
  LCD_Info();
  LCD_Init();
}
void Debug()
{
  if (DEB_MODE == 1)
  {
    Debug_Sensor_State();
  }
  else
  {
    Debug_Sensor_Distance();
  }
}

int Notify(int x, int y) // notif x=banyaknya, y=delay
{
  for (int i = 0; i < x; i++)
  {
    digitalWrite(BUZZ, HIGH);
    digitalWrite(LED, HIGH);
    delay(y);
    digitalWrite(BUZZ, LOW);
    digitalWrite(LED, LOW);
    delay(y);
  }
}
