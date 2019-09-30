boolean doing=true;
class Button
{
  float x=0;
  float y=0;
  
  int w=0;
  int h=0;
  boolean press;
  String text;
  
  Action action;
  
  Button(float xx, float yy, int ww, int hh, Action actionn)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    action=actionn;
    text="";
  }
  void display()
  {
    color col=color(180,255,0);
    if(press)
    {
      col=color(255,0,0);
    }
    stroke(col);
    if(text!="")
    {
      fill(col);
      textSize(30);
      textAlign(CENTER);
      text(text,x,y);
    }
    fill(0,0);
    strokeWeight(0);
    rect(x,y,w,h);
  }
  void pressed()
  {
    if(!mousePressed)
    {
      if(press)
      {
        action.act();
        background(0);
      }
      doing=true;
      press=false;
    }
    if(mousePressed)
    {
      if(mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2)
      {
        if(doing)
        {
          press=true;
        }
      }
      else if(press)
      {
        press=false;
        doing=false;
      }
    }
  }
  void setText(String arg)
  {
    text=arg;
  }
  void doAll()
  {
    pressed();
    display();
  }
}

interface Action
{
  public void act();
}