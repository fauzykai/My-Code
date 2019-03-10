/**************************************************************************************/
/***************                  Motor Pin order                  ********************/
/**************************************************************************************/
// since we are uing the PWM generation in a direct way, the pin order is just to inizialie the right pins 
// its not possible to change a PWM output pin just by changing the order
  uint8_t PWM_PIN[8] = {3,5,6,2,7,8,9,10};      //for a quad+: rear,right,left,front   //+ for y6: 7:under right  8:under left

/**************************************************************************************/
/***************         Software PWM & Servo variables            ********************/
/**************************************************************************************/
//  volatile uint16_t atomicServo[8] = {8000,8000,8000,8000,8000,8000,8000,320};
  volatile uint16_t atomicServo[8] = {8000,8000,8000,8000,8000,8000,8000,8000};

/**************************************************************************************/
/***************   Writes the Servos values to the needed format   ********************/
/**************************************************************************************/
void writeServos() {
  for(uint8_t i = (PRI_SERVO_FROM-1); i < PRI_SERVO_TO; i++){
    atomicServo[i] = (servo[i]-1000)<<4;
  }
}

/**************************************************************************************/
/************  Writes the Motors values to the PWM compare register  ******************/
/**************************************************************************************/
void writeMotors() { // [1000;2000] => [125;250]

/****************  Specific PWM Timers & Registers for the MEGA's   *******************/
//  OCR3B = motor[0]<<3; //  pin 2
//  OCR3C = motor[0]<<3; //  pin 3    //default
//  OCR3A = motor[0]<<3; //  pin 5
//  OCR4A = motor[0]<<3; //  pin 6
//  OCR4B = motor[0]<<3; //  pin 7
   OCR4C = motor[0]<<3; //  pin 8
//  OCR2B = motor[0]<<3; //  pin 9
//  OCR2A = motor[0]<<3; //  pin 10
}

/**************************************************************************************/
/************          Writes the mincommand to all Motors           ******************/
/**************************************************************************************/
void writeAllMotors(int16_t mc) {   // Sends commands to all motors
  for (uint8_t i =0;i<NUMBER_MOTOR;i++) {
    motor[i]=mc;  // Arahkan semua pin Brushless ke titik mc
  }
  writeMotors();
}

/**************************************************************************************/
/************        Initialize the PWM Timers and Registers         ******************/
/**************************************************************************************/
void initOutput() {
/****************            mark all PWM pins as Output             ******************/
  for(uint8_t i=0;i<NUMBER_MOTOR;i++) {
    //pinMode(PWM_PIN[i],OUTPUT);  //Aktifkan semua pin Servo dan Brushless menjadi output atau DDR? menjadi high
    pinMode(8,OUTPUT); // Ganti nilai untuk merubah jalur keluaran PWM
  }
    
/****************  Specific PWM Timers & Registers for the MEGA's    ******************/
/*
  // init 16bit timer 3
  TCCR3A |= (1<<WGM31); // phase correct mode
  TCCR3A &= ~(1<<WGM30);
  TCCR3B |= (1<<WGM33);
  TCCR3B &= ~(1<<CS31); // no prescaler
  ICR3   |= 0x3FFF; // TOP to 16383;    
  //Gunakan TCCR3A = _BV(COM??1) 
*/  
  // init 16bit timer 4
  TCCR4A |= (1<<WGM41); // phase correct mode
  TCCR4A &= ~(1<<WGM40);
  TCCR4B |= (1<<WGM43);
  TCCR4B &= ~(1<<CS41); // no prescaler
  ICR4   |= 0x3FFF; // TOP to 16383;   
  //Gunakan TCCR4A = _BV(COM??1)    


//  TCCR3A |= _BV(COM3B1); // connect pin 2 ke timer 3 channel B
//  TCCR3A |= _BV(COM3C1); // connect pin 3 ke timer 3 channel C
//  TCCR3A |= _BV(COM3A1); // connect pin 5 ke timer 3 channel A
//  TCCR4A |= _BV(COM4A1); // connect pin 6 ke timer 4 channel A
//  TCCR4A |= _BV(COM4B1); // connect pin 7 ke timer 4 channel B
  TCCR4A |= _BV(COM4C1); // connect pin 8 ke timer 4 channel C
//  TCCR2A |= _BV(COM2B1); // connect pin 9 ke timer 2 channel B
//  TCCR2A |= _BV(COM2A1); // connect pin 10 ke timer 2 channel A
  
  writeAllMotors(MINCOMMAND);
  delay(300);
  initializeServo();
}

/**************************************************************************************/
/************                Initialize the PWM Servos               ******************/
/**************************************************************************************/
void initializeServo() {

  SERVO_4_PINMODE;
  SERVO_5_PINMODE;
  SERVO_6_PINMODE;
  SERVO_7_PINMODE;
  SERVO_8_PINMODE;

  // uses timer 5 Comperator A (11 bit)
  TCCR5A &= ~(1<<WGM50) & ~(1<<WGM51); //normal counting & no prescaler
  TCCR5B &= ~(1<<WGM52) & ~(1<<CS51) & ~(1<<CS52) & ~(1<<WGM53);
  TCCR5B |= (1<<CS50);   
  TIMSK5 |= (1<<OCIE5A); // Enable CTC interrupt  
  #define SERVO_ISR TIMER5_COMPA_vect
  #define SERVO_CHANNEL OCR5A
  #define SERVO_1K_US 16000 
}

/**************************************************************************************/
/************              Servo software PWM generation             ******************/
/**************************************************************************************/

// prescaler is set by default to 64 on Timer0
// Duemilanove : 16MHz / 64 => 4 us
// 256 steps = 1 counter cycle = 1024 us

// for servo 2-8
// its almost the same as for servo 1

  #define SERVO_PULSE(PIN_HIGH,ACT_STATE,SERVO_NUM,LAST_PIN_LOW) \
    }else if(state == ACT_STATE){                                \
      LAST_PIN_LOW;                                              \
      PIN_HIGH;                                                  \
      SERVO_CHANNEL+=SERVO_1K_US;                                \
      state++;                                                   \
    }else if(state == ACT_STATE+1){                              \
      SERVO_CHANNEL+=atomicServo[SERVO_NUM];                     \
      state++;                                                   \
  
  ISR(SERVO_ISR) {
    static uint8_t state = 0; // indicates the current state of the chain
    if(state == 0){
      SERVO_1_HIGH; // set servo 1's pin high 
      SERVO_CHANNEL+=SERVO_1K_US; // wait 1000us
      state++; // count up the state
    }else if(state==1){
      SERVO_CHANNEL+=atomicServo[SERVO_1_ARR_POS]; // load the servo's value (0-1000us)
      state++; // count up the state
      SERVO_PULSE(SERVO_2_HIGH,2,SERVO_2_ARR_POS,SERVO_1_LOW); // the same here
      SERVO_PULSE(SERVO_3_HIGH,4,SERVO_3_ARR_POS,SERVO_2_LOW);
      SERVO_PULSE(SERVO_4_HIGH,6,SERVO_4_ARR_POS,SERVO_3_LOW);
      SERVO_PULSE(SERVO_5_HIGH,8,SERVO_5_ARR_POS,SERVO_4_LOW);
    }else{
      LAST_LOW;
      SERVO_CHANNEL+=SERVO_1K_US;
      if(state<30){
        state+=2;
      }else{
        state=0;
      }     
    }
  } 

/**************************************************************************************/
/********** Mixes the Computed stabilize values to the Motors & Servos  ***************/
/**************************************************************************************/
void mixTable() {
  int16_t maxMotor;
  uint8_t i;

  #define PIDMIX(X,Y,Z) rcCommand[THROTTLE] + axisPID[ROLL]*X + axisPID[PITCH]*Y + YAW_DIRECTION * axisPID[YAW]*Z
  
  /************************************************************************************************************/
  #if defined(AIRPLANE) || defined(SINGLECOPTER) || defined(DUALCOPTER)
    // Common parts for Plane and Heli
    static int16_t   servoMid[8];                        // Midpoint on servo
    static uint8_t   servoTravel[8] = SERVO_RATES;       // Rates in 0-100% 
    static int8_t    servoReverse[8] = SERVO_DIRECTION ; // Inverted servos
    static int16_t   servoLimit[8][2]; // Holds servoLimit data

    /***************************
     * servo endpoints Airplane. 
     ***************************/
    #define SERVO_MIN 1020           // limit servo travel range must be inside [1020;2000]
    #define SERVO_MAX 2000           // limit servo travel range must be inside [1020;2000]
    for(i=0; i<8; i++){  //  Set rates with 0 - 100%. 
      servoMid[i]     =MIDRC + conf.servoTrim[i];
      servoLimit[i][0]=servoMid[i]-((servoMid[i]-SERVO_MIN)   *(servoTravel[i]*0.01));
      servoLimit[i][1]=servoMid[i]+((SERVO_MAX - servoMid[i]) *(servoTravel[i]*0.01));  
    }
//    if (!f.ARMED){  servo[7] =  MINCOMMAND; // Kill throttle when disarmed
//    } else {        servo[7] =  rcData[THROTTLE];
//    }

/******************                   Development of single & DualCopter                            **********************/

    int8_t yawServo[4] =SINGLECOPTRER_YAW;
    int8_t scServo[4]  =SINGLECOPTRER_SERVO;
    servo[3]  = servoMid[3] + (axisPID[YAW]*yawServo[0]) + (axisPID[PITCH]*scServo[0])  ;   //   SideServo  5  D12
    servo[4]  = servoMid[4] + (axisPID[YAW]*yawServo[1]) + (axisPID[PITCH]*scServo[1])  ;   //   SideServo  3  D11
    servo[5]  = servoMid[5] + (axisPID[YAW]*yawServo[2]) + (axisPID[ROLL] *scServo[2])  ;   //   FrontServo 2  D3
    servo[6]  = servoMid[6] + (axisPID[YAW]*yawServo[3]) + (axisPID[ROLL] *scServo[3])  ;   //   RearServo  4  D10
    motor[0]  = rcData[THROTTLE] ;         //  Pin D10
// GCS Command    
    servo[7] = SERVO_MIN;
    if (go_state == HEADER_STANDBY){
        //f.ARMED = 0 ; 
    } else if(go_state == HEADER_STEADY){ 
        f.ARMED = 1;
        //if (countdown == 0) countdown = currentTime+10000000;
    } else if(go_state == HEADER_GO){
        motor[0] = MAXTHROTTLE; 
        if (countdown == 0) countdown = currentTime+10000000;
        if (currentTime > countdown){
          go_state = HEADER_SEPARATION;
          countdown = 0;
        }
    } else if(go_state == HEADER_SEPARATION){ 
        servo[7] = SERVO_MAX;      //   Parachute
        f.ARMED = 0 ; 
    } 
    
// Auto-Separation Procedure
    if ((angle[0]<-1000 || angle[0]>1000) || (angle[1]<-1000 || angle[1]>1000)  || rcData[AUX1] > MAXCHECK) { 
      go_state = HEADER_SEPARATION;
      countdown = 0;
    } 

    // ServoRates
    for(i=3;i<8;i++){
      servo[i]  = map(servo[i], SERVO_MIN, SERVO_MAX,servoLimit[i][0],servoLimit[i][1]);
      servo[i]  = constrain( servo[i], SERVO_MIN, SERVO_MAX);
    }

  #endif
  
  /****************                Filter the Motors values                ******************/
  maxMotor=motor[0];
  for(i=1;i< NUMBER_MOTOR;i++) if (motor[i]>maxMotor) maxMotor=motor[i];
  for (i = 0; i < NUMBER_MOTOR; i++) {
    if (maxMotor > MAXTHROTTLE)  motor[i] -= maxMotor - MAXTHROTTLE; // this is a way to still have good gyro corrections if at least one motor reaches its max.
    motor[i] = constrain(motor[i], MINTHROTTLE, MAXTHROTTLE);    
//    if ((rcData[THROTTLE]) < MINCHECK) motor[i] = MINTHROTTLE;
    if (!f.ARMED) motor[i] = MINCOMMAND;
  }
}
