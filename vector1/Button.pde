class Button
{
  float x=0;
  float y=0;
  
  int w=0;
  int h=0;
  
  String toFile;
  
  boolean press;
  
  Button(float xx,float yy,int ww,int hh)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
  }
  void display(String text)
  {
    color col=color(0,0,255);
    if(press)
    {
      col=color(0,255,0);
    }
    stroke(col);
    if(text!="")
    {
      w=int(textWidth(text));
      
      h=50;
      fill(col);
      textSize(30);
      textAlign(CENTER);
      text(text,x+50,y+30);
    }
    fill(0,0);
    strokeWeight(0);
    rect(x,y,w,h);
  }
  boolean pressed()
  {
    boolean res=false;
    if(!mousePressed)
    {
      if(press)
      {
        res=true;
      }
      doing=true;
      press=false;
    }
    if(mousePressed)
    {
      if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h)
      {
        if(doing)
          press=true;
      }
      else if(press)
      {
        press=false;
        doing=false;
      }
    }
    return res;
  }
}