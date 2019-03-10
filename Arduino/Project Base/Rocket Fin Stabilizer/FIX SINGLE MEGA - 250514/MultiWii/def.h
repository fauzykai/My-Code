/**************************************************************************************/
/***************             Proc specific definitions             ********************/
/**************************************************************************************/
// Proc auto detection
  #define MEGA

/**************************  all the Mega types  ***********************************/
  #define LEDPIN_PINMODE             pinMode (13, OUTPUT);pinMode (30, OUTPUT);
  #define LEDPIN_TOGGLE              PINB  |= (1<<7); PINC  |= (1<<7);
  #define LEDPIN_ON                  PORTB |= (1<<7); PORTC |= (1<<7);
  #define LEDPIN_OFF                 PORTB &= ~(1<<7);PORTC &= ~(1<<7);
  #define I2C_PULLUPS_ENABLE         PORTD |= 1<<0; PORTD |= 1<<1;       // PIN 20&21 (SDA&SCL)
  #define I2C_PULLUPS_DISABLE        PORTD &= ~(1<<0); PORTD &= ~(1<<1);
  #define STABLEPIN_PINMODE          pinMode (31, OUTPUT);
  #define STABLEPIN_ON               PORTC |= 1<<6;
  #define STABLEPIN_OFF              PORTC &= ~(1<<6);

  //RX PIN assignment inside the port //for PORTK
  #define THROTTLEPIN                0    //PIN 62 =  PIN A8
  #define ROLLPIN                    1    //PIN 63 =  PIN A9
  #define PITCHPIN                   2    //PIN 64 =  PIN A10
  #define YAWPIN                     3    //PIN 65 =  PIN A11
  #define AUX1PIN                    4    //PIN 66 =  PIN A12
  #define AUX2PIN                    5    //PIN 67 =  PIN A13
  #define AUX3PIN                    6    //PIN 68 =  PIN A14
  #define AUX4PIN                    7    //PIN 69 =  PIN A15
  #define PCINT_PIN_COUNT            8
  #define PCINT_RX_BITS              (1<<2),(1<<4),(1<<5),(1<<6),(1<<7),(1<<0),(1<<1),(1<<3)
  #define PCINT_RX_PORT              PORTK
  #define PCINT_RX_MASK              PCMSK2
  #define PCIR_PORT_BIT              (1<<2)
  #define RX_PC_INTERRUPT            PCINT2_vect
  #define RX_PCINT_PIN_PORT          PINK
  
//  #define SERVO_1_PINMODE            pinMode(34,OUTPUT);  pinMode(44,OUTPUT); // TILT_PITCH - WING left
//  #define SERVO_1_PIN_HIGH           PORTC |= 1<<3;       PORTL |= 1<<5;
//  #define SERVO_1_PIN_LOW            PORTC &= ~(1<<3);    PORTL &= ~(1<<5);
//  #define SERVO_2_PINMODE            pinMode(35,OUTPUT);  pinMode(45,OUTPUT); // TILT_ROLL  - WING right
//  #define SERVO_2_PIN_HIGH           PORTC |= 1<<2;       PORTL |= 1<<4;
//  #define SERVO_2_PIN_LOW            PORTC &= ~(1<<2);    PORTL &= ~(1<<4);
//  #define SERVO_3_PINMODE            pinMode(33,OUTPUT);  pinMode(46,OUTPUT); // CAM TRIG  - alt TILT_PITCH
//  #define SERVO_3_PIN_HIGH           PORTC |= 1<<4;       PORTL |= 1<<3;
//  #define SERVO_3_PIN_LOW            PORTC &= ~(1<<4);    PORTL &= ~(1<<3);
//  #define SERVO_4_PINMODE            pinMode(37,OUTPUT); //PC0 new       - alt TILT_ROLL
//  #define SERVO_4_PIN_HIGH           PORTC |= 1<<0;            
//  #define SERVO_4_PIN_LOW            PORTC &= ~(1<<0);
//  #define SERVO_5_PINMODE            pinMode(6,OUTPUT);  //PH3 BI LEFT
//  #define SERVO_5_PIN_HIGH           PORTH |= 1<<3;
//  #define SERVO_5_PIN_LOW            PORTH &= ~(1<<3);
//  #define SERVO_6_PINMODE            pinMode(2,OUTPUT);  //PE4 TRI REAR - BI RIGHT
//  #define SERVO_6_PIN_HIGH           PORTE |= 1<<4;
//  #define SERVO_6_PIN_LOW            PORTE &= ~(1<<4);
//  #define SERVO_7_PINMODE            pinMode(5,OUTPUT);  //PE3 new
//  #define SERVO_7_PIN_HIGH           PORTE |= 1<<3;
//  #define SERVO_7_PIN_LOW            PORTE &= ~(1<<3);
//  #define SERVO_8_PINMODE            pinMode(3,OUTPUT);  //PE5 new
//  #define SERVO_8_PIN_HIGH           PORTE |= 1<<5;
//  #define SERVO_8_PIN_LOW            PORTE &= ~(1<<5);
  
  #define SERVO_4_PINMODE            pinMode(7,OUTPUT); //PH4 new       - alt TILT_ROLL
  #define SERVO_4_PIN_HIGH           PORTH |= 1<<4;            
  #define SERVO_4_PIN_LOW            PORTH &= ~(1<<4);
  #define SERVO_5_PINMODE            pinMode(6,OUTPUT);  //PH3 BI LEFT
  #define SERVO_5_PIN_HIGH           PORTH |= 1<<3;
  #define SERVO_5_PIN_LOW            PORTH &= ~(1<<3);
  #define SERVO_6_PINMODE            pinMode(3,OUTPUT);  //PE4 TRI REAR - BI RIGHT
  #define SERVO_6_PIN_HIGH           PORTE |= 1<<5;
  #define SERVO_6_PIN_LOW            PORTE &= ~(1<<5);
  #define SERVO_7_PINMODE            pinMode(5,OUTPUT);  //PE3 new
  #define SERVO_7_PIN_HIGH           PORTE |= 1<<3;
  #define SERVO_7_PIN_LOW            PORTE &= ~(1<<3);
  #define SERVO_8_PINMODE            pinMode(2,OUTPUT);  //PE4 TRI REAR - BI RIGHT
  #define SERVO_8_PIN_HIGH           PORTE |= 1<<4;
  #define SERVO_8_PIN_LOW            PORTE &= ~(1<<4);
  

/**************************************************************************************/
/***************             motor and servo numbers               ********************/
/**************************************************************************************/
  #define SERVO
  #define NUMBER_MOTOR     1
  #define PRI_SERVO_FROM   4 // default use servo from 4 to 7
  #define PRI_SERVO_TO     8 // default 7

/**********************   Sort the Servos for the moust ideal SW PWM     ************************/
// this define block sorts the above slected servos to be in a simple order from 1 - (count of total servos)
// its pretty fat but its the best way i found to get less compiled code and max speed in the ISR without loosing its flexibility

  #define SERVO_1_HIGH SERVO_4_PIN_HIGH
  #define SERVO_1_LOW SERVO_4_PIN_LOW
  #define SERVO_1_ARR_POS 3  
//  #define LAST_LOW SERVO_4_PIN_LOW

  #define SERVO_2_HIGH SERVO_5_PIN_HIGH
  #define SERVO_2_LOW SERVO_5_PIN_LOW
  #define SERVO_2_ARR_POS 4  
//  #define LAST_LOW SERVO_5_PIN_LOW

  #define SERVO_3_HIGH SERVO_6_PIN_HIGH
  #define SERVO_3_LOW SERVO_6_PIN_LOW
  #define SERVO_3_ARR_POS 5    
//  #define LAST_LOW SERVO_6_PIN_LOW

  #define SERVO_4_HIGH SERVO_7_PIN_HIGH
  #define SERVO_4_LOW SERVO_7_PIN_LOW 
  #define SERVO_4_ARR_POS 6  
//  #define LAST_LOW SERVO_7_PIN_LOW

  #define SERVO_5_HIGH SERVO_8_PIN_HIGH
  #define SERVO_5_LOW SERVO_8_PIN_LOW 
  #define SERVO_5_ARR_POS 7  
  #define LAST_LOW SERVO_8_PIN_LOW

/**************************************************************************************/
/***************      IMU Orientations and Sensor definitions      ********************/
/**************************************************************************************/
  #define MPU6050
  #define ACC 1 
  #define GYRO 1
  #define HMC5883
  #define MAG 1 
  #define MS561101BA 
  #define BARO 1
  #define GPS 0
  #define SONAR 0
  #define ACC_ORIENTATION(X, Y, Z)  {accADC[ROLL]  = -X; accADC[PITCH]  = -Y; accADC[YAW]  =  Z;} 
  #define GYRO_ORIENTATION(X, Y, Z) {gyroADC[ROLL] =  Y; gyroADC[PITCH] = -X; gyroADC[YAW] = -Z;} 
  #define MAG_ORIENTATION(X, Y, Z)  {magADC[ROLL]  =  X; magADC[PITCH]  =  Y; magADC[YAW]  = -Z;} 
  #define MPU6050_I2C_AUX_MASTER // MAG connected to the AUX I2C bus of MPU6050 
  #undef INTERNAL_I2C_PULLUPS 
  #define I2C_SPEED 400000L         //400kHz fast mode

/**************************************************************************************/
/***************      Multitype decleration for the GUI's          ********************/
/**************************************************************************************/ 
  #define MULTITYPE 14    

/**************************************************************************************/
/***************          Some unsorted "chain" defines            ********************/
/**************************************************************************************/
#if defined (AIRPLANE) || defined(FLYING_WING)|| defined(SINGLECOPTER)|| defined(DUALCOPTER)
  #define FIXEDWING
#endif
  
  #define STANDARD_RX
  #define RC_CHANS 8

#if !defined(ALT_HOLD_THROTTLE_NEUTRAL_ZONE)
  #define ALT_HOLD_THROTTLE_NEUTRAL_ZONE 500
#endif 

