// Frequency counter sketch, for measuring frequencies low enough to execute an interrupt for each cycle
// Connect the frequency source to the INT0 pin (digital pin 2 on an Arduino Uno)

volatile unsigned long firstPulseTime;
volatile unsigned long lastPulseTime;
volatile unsigned long numPulses;

void isr()
{
 unsigned long now = micros();
 if (numPulses == 1)
 {
   firstPulseTime = now;
 }
 else
 {
   lastPulseTime = now;
 }
 ++numPulses;
}

// Measure the frequency over the specified sample time in milliseconds, returning the frequency in Hz
float readFrequency(unsigned int sampleTime)
{
 numPulses = 0;                      // prime the system to start a new reading
 attachInterrupt(0, isr, RISING);    // enable the interrupt
 delay(sampleTime);
 detachInterrupt(0);
 return (numPulses < 3) ? 0 : (1000000.0 * (float)(numPulses - 2))/(float)(lastPulseTime - firstPulseTime);
}
