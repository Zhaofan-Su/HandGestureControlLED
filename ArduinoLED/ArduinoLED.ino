#include<string.h>



int myPins[4] = {9, 10, 11, 12};
int ledPin = 0;
int currentRead;


void setup() {
  // Activate all Digital pins on my board
//  for (int i = 0; i < 4; i++) {
//    pinMode(myPins[i], OUTPUT);
//  }
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
//   digitalWrite(9, HIGH);
//   digitalWrite(10, HIGH);
//   digitalWrite(11, HIGH);
//   digitalWrite(12, HIGH);
  Serial.begin(9600);
  Serial.print("setup done.");
}

void loop() {
  if (Serial.available()) {
      currentRead = Serial.read();
      if(currentRead != ledPin){
        ledPin = currentRead;
        Serial.print("enter if.");
          if(currentRead == 1){
                digitalWrite(9, LOW);}
          if(currentRead == 2){
               digitalWrite(10, LOW);}
          if(currentRead == 3){
               digitalWrite(11, LOW);}
          if(currentRead == 4){
               digitalWrite(12, LOW);}
          if(currentRead == 5){
               digitalWrite(9, HIGH);}
          if(currentRead == 6){
               digitalWrite(10, HIGH);}
          if(currentRead == 7){
               digitalWrite(11, HIGH);}
          if(currentRead == 8){
               digitalWrite(12, HIGH);
          } 
      }

  }
}
