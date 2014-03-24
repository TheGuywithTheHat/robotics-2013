class Motor
{
  int PWM_PIN;
  int DIR_PIN;
  Motor(int PWMpin, int DIR)
  {
    PWM_PIN = PWMpin;
    DIR_PIN = DIR;
    pinMode(PWM_PIN, OUTPUT);
    pinMode(DIR_PIN, OUTPUT);
  }
  void turn(float velocity)
  {
    if(velocity < 0)
    {
      analogWrite(PWM_PIN, velocity * 255);
      digitalWrite(DIR_PIN, LOW);
    }
    else if(velocity => 0)
    {
      analogWrite(PWM_PIN, velocity * 255);
      digitalWrite(DIR_PIN, HIGH);
    }
  }
}
