#include <NewPing.h>

#define SONAR_NUM     4 // Number of sensors.
#define MAX_DISTANCE 100 // Maximum distance (in cm) to ping.
#define PING_INTERVAL 33 // Milliseconds between sensor pings (29ms is about the min to avoid cross-sensor echo).
#define DETECT_DISTANCE 5
#define REFRESH_RATE 500

const long interval = REFRESH_RATE;
unsigned long previousMillis = 0;
unsigned long pingTimer[SONAR_NUM]; // Holds the times when the next ping should happen for each sensor.
unsigned int cm[SONAR_NUM];         // Where the ping distances are stored.
unsigned int state[SONAR_NUM];
uint8_t currentSensor = 0;          // Keeps track of which sensor is active.
//byte trsh = TRESHOLD;

NewPing sonar[SONAR_NUM] = {     // Sensor object array.
  NewPing(A4, 5, MAX_DISTANCE), // Each sensor's trigger pin, echo pin, and max distance to ping.
  NewPing(A5, 4, MAX_DISTANCE),
  NewPing(A6, 3, MAX_DISTANCE),
  NewPing(A7, 2, MAX_DISTANCE),
};

void setup() {
  Serial.begin(9600);
  pingTimer[0] = millis() + 75;           // First ping starts at 75ms, gives time for the Arduino to chill before starting.
  for (uint8_t i = 1; i < SONAR_NUM; i++) // Set the starting time for each sensor.
    pingTimer[i] = pingTimer[i - 1] + PING_INTERVAL;
}

void loop() {
  unsigned long currentMillis = millis();
  scansensorultrasonic();


  if (currentMillis - previousMillis >= interval) {
    // save the last time you blinked the LED
    previousMillis = currentMillis;
    //scansensorultrasonic();
    printarray();
  }

  // Other code that *DOESN'T* analyze ping results can go here.
}


