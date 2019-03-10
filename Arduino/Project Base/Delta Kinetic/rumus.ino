// CODE FROM http://forums.trossenrobotics.com/tutorials/introduction-129/delta-robot-kinematics-3276/
// robot geometry

float baseZ = 170.0;
//const float side_from_radius = 3.464;  // we want the sides of the base and effector triangles,
// but what we can easily measure is the distance from the center to the midpoint of the side
// so multiply that by 2/tan(30)
//const float e = side_from_radius * 125.0;    // end effector
//const float f = side_from_radius * 50.0;   // base

const float e = 100.0; //120.0;      // side of end effector triangle
const float f = 200.0; //250.0;     // side of fixed triangle

const float re = 450.0; //200.0;     // length of parallelogram joint
const float rf = 170.0; //70.0;      // length of upper joint


// trigonometric constants
const float sqrt3 = sqrt(3.0);
const float pi = 3.141592653;    // PI
const float sin120 = sqrt3 / 2.0;
const float cos120 = -0.5;
const float tan60 = sqrt3;
const float sin30 = 0.5;
const float tan30 = 1 / sqrt3;

// forward kinematics: (theta1, theta2, theta3) -> (x0, y0, z0)
// returned status: 0=OK, -1=non-existing position
int delta_calcForward(float theta1, float theta2, float theta3, float &x0, float &y0, float &z0) {
  float t = (f - e) * tan30 / 2;
  float dtr = pi / (float)180.0;

  theta1 *= dtr;
  theta2 *= dtr;
  theta3 *= dtr;

  float y1 = -(t + rf * cos(theta1));
  float z1 = -rf * sin(theta1);

  float y2 = (t + rf * cos(theta2)) * sin30;
  float x2 = y2 * tan60;
  float z2 = -rf * sin(theta2);

  float y3 = (t + rf * cos(theta3)) * sin30;
  float x3 = -y3 * tan60;
  float z3 = -rf * sin(theta3);

  float dnm = (y2 - y1) * x3 - (y3 - y1) * x2;

  float w1 = y1 * y1 + z1 * z1;
  float w2 = x2 * x2 + y2 * y2 + z2 * z2;
  float w3 = x3 * x3 + y3 * y3 + z3 * z3;

  // x = (a1*z + b1)/dnm
  float a1 = (z2 - z1) * (y3 - y1) - (z3 - z1) * (y2 - y1);
  float b1 = -((w2 - w1) * (y3 - y1) - (w3 - w1) * (y2 - y1)) / 2.0;

  // y = (a2*z + b2)/dnm;
  float a2 = -(z2 - z1) * x3 + (z3 - z1) * x2;
  float b2 = ((w2 - w1) * x3 - (w3 - w1) * x2) / 2.0;

  // a*z^2 + b*z + c = 0
  float a = a1 * a1 + a2 * a2 + dnm * dnm;
  float b = 2 * (a1 * b1 + a2 * (b2 - y1 * dnm) - z1 * dnm * dnm);
  float c = (b2 - y1 * dnm) * (b2 - y1 * dnm) + b1 * b1 + dnm * dnm * (z1 * z1 - re * re);

  // discriminant
  float d = b * b - (float)4.0 * a * c;
  if (d < 0) return -1; // non-existing point

  z0 = -(float)0.5 * (b + sqrt(d)) / a;
  x0 = (a1 * z0 + b1) / dnm;
  y0 = (a2 * z0 + b2) / dnm;
  return 0;
}

// inverse kinematics
// helper functions, calculates angle theta1 (for YZ-pane)
int delta_calcAngleYZ(float x0, float y0, float z0, float &theta) {
  float y1 = -0.5 * 0.57735 * f; // f/2 * tg 30
  y0 -= 0.5 * 0.57735    * e;    // shift center to edge
  // z = a + b*y
  float a = (x0 * x0 + y0 * y0 + z0 * z0 + rf * rf - re * re - y1 * y1) / (2 * z0);
  float b = (y1 - y0) / z0;
  // discriminant
  float d = -(a + b * y1) * (a + b * y1) + rf * (b * b * rf + rf);
  if (d < 0) return -1; // non-existing point
  float yj = (y1 - a * b - sqrt(d)) / (b * b + 1); // choosing outer point
  float zj = a + b * yj;
  theta = 180.0 * atan(-zj / (y1 - yj)) / pi + ((yj > y1) ? 180.0 : 0.0);
  return 0;
}

// inverse kinematics: (x0, y0, z0) -> (theta1, theta2, theta3)
// returned status: 0=OK, -1=non-existing position
int delta_calcInverse(float x0, float y0, float z0, float &theta1, float &theta2, float &theta3) {
  theta1 = theta2 = theta3 = 0;
  int status = delta_calcAngleYZ(x0, y0, z0, theta1);
  if (status == 0) status = delta_calcAngleYZ(x0 * cos120 + y0 * sin120, y0 * cos120 - x0 * sin120, z0, theta2); // rotate coords to +120 deg
  if (status == 0) status = delta_calcAngleYZ(x0 * cos120 - y0 * sin120, y0 * cos120 + x0 * sin120, z0, theta3); // rotate coords to -120 deg
  return status;
}

void hitung()
{
  t2 = delta_calcInverse(x, y, z, theta1, theta2, theta3);
  if (t2 == -1)
  {
    Serial.println("Nilai Salah");
    return; // no pos
  }
  else if (t2 == 0) {
    //t1 = delta_calcAngleYZ(x, y, z, t);
    Serial.println("Nilai Benar");
    Serial.print(x);
    Serial.print("/");
    Serial.print(y);
    Serial.print("/");
    Serial.print(z);
    Serial.print("--");
    Serial.print(t2);
    Serial.print("/");
    Serial.print(theta1);
    Serial.print("/");
    Serial.print(theta2);
    Serial.print("/");
    Serial.println(theta3);
  }
  else
  {
    Serial.print("Anomali");
  }
}

void parsing()
{
  if (mystring.indexOf(",") > 0)
  {
    int commaIndex = mystring.indexOf(',');
    int secondCommaIndex = mystring.indexOf(',', commaIndex + 1);
    int thirdCommaIndex = mystring.indexOf(',', secondCommaIndex + 1);
    int forthCommaIndex = mystring.indexOf(',', thirdCommaIndex + 1);
    int fivethCommaIndex = mystring.indexOf(',', forthCommaIndex + 1);
    int sixthCommaIndex = mystring.indexOf(',', fivethCommaIndex + 1);
    header = mystring.substring(0, commaIndex);
    xstring = mystring.substring(commaIndex + 1, secondCommaIndex);
    ystring = mystring.substring(secondCommaIndex + 1, thirdCommaIndex);
    zstring = mystring.substring(thirdCommaIndex + 1, forthCommaIndex); //To the end of the string
    ledvstring = mystring.substring(forthCommaIndex + 1, fivethCommaIndex);
    pumpvstring = mystring.substring(fivethCommaIndex + 1, sixthCommaIndex);
    footer = mystring.substring(sixthCommaIndex + 1);
    xv = xstring.toInt();
    yv = ystring.toInt();
    zv = zstring.toInt();
    ledv = ledvstring.toInt();
    pumpv = pumpvstring.toInt();
  }
}

void fback()
{
  Serial.println("================");
  Serial.print("Feedback Serial >> ");
  Serial.print(pumpvstring);
  Serial.print("+");
  Serial.print(ledvstring);
  Serial.print("+");
  Serial.print(zstring);
  Serial.print("+");
  Serial.print(ystring);
  Serial.print("+");
  //Serial.print(",");
  Serial.println(xstring);
}

void eksekusi()
{
  int t1eks, t2eks, t3eks;
  transformToServoAngle( theta1 );
  transformToServoAngle( theta2 );
  transformToServoAngle( theta3);
  t1eks = (round(theta1));
  t2eks = (round(theta2));
  t3eks = 180 - (round(theta3));

  //myservo1.write(t1eks);
  //myservo2.write(t2eks);
  //myservo3.write(t3eks);
  servoWriteFloat(&myservo1, 90 - theta1);
  servoWriteFloat(&myservo2, 90 - theta2);
  servoWriteFloat(&myservo3, 180 - (90 - theta3));
  analogWrite(ledpin, ledv);
  analogWrite(pumppin, pumpv);
}

#define MIN_PULSE_WIDTH       544.0     // the shortest pulse sent to a servo  
#define MAX_PULSE_WIDTH      2400.0     // the longest pulse sent to a servo 

void servoWriteFloat( Servo *s, float angle)
{
  int uS = MIN_PULSE_WIDTH + angle * ( MAX_PULSE_WIDTH - MIN_PULSE_WIDTH ) / 180.0;

  s->writeMicroseconds(uS);
  Serial.println(uS);
}


int minServoPos = -70;
int maxServoPos = 90;
boolean transformToServoAngle( float &theta )
{
  // Our servos go from 0 (max retract) to 120 (full extend, arm in line with servo body) to 170 (overextended)
  // Theta from the geometry maths has 0 with the arm horizontal, -90 at full extend

  theta = -theta;
  //boolean success = true;
  if ( theta < minServoPos )
  {
    //success = false;
    Serial.print("Theta value not correct:");
    theta = minServoPos;
  }
  if ( theta > maxServoPos )
  {
    //success = false;
    Serial.print("Theta value not correct:");
    theta = maxServoPos;
  }
  //return success;
}
