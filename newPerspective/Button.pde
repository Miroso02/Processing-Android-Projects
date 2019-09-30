class Button
{
  float x=0;
  float y=0;
  
  int w=0;
  int h=0;
  
  Button(float xx,float yy,int ww,int hh)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
  }
  void display(String text)
  {
    fill(0);
    if(pressed())
      fill(255,0,0);
    rect(x,y,w,h);
  }
  boolean pressed()
  {
    if(mousePressed)
    {
      if(mouseX-displayWidth/2>x && mouseX-displayWidth/2<x+w && mouseY-displayHeight/2>y && mouseY-displayHeight/2<y+h)
      {
        return true;
      }
    }
    return false;
  }
}