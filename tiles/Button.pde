class Button
{
  int x,y;
  byte in;
  Button(int xx,int yy,byte inn)
  {
    x=xx;
    y=yy;
    in=inn;
  }
  void display()
  {
    fill(150,100);
    rect(x,y,60,60);
    fill(150,150);
    switch(in)
    {
      case 1: triangle(x+10,y+50,x+50,y+50,x+30,y+10); break;//up
      case 2: triangle(x+10,y+10,x+50,y+10,x+30,y+50); break;//down
      case 3: triangle(x+50,y+10,x+50,y+50,x+10,y+30); break;//left
      case 4: triangle(x+10,y+10,x+10,y+50,x+50,y+30); break;//right
    }
    
  }
  boolean pressed()
  {
    boolean res=false;
    if(doing)
    {
      if(mousePressed && mouseX>x-20 && mouseX<x+100 && mouseY>y-20 && mouseY<y+100)
      {
        res=true;
        doing=false;
      }
    }
    if(!mousePressed)
    doing=true;
    return res;
  }
}