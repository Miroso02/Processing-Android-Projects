class Me
{
  float x,y;
  float speed;
  int w;
  float fixX,fixY;
  float spX,spY;
  Me(float xx,float yy,float ss,int ww)
  {
    x=xx;
    y=yy;
    speed=ss;
    w=ww;
  }
  void display()
  {
    noStroke();
    fill(255);
    ellipse(x,y,w,w);
  }
  void move()
  {
    if(mousePressed)
    {
   
      xx=mouseX-x;
      yy=mouseY-y;
      spY=yy*speed/sqrt(xx*xx+yy*yy);
      spX=xx*speed/sqrt(xx*xx+yy*yy);
      fixX=mouseX;
      fixY=mouseY;
    }
    if(x>fixX-3 && x<fixX+3 && y>fixY-3 && y<fixY+3)
    {
       spX=0;
       spY=0;
    }
    if(xx!=0 && yy!=0)
      {
        y+=spY;
        x+=spX;
      }
  }
  void boom()
  {
    if(x+w>=width || x<=0)
    spX=-spX;
    if(y+w>=height || y<=0)
    spY=-spY;
  }
}