void getldr()
{
  LDR_Right_Bottom = analogRead(A0);
  LDR_Right_Top = analogRead(A1);
  LDR_Left_Bottom = analogRead(A2);
  LDR_Left_Top = analogRead(A3);
}
void lcdldr()
{
  LCDA.clear();
  LCDA.printf(0, 0, "TopRight = %d", LDR_Right_Top);
  LCDA.printf(0, 1, "TopLeft  = %d", LDR_Left_Top);
  LCDA.printf(0, 2, "BotRight = %d", LDR_Right_Bottom);
  LCDA.printf(0, 3, "BotLeft  = %d", LDR_Left_Bottom);
}
void lcdkalibrasi()
{
  LCDA.clear();
  LCDA.printf(0, 0, "===KALIBRASI===");
  LCDA.printf(0, 1, "TL=%d", LDR_Left_Top);
  LCDA.printf(4, 1, "TR=%d", LDR_Right_Top);
  LCDA.printf(0, 2, "BL=%d", LDR_Left_Bottom);
  LCDA.printf(4, 2, "BR=%d", LDR_Right_Bottom);
  LCDA.printf(0, 3, "A =%d", encoder_azimuth_Pos);
  LCDA.printf(4, 3, "E =%d", encoder_elevasi_Pos);
}
void printldr()
{
  Serial.print("LDR_Left_Top    = ");
  Serial.print(LDR_Left_Top);
  Serial.print("   LDR_Right_Top    = ");
  Serial.println(LDR_Right_Top);
  Serial.print("LDR_Left_Bottom = ");
  Serial.print(LDR_Left_Bottom);
  Serial.print("   LDR_Right_Bottom = ");
  Serial.println(LDR_Right_Bottom); 
}


