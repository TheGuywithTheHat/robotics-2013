import processing.serial.*;

Serial myPort;
int val;
int cmd = 0;
int pCmd = 0;
boolean[] keys = new boolean[526];
int rbotZOffset = 0;
float rbotRotation = 0;
float turn = 0;
int forward = 'w';
int backward = 's';
int turnRight = 'e';
int turnLeft = 'q';
int spinRight = 'd';
int spinLeft = 'a';
//int laserOn = 7;
//int laserOff = 8;
int armUp = 'i';
int armDown = 'k';
int armLeft = 'j';
int armRight = 'l';
int stopIt = ' ';
int input;
int pInput;
String portName;
//boolean laserIsOn = false;

void setup()
{
  //size(512, 512);
  //portName = Serial.list()[0];
  println(Serial.list());
  try
  {
    portName = Serial.list()[17];
    //size(512, 512, P3D);
  }
  catch(Exception e)
  {
    portName = Serial.list()[10];
    //size(512, 512);
  }
  myPort = new Serial(this, portName, 9600);
  
}

void send()
{
  myPort.write(command());
  //println(command());
}

void draw()
{
  command();
  
  if(cmd != pCmd)
  {
    send();
  }
  
  if(myPort.available() > 0)
  {
    input = myPort.readChar();
    println("'" + input + "'");
  }
  
  background(255);
  //draw2DRbot();
  //manageButtons();
  pInput = input;
  pCmd = cmd;
}

int command()
{
  if(!keyPressed && !mousePressed)
  {
    cmd = stopIt;
    //rbotZOffset = 0;
    //rbotRotation = 0;
    //turn = 0;
  }
  if(checkKey(KeyEvent.VK_W))
  {
    cmd = forward;
    //rbotZOffset = -20;
  }
  if(checkKey(KeyEvent.VK_S))
  {
    cmd = backward;
    //rbotZOffset = 20;
  }
  if(checkKey(KeyEvent.VK_A))
  {
    cmd = spinLeft;
  }
  if(checkKey(KeyEvent.VK_D))
  {
    cmd = spinRight;
  }
  if(checkKey(KeyEvent.VK_W) && checkKey(KeyEvent.VK_A))
  {
    cmd = turnLeft;
    //rbotZOffset = -20;
  }
  if(checkKey(KeyEvent.VK_W) && checkKey(KeyEvent.VK_D))
  {
    cmd = turnRight;
    //rbotZOffset -= -20;
  }
  if(checkKey(KeyEvent.VK_W) && checkKey(KeyEvent.VK_S))
  {
    //rbotZOffset = 0;
  }

  if(checkKey(KeyEvent.VK_S) && !checkKey(KeyEvent.VK_W) && !(checkKey(KeyEvent.VK_A) ^ checkKey(KeyEvent.VK_D)))
  {
    cmd = backward;
    //rbotZOffset = 20;
  }
  if(checkKey(KeyEvent.VK_SPACE))
  {
    cmd = armDown;
  }
  if(checkKey(KeyEvent.VK_RIGHT))
  {
    cmd = armRight;
  }
  if(checkKey(KeyEvent.VK_LEFT))
  {
    cmd = armLeft;
  }
  
  /*if(buttonForward.checkClicked())
  {
    cmd = forward;
    //rbotZOffset = -20;
  }
  if(buttonBackward.checkClicked())
  {
    cmd = backward;
    //rbotZOffset = 20;
  }
  if(buttonSpinLeft.checkClicked())
  {
    cmd = spinLeft;
  }
  if(buttonSpinRight.checkClicked())
  {
    cmd = spinRight;
  }
  if(buttonTurnLeft.checkClicked())
  {
    cmd = turnLeft;
    //rbotZOffset = -20;
  }
  if(buttonTurnRight.checkClicked())
  {
    cmd = turnRight;
    //rbotZOffset -= -20;
  }
  if(buttonArm.checkClicked())
  {
    cmd = armUp;
  }
  if(buttonLaser.checkClicked())
  {
    toggle(laserIsOn);
    switch(laserIsOn)
    {
      case true: cmd = laserOn;
        break;
      case false: cmd = laserOff;
        break;
    }
  }
  if(cmd == turnRight)
  {
    turn++;
    rbotRotation -= (0.1 / (turn + 0.5));
  }
  if(cmd == spinRight)
  {
    turn++;
    rbotRotation -= (0.1 / (turn + 0.5));
  }
  if(cmd == turnLeft)
  {
    turn--;
    rbotRotation += (-0.1 / (turn - 0.5));
  }
  if(cmd == spinLeft)
  {
    turn--;
    rbotRotation += (-0.1 / (turn - 0.5));
  }*/
  return(cmd);
}

Boolean toggle(Boolean toggle)
{
  if(toggle)
  {
    toggle = false;
  }
  else if(!toggle)
  {
    toggle = true;
  }
  return toggle;
}
