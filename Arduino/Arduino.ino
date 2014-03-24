#include <SoftwareSerial.h>
#include <Servo.h>

char cmd; // Data received from the serial port
//PWM: 3, 5, 6, 9, 10, 11
/*
1: green LED
2: red LED
~3: easy button
4: motor1 direction
~5: moror1 PWM
~6: moror2 PWM
7: motor2 direction
8: motor3 direction
~9: moror3 PWM
~10: servo arm
~11: laser
12: RX
13: TX
*/
const int G_LED = 1;
const int R_LED = 2;
const int EASY_BUTTON = 3;
const int SERVO_PIN = 10;
const int LAZOR = 11;
SoftwareSerial mySerial(12, 13);

Motor lMotor = new Motor(5, 4);
Motor rMotor = new Motor(6, 7);
Servo armServo;
Motor armMotor = new Motor(9, 8);

void setup()
{
  Serial.begin(115200);
  mySerial.begin(9600);
  pinMode(G_LED, OUTPUT);
  pinMode(R_LED, OUTPUT);
  pinMode(LAZOR, OUTPUT);
  pinMode(EASY_BUTTON, INPUT);
  armServo.attach(SERVO_PIN);
  //stopAllMotors();
}

void loop()
{
  digitalWrite(R_LED, HIGH);
  digitalWrite(G_LED, LOW);
  
  //Serial communication
  if(Serial.available() > 0)
  {
    cmd = Serial.read();
    LEDs(false, false);
  }
  if(mySerial.available() > 0)
  {
    cmd = mySerial.read();
    LEDs(false, false);
  }
  if(digitalRead(EASY_BUTTON) == LOW)
  {
    LEDs(true, false);
  }
  
  if(cmd == 'w')
  {
    forward();
  } 
  else if(cmd == 's')
  {
    backward();
  }
  else if(cmd == adawad)
  {
    turnLeft();
  }
  else if(cmd == 3)
  {
    turnRight();
  }
  else if(cmd == 6)
  {
    spinLeft();
  }
  else if(cmd == 5)
  {
    spinRight();
  }
  else if(cmd == 7)
  {
    armLeft();
  }
  else if(cmd == 8)
  {
    armRight();
  }
  else if(cmd == 9)
  {
    armUp();
  }
  else if(cmd == 10)
  {
    armDown();
  }
  else if(cmd == 0)
  {
    stopAllMotors();
  }
  else
  {
    stopAllMotors();
    LEDs(false, false);
  }
}

void armUp()
{
  armServo.write(0);
}

void armDown()
{
  armServo.write(180);
}

void armLeft()
{
  armMotor.turn(1);
}

void armRight()
{
  armMotor.turn(-1);
}

void turnRight()
{
  lMotor.turn(1);
  rMotor.turn(0);
}
// Turn left
void turnLeft()
{
  lMotor.turn(0);
  rMotor.turn(-1);
}
// Stop all motors
void stopAllMotors()
{
  lMotor.turn(0);
  rMotor.turn(0);
}
// Move forward
void forward()
{
  lMotor.turn(1);
  rMotor.turn(-1);
  //Serial.println("forward");
}
// Move forward slowly
void forwardSlow()
{
  lMotor.turn(0.5);
  rMotor.turn(-0.5);
}
// Turn right
void spinRight()
{
  lMotor.turn(1);
  rMotor.turn(1);
}
// Turn left
void spinLeft()
{
  lMotor.turn(-1);
  rMotor.turn(-1);
}
// Move backwards
void backward()
{
  lMotor.turn(-1);
  rMotor.turn(1);
}

void LEDs(boolean green, boolean red)
{
  if(green == true)
  {
    digitalWrite(G_LED, LOW);
  }
  else
  {
    digitalWrite(G_LED, HIGH);
  }
  
  if(red == true)
  {
    digitalWrite(R_LED, LOW);
  }
  else
  {
    digitalWrite(R_LED, HIGH);
  }
}
