import de.voidplus.leapmotion.*;
LeapMotion leap;
import processing.serial.*; // Serial libraries, send OUTPUT through USB
Serial myPort;
int ledPin;
int checkPin;

void setup() {
  size(1200, 800, P3D);
  background(255);
  noStroke();
  fill(50);
  
  myPort = new Serial(this, "/dev/cu.usbmodem1424201", 9600);
  // New leap object
  //leap = new LeapMotion(this).allowGestures();
  leap = new LeapMotion(this);
  //leap.pre();
  
}
void draw() {
  background(255);
  for (Hand hand : leap.getHands()) {
    hand.draw();
    delay(100);
   
   
    // draw fingers
    for(Finger finger : hand.getFingers()){
      finger.draw();  // Executes drawBones() and drawJoints()
      finger.drawBones();
      finger.drawJoints();
    }
   
   
   
    boolean turnOn = hand.isRight();
    
    
    
    // nums of fingers
    int fingersNum = hand.getOutstretchedFingers().size();
    checkPin = fingersNum;
    if(fingersNum != ledPin){
      System.out.println(checkPin);
      assignPin(turnOn, checkPin);
    }
    
  }
}

void assignPin(boolean turnOn, int fingersNum){
  ledPin = fingersNum;
  switch(fingersNum){
      case 1:
        if(turnOn){
          println("1 off");
          myPort.write(1);
        }else{
          println("1 on");
          myPort.write(5);
        }
        
        break;
      case 2:
        if(turnOn){
          println("2 off");
          myPort.write(2);
        }else{
          println("2 on");
          myPort.write(6);
        }
        
        break;
      case 3:
        if(turnOn){
          println("3 off");
          myPort.write(3);
        }else{
          println("3 on");
          myPort.write(7);
        }
        break;
      case 4:
        if(turnOn){
          println("4 off");
          myPort.write(4);
        }else{
          println("4 on");
          myPort.write(8);
        }
        break;
       default:
         break;
    }
}

void leapOnCircleGesture(CircleGesture g, int state){
  int direction = g.getDirection();

  switch(state){
    case 1: // Start
      println("circle start");
      break;
    case 2: // Update
      println("circle update");
      break;
    case 3: // Stop
      println("circle stop");
     
      break;
  }

  switch(direction){
    case 0: // Anticlockwise/Left gesture
      println("anti-clockwise");
      break;
    case 1: // Clockwise/Right gesture
      println("clockwise");
      break;
  }
}


void leapOnInit() {
  // println(“Leap Motion Init”);
}
void leapOnConnect() {
  // println(“Leap Motion Connect”);
}
void leapOnFrame() {
  // println(“Leap Motion Frame”);
}
void leapOnDisconnect() {
  // println(“Leap Motion Disconnect”);
}
void leapOnExit() {
  // println(“Leap Motion Exit”);
}
