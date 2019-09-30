class Cursor
{
  int x,y;
  Cursor(int xx,int yy)
  {
    x=xx;
    y=yy;
  }
  void display()
  {
    fill(0,0);
    strokeWeight(5);
    stroke(255,255,0);
    rect(x,y,s,s);
  }
  void move()
  {
    if(mousePressed && mouseX<10*s)
    {
      if(doing)
      {
        x=int(mouseX/s)*s;
        y=int(mouseY/s)*s;
        doing=false;
      }
    }
    if(!mousePressed)
    doing=true;
  }
}