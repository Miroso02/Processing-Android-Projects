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
  void display(float xx,float yy, int ww, int hh,String text,String fileName)
  {
    color col=color(255,230,150);
    if(press)
    {
      col=color(255);
    }
    x=xx;
    toFile=fileName;
    y=yy;
    w=ww;
    h=hh;
    fill(0,0);
    strokeWeight(0);
    stroke(col);
    rect(x,y,w,h);
    fill(col);
    textSize(30);
    textAlign(LEFT);
    text(text,x+10,y+10,w+20,h-10);
  }
  boolean pressed()
  {
    boolean res=false;
    if(!mousePressed)
    {
      if(press)
      {
        if(toFile!=null)
        textFile=toFile;
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