/**
Modified version of Option 1 multiplekeys (should provide improved performance and accuracy)
@author Yonas Sandbæk http://seltar.wliia.org (modified by jeffg)
usage:
if(checkKey(KeyEvent.VK_CONTROL) && checkKey(KeyEvent.VK_S)) println("CTRL+S");
*/

boolean checkKey(int k)
{
  if (keys.length >= k)
  {
    return keys[k];  
  }
  return false;
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}
