


// These constants won't change.  They're used to give names
// to the pins used:
const int analogInPin0 = A0;  // Analog input pin that the potentiometer is attached to
const int analogInPin1 = A1;  // Analog input pin that the potentiometer is attached to
const int analogInPin2 = A2;  // Analog input pin that the potentiometer is attached to
const int analogInPin3 = A3;  // Analog input pin that the potentiometer is attached to
const int analogInPin4 = A4;  // Analog input pin that the potentiometer is attached to

const int analogOutPin = 9; // Analog output pin that the LED is attached to

int sensorValue0 = 0;        // value read from the pot
int outputValue0 = 0;        // value output to the PWM (analog out)
int lastValue0 = 0;

int sensorValue1 = 0;        // value read from the pot
int outputValue1 = 0;        // value output to the PWM (analog out)
int lastValue1 = 0;

int sensorValue2 = 0;        // value read from the pot
int outputValue2 = 0;        // value output to the PWM (analog out)
int lastValue2 = 0;

int sensorValue3 = 0;        // value read from the pot
int outputValue3 = 0;        // value output to the PWM (analog out)
int lastValue3 = 0;

int sensorValue4 = 0;        // value read from the pot
int outputValue4 = 0;        // value output to the PWM (analog out)
int lastValue4 = 0;

void setup() {
  // i  nitialize serial communications at 9600 bps:
  Serial.begin(57600); 
}

void loop() {
  // read the analog in value:
  sensorValue0 = analogRead(analogInPin0);            
  // map it to the range of the analog out:
  outputValue0 = map(sensorValue0, 0, 1023, 1, 255);  
 
  // read the analog in value:
  sensorValue1 = analogRead(analogInPin1);            
  // map it to the range of the analog out:
  outputValue1 = map(sensorValue1, 0, 1023, 1, 255);  
 
  // read the analog in value:
  sensorValue2 = analogRead(analogInPin2);            
  // map it to the range of the analog out:
  outputValue2 = map(sensorValue2, 0, 1023, 1, 255);  
 
  // read the analog in value:
  sensorValue3 = analogRead(analogInPin3);            
  // map it to the range of the analog out:
  outputValue3 = map(sensorValue3, 0, 1023, 1, 255);   
   
  // read the analog in value:
  sensorValue4 = analogRead(analogInPin4);            
  // map it to the range of the analog out:
  outputValue4 = map(sensorValue4, 0, 1023, 1, 255);   



  Serial.write(outputValue0); 

  Serial.write(outputValue1); 
  
  Serial.write(outputValue2);

  Serial.write(outputValue3); 
  
  Serial.write(outputValue4); 
 
  Serial.write(0);
/*
  Serial.print("S0 "); 
  Serial.println(outputValue0); 
  Serial.print("S1 "); 
  Serial.println(outputValue1); 
  Serial.print("S2 "); 
  Serial.println(outputValue2); 
  Serial.print("S3 "); 
  Serial.println(outputValue3); 
*/
  // wait 2 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(5);                     
}


