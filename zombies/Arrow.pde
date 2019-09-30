class Arrow
{
  float x;
  float y;
  float targetX;
  float targetY;
  float speed, length;
  float spX, spY;
  
  Arrow()
  {
    speed=20;
    x=-10;
    y=-10;
    targetX=-11;
    targetY=-11;
    length=5;
  }
  Arrow(float x, float y, float targetX, float targetY)
  {
    speed=20;
    length=5;
    this.x=x;
    this.y=y;
    this.targetY=targetY;
    this.targetX=targetX;
  }
  
  void display()
  {
    strokeWeight(2);
    stroke(0);
    line(x,y,length*(targetX-x)/sqrt(sq(targetX-x)+sq(targetY-y))+x, length*(targetY-y)/sqrt(sq(targetX-x)+sq(targetY-y))+y);
  }
  
  void move(float tx, float ty)
  {
    targetX=tx;
    targetY=ty;
    spY=(targetY-y)*speed/sqrt(sq(targetX-x)+sq(targetY-y));
    spX=(targetX-x)*speed/sqrt(sq(targetX-x)+sq(targetY-y));
    x+=spX;
    y+=spY;
  }
  boolean gotToTarget()
  {
    if(sq(targetX-x)+sq(targetY-y)<=sq(speed))
    return true;
    else
    return false;
  }
}