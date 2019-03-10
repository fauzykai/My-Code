/*************************************************************************************************/
/****************  SECTION  1 - BASIC SETUP                                                *******/
/*************************************************************************************************/

  /**************************    The type of multicopter    ****************************/
    #define SINGLECOPTER
    #define MINTHROTTLE 1000
    #define MAXTHROTTLE 1850
    #define MINCOMMAND  1000
    #define I2C_SPEED 400000L   //400kHz fast mode, it works only with some WMP clones
    #define INTERNAL_I2C_PULLUPS
    #define CRIUS_AIO_PRO_V1

/*************************************************************************************************/
/****************  SECTION  2 - COPTER TYPE SPECIFIC OPTIONS                               *******/
/*************************************************************************************************/

    #define ALLOW_ARM_DISARM_VIA_TX_YAW
    #define SERVO_RATES      {100, 100, 100, 100, 100, 100, 100, 100} // Rates in 0-100%
    #define SERVO_DIRECTION  { -1,   1,   1,   1,  1,  1,   1,  1 } // Invert servos by setting -1 
    //#define SERVO_OFFSET     {  0,   0,   0,  40,   40,   0,  50,   0 } // Patrik's EZ-Hawk 
    #define SERVO_OFFSET     {  0,   0,   0,  0,   0,   0,  0,   0 } // Adjust Servo MID Offset & Swash angles
    // Selectable channels:=    ROLL,PITCH,THROTTLE,YAW,AUX1,AUX2,AUX3,AUX4
    /* Change to -1 to reverse servomovement per axis Servosettings for SingleCopter */
    //#define SINGLECOPTRER_YAW   {1, 1, 1, 1} // Left, Right,Front,Rear  //setingan normal
    #define SINGLECOPTRER_YAW   {-1, -1, -1, -1} // Left, Right,Front,Rear // reverse servo
    #define SINGLECOPTRER_SERVO {1,-1, 1,-1} // Pitch,Pitch,Roll, Roll    

/*************************************************************************************************/
/****************  SECTION  5 - ALTERNATE SETUP                                            *******/
/*************************************************************************************************/
  /******                Serial com speed    *********************************/
    #define SERIAL0_COM_SPEED 38400
    #define SERIAL1_COM_SPEED 38400
    #define SERIAL2_COM_SPEED 38400
    #define SERIAL3_COM_SPEED 38400

    /* interleaving delay in micro seconds between 2 readings WMP/NK in a WMP+NK config
       if the ACC calibration time is very long (20 or 30s), try to increase this delay up to 4000
       it is relevent only for a conf with NK */
    #define INTERLEAVING_DELAY 3000

    /* when there is an error on I2C bus, we neutralize the values during a short time. expressed in microseconds
       it is relevent only for a conf with at least a WMP */
    #define NEUTRALIZE_DELAY 100000

/*************************************************************************************************/
/****************  SECTION  7 - TUNING & DEVELOPER                                  **************/
/*************************************************************************************************/

    #define MIDRC 1500      //Titik Tengah Servo
    #define SERVO_RFR_50HZ  //Servo Refresh rate

  /********************************************************************/
  /****           IMU complimentary filter tuning                  ****/
  /********************************************************************/

    /* Set the Low Pass Filter factor for ACC
       Increasing this value would reduce ACC noise (visible in GUI), but would increase ACC lag time
       Comment this out if you want to set a specific coeff (non default)*/
    //#define ACC_LPF_FACTOR 100

    /* Set the Low Pass Filter factor for Magnetometer
       Increasing this value would reduce Magnetometer noise (not visible in GUI), but would increase Magnetometer lag time
       Comment this out if you want to set a specific coeff (non default)*/
    //#define MG_LPF_FACTOR 4

    /* Set the Gyro Weight for Gyro/Acc complementary filter
       Increasing this value would reduce and delay Acc influence on the output of the filter
       Comment this out if you want to set a specific coeff (non default)*/
    //#define GYR_CMPF_FACTOR 400.0f

    /* Set the Gyro Weight for Gyro/Magnetometer complementary filter
       Increasing this value would reduce and delay Magnetometer influence on the output of the filter
       Comment this out if you want to set a specific coeff (non default)*/
    //#define GYR_CMPFM_FACTOR 200.0f
