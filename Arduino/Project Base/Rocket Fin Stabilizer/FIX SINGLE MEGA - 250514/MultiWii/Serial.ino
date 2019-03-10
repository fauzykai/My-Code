#define UART_NUMBER 4
#define RX_BUFFER_SIZE 64
#define TX_BUFFER_SIZE 128
#define INBUF_SIZE 64

static volatile uint8_t serialHeadRX[UART_NUMBER],serialTailRX[UART_NUMBER];
static uint8_t serialBufferRX[RX_BUFFER_SIZE][UART_NUMBER];
static volatile uint8_t serialHeadTX[UART_NUMBER],serialTailTX[UART_NUMBER];
static uint8_t serialBufferTX[TX_BUFFER_SIZE][UART_NUMBER];
static uint8_t inBuf[INBUF_SIZE][UART_NUMBER];

// Multiwii Serial Protocol 0 
#define MSP_STANDBY               48   // in message(0)         no param
#define MSP_STEADY                49   // in message(1)         no param
#define MSP_GO                    50   // in message(2)         no param
#define MSP_SEPARATION            51   // in message(3)         no param

#define MSP_RAW_IMU               97   //out message(a)         9 DOF
#define MSP_ATTITUDE              98   //out message(b)         2 angles 1 heading
#define MSP_ALTITUDE              99   //out message(c)         1 altitude
#define MSP_SERVO                100   //out message(d)         8 servos
#define MSP_MOTOR                101   //out message(e)         8 motors
#define MSP_RC                   102   //out message(f)         8 rc chan
#define MSP_MOTOR_PINS           103   //out message(g)         which pins are in use for motors & servos, for GUI 

#define MSP_ACC_CALIBRATION      104   //in message(i)          no param
#define MSP_MAG_CALIBRATION      105   //in message(j)          no param

#define MSP_EEPROM_WRITE         250   //in message          no param


static uint8_t checksum[UART_NUMBER];
static uint8_t indRX[UART_NUMBER];
static uint8_t cmdMSP[UART_NUMBER];
static uint8_t CURRENTPORT=0;

uint8_t read8()  {
  return inBuf[indRX[CURRENTPORT]++][CURRENTPORT]&0xff;
}

uint16_t read16() {
  uint16_t t = read8();
  t+= (uint16_t)read8()<<8;
  return t;
}

uint32_t read32() {
  uint32_t t = read16();
  t+= (uint32_t)read16()<<16;
  return t;
}

void serialize8(uint8_t a) {
  uint8_t t = serialHeadTX[CURRENTPORT];
  if (++t >= TX_BUFFER_SIZE) t = 0;
  serialBufferTX[t][CURRENTPORT] = a;
  checksum[CURRENTPORT] ^= a;
  serialHeadTX[CURRENTPORT] = t;
}

void serialize16(int16_t a) {
  serialize8((a   ) & 0xFF);
  serialize8((a>>8) & 0xFF);
}

void serialize32(uint32_t a) {
  serialize8((a    ) & 0xFF);
  serialize8((a>> 8) & 0xFF);
  serialize8((a>>16) & 0xFF);
  serialize8((a>>24) & 0xFF);
}

void headSerialResponse(uint8_t err, uint8_t s) {
  serialize8('$');
  serialize8('M');
  serialize8(err ? '!' : '>');
  checksum[CURRENTPORT] = 0; // start calculating a new checksum
  serialize8(s);
  serialize8(cmdMSP[CURRENTPORT]);
}

void headSerialReply(uint8_t s) {
  headSerialResponse(0, s);
}

void inline headSerialError(uint8_t s) {
  headSerialResponse(1, s);
}

void tailSerialReply() {
  serialize8(checksum[CURRENTPORT]);UartSendData();
}

void serializeNames(PGM_P s) {
  for (PGM_P c = s; pgm_read_byte(c); c++) {
    serialize8(pgm_read_byte(c));
  }
}

void serialCom() {
  uint8_t c,n;  
  static uint8_t offset[UART_NUMBER];
  static uint8_t dataSize[UART_NUMBER];
  static enum _serial_state {
    IDLE,
    HEADER_START,
    HEADER_M,
    HEADER_ARROW,
    HEADER_SIZE,
    HEADER_CMD,
  } c_state[UART_NUMBER];// = IDLE;  
  
  for(n=0;n<UART_NUMBER;n++) {
    CURRENTPORT=n;
    #define GPS_COND
    #define SPEK_COND
    while (SerialAvailable(CURRENTPORT) GPS_COND SPEK_COND) {
      uint8_t bytesTXBuff = ((uint8_t)(serialHeadTX[CURRENTPORT]-serialTailTX[CURRENTPORT]))%TX_BUFFER_SIZE; // indicates the number of occupied bytes in TX buffer
      if (bytesTXBuff > TX_BUFFER_SIZE - 50 ) return; // ensure there is enough free TX buffer to go further (50 bytes margin)
      c = SerialRead(CURRENTPORT);  
      if (c_state[CURRENTPORT] == IDLE) {
        c_state[CURRENTPORT] = (c=='$') ? HEADER_START : IDLE;
        if (c_state[CURRENTPORT] == IDLE) evaluateOtherData(c); // evaluate all other incoming serial data
      } else if (c_state[CURRENTPORT] == HEADER_START) {
        c_state[CURRENTPORT] = (c=='M') ? HEADER_M : IDLE;
      } else if (c_state[CURRENTPORT] == HEADER_M) {
        c_state[CURRENTPORT] = (c=='<') ? HEADER_ARROW : IDLE; 
      } else if (c_state[CURRENTPORT] == HEADER_ARROW) {
        cmdMSP[CURRENTPORT] = c;
        evaluateCommand();  // we got a valid packet, evaluate it
        c_state[CURRENTPORT] = IDLE;
      } else c_state[CURRENTPORT] = IDLE;      
    }
  }
}

void evaluateCommand() {
  switch(cmdMSP[CURRENTPORT]) {
   case MSP_STANDBY:
     go_state = HEADER_STANDBY;
     break;
   case MSP_STEADY:     
     if (go_state == HEADER_STANDBY) go_state = HEADER_STEADY;
     break;
   case MSP_GO:
     if (go_state == HEADER_STEADY) go_state = HEADER_GO;
     break;
   case MSP_SEPARATION:
     if (go_state == HEADER_GO) go_state = HEADER_SEPARATION;
     break;
   case MSP_RAW_IMU:
     //headSerialReply(18);
     headSerialReply(28);
     for(uint8_t i=0;i<3;i++) serialize16(accSmooth[i]); 
     for(uint8_t i=0;i<3;i++) serialize16(gyroData[i]);  
     for(uint8_t i=0;i<3;i++) serialize16(magADC[i]);   
     //edit    
     for(uint8_t i=0;i<2;i++) serialize16(angle[i]);
     serialize16(heading); 
     serialize32(EstAlt);
     //
     break;
   case MSP_ATTITUDE:
     headSerialReply(8);
     for(uint8_t i=0;i<2;i++) serialize16(angle[i]);
     serialize16(heading);
     serialize16(headFreeModeHold);
     break;
   case MSP_ALTITUDE:
     headSerialReply(4);
     serialize32(EstAlt);
     break;
   case MSP_SERVO:
     headSerialReply(16);
     for(uint8_t i=0;i<8;i++)
       serialize16(servo[i]);
     break;
   case MSP_MOTOR:
     headSerialReply(16);
     for(uint8_t i=0;i<8;i++) {
       serialize16( (i < NUMBER_MOTOR) ? motor[i] : 0 );
     }
     break;
   case MSP_RC:
     headSerialReply(16);
     for(uint8_t i=0;i<8;i++) serialize16(rcData[i]);
     break;
   case MSP_MOTOR_PINS:
     headSerialReply(8);
     for(uint8_t i=0;i<8;i++) serialize8(PWM_PIN[i]);
     break;
   case MSP_ACC_CALIBRATION:
     if(!f.ARMED) calibratingA=400;
     headSerialReply(0);
     break;
   case MSP_MAG_CALIBRATION:
     if(!f.ARMED) f.CALIBRATE_MAG = 1;
     headSerialReply(0);
     break;
   default:  // we do not know how to handle the (valid) message, indicate error MSP $M!
     headSerialError(0);
     break;
  }
  tailSerialReply();
}

void printDebug(unsigned int data){
  unsigned int n=0;
  unsigned int bantu;
  serialize8(10);
  serialize8(13);
  if (data>9999999) n=7; 
  else if (data>999999) n=6;
  else if (data>99999) n=5;
  else if (data>9999) n=4;
  else if (data>999) n=3;
  else if (data>99) n=2;
  else if (data>9) n=1;
  for (int i=n;i>=0;i--){
    bantu=pow(10,i);
    serialize8(48+(data/bantu));
    data = data%bantu;
  }
  UartSendData();
}

// evaluate all other incoming serial data
void evaluateOtherData(uint8_t sr) {
  switch (sr) {
  }
}

// *******************************************************
// Interrupt driven UART transmitter - using a ring buffer
// *******************************************************

  ISR(USART0_UDRE_vect) { // Serial 0 on a MEGA
    uint8_t t = serialTailTX[0];
    if (serialHeadTX[0] != t) {
      if (++t >= TX_BUFFER_SIZE) t = 0;
      UDR0 = serialBufferTX[t][0];  // Transmit next byte in the ring
      serialTailTX[0] = t;
    }
    if (t == serialHeadTX[0]) UCSR0B &= ~(1<<UDRIE0); // Check if all data is transmitted . if yes disable transmitter UDRE interrupt
  }
  ISR(USART1_UDRE_vect) { // Serial 1 on a MEGA or on a PROMICRO
    uint8_t t = serialTailTX[1];
    if (serialHeadTX[1] != t) {
      if (++t >= TX_BUFFER_SIZE) t = 0;
      UDR1 = serialBufferTX[t][1];  // Transmit next byte in the ring
      serialTailTX[1] = t;
    }
    if (t == serialHeadTX[1]) UCSR1B &= ~(1<<UDRIE1);
  }
  ISR(USART2_UDRE_vect) { // Serial 2 on a MEGA
    uint8_t t = serialTailTX[2];
    if (serialHeadTX[2] != t) {
      if (++t >= TX_BUFFER_SIZE) t = 0;
      UDR2 = serialBufferTX[t][2];
      serialTailTX[2] = t;
    }
    if (t == serialHeadTX[2]) UCSR2B &= ~(1<<UDRIE2);
  }
  ISR(USART3_UDRE_vect) { // Serial 3 on a MEGA
    uint8_t t = serialTailTX[3];
    if (serialHeadTX[3] != t) {
      if (++t >= TX_BUFFER_SIZE) t = 0;
      UDR3 = serialBufferTX[t][3];
      serialTailTX[3] = t;
    }
    if (t == serialHeadTX[3]) UCSR3B &= ~(1<<UDRIE3);
  }

void UartSendData() {
  switch (CURRENTPORT) {
    case 0: UCSR0B |= (1<<UDRIE0); break;
    case 1: UCSR1B |= (1<<UDRIE1); break;
    case 2: UCSR2B |= (1<<UDRIE2); break;
    case 3: UCSR3B |= (1<<UDRIE3); break;
  }
}

static void inline SerialOpen(uint8_t port, uint32_t baud) {
  uint8_t h = ((F_CPU  / 4 / baud -1) / 2) >> 8;
  uint8_t l = ((F_CPU  / 4 / baud -1) / 2);
  switch (port) {
    case 0: UCSR0A  = (1<<U2X0); UBRR0H = h; UBRR0L = l; UCSR0B |= (1<<RXEN0)|(1<<TXEN0)|(1<<RXCIE0); break;
    case 1: UCSR1A  = (1<<U2X1); UBRR1H = h; UBRR1L = l; UCSR1B |= (1<<RXEN1)|(1<<TXEN1)|(1<<RXCIE1); break;
    case 2: UCSR2A  = (1<<U2X2); UBRR2H = h; UBRR2L = l; UCSR2B |= (1<<RXEN2)|(1<<TXEN2)|(1<<RXCIE2); break;
    case 3: UCSR3A  = (1<<U2X3); UBRR3H = h; UBRR3L = l; UCSR3B |= (1<<RXEN3)|(1<<TXEN3)|(1<<RXCIE3); break;
  }
}

static void inline SerialEnd(uint8_t port) {
  switch (port) {
    case 0: UCSR0B &= ~((1<<RXEN0)|(1<<TXEN0)|(1<<RXCIE0)|(1<<UDRIE0)); break;
    case 1: UCSR1B &= ~((1<<RXEN1)|(1<<TXEN1)|(1<<RXCIE1)|(1<<UDRIE1)); break;
    case 2: UCSR2B &= ~((1<<RXEN2)|(1<<TXEN2)|(1<<RXCIE2)|(1<<UDRIE2)); break;
    case 3: UCSR3B &= ~((1<<RXEN3)|(1<<TXEN3)|(1<<RXCIE3)|(1<<UDRIE3)); break;
  }
}

static void inline store_uart_in_buf(uint8_t data, uint8_t portnum) {
  uint8_t h = serialHeadRX[portnum];
  if (++h >= RX_BUFFER_SIZE) h = 0;
  if (h == serialTailRX[portnum]) return; // we did not bite our own tail?
  serialBufferRX[serialHeadRX[portnum]][portnum] = data;  
  serialHeadRX[portnum] = h;
}

ISR(USART0_RX_vect)  { store_uart_in_buf(UDR0, 0); }
ISR(USART1_RX_vect)  { store_uart_in_buf(UDR1, 1); }
ISR(USART2_RX_vect)  { store_uart_in_buf(UDR2, 2); }
ISR(USART3_RX_vect)  { store_uart_in_buf(UDR3, 3); }

uint8_t SerialRead(uint8_t port) {
  uint8_t t = serialTailRX[port];
  uint8_t c = serialBufferRX[t][port];
  if (serialHeadRX[port] != t) {
    if (++t >= RX_BUFFER_SIZE) t = 0;
    serialTailRX[port] = t;
  }
  return c;
}

void SerialWrite(uint8_t port,uint8_t c){
  CURRENTPORT=port;
  serialize8(c);UartSendData();
}

uint8_t SerialAvailable(uint8_t port) {
  return (serialHeadRX[port] - serialTailRX[port])%RX_BUFFER_SIZE;
}

