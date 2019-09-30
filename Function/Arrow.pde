class Arrow
{
  float x=0,y=0,speed;
  float xL,yL;
  float spArX=0,spArY=0;
  int nPoint;
  int typeOfMovingAfterTraectory;
  Point[] traectory;
  Arrow(Point[] tr)
  {
    traectory=tr;
    speed=4;
  }
  
  public void setTraectory(Point[] newTr)
  {
    traectory=newTr;
    x=traectory[0].x;
    y=traectory[0].y;
    nPoint=0;
    spArX=0;
    spArY=0;
  }
  
  private void display()
  {
    noStroke();
    fill(0,255,0);
    ellipse(x,y,10,10);
  }
  
  private void move()
  {
    Point p=traectory[nPoint];
    x+=speed*spArX;
    y+=speed*spArY;
    if(isNaN(x) || isNaN(y))
    {
      x=xL;
      y=yL;
    }
    xL=x;
    yL=y;
    if(sqrt(sq(x-p.x)+sq(y-p.y))<speed)
    {
      nPoint++;
      x=p.x;
      y=p.y;
      fire();
    }
  } 
  public void fire()
  {
    Point p=traectory[nPoint];
    float tx=p.x-x, ty=p.y-y;
    if(p.x!=0 && p.y!=0)
    {
      spArX=tx/sqrt(sq(tx)+sq(ty));
      spArY=ty/sqrt(sq(tx)+sq(ty));
    }
    else
    {
      switch(typeOfMovingAfterTraectory)
      {
        case 0: spArX=0;spArY=0;break;
        case 2:
          int deltaX=x-traectory[0].x,deltaY=y-traectory[0].y;
          for(int i=1;i<nPoint;i++)
          {
            traectory[i].x+=deltaX;
            traectory[i].y+=deltaY;
          }
          traectory[0].x+=deltaX;
          traectory[0].y+=deltaY;
          nPoint=1;
          fire();
          break;
      }
    }
  }  
  private boolean isNaN(float x){return x!=x;}
}