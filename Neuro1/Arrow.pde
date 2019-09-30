class Arrow //meteors
{
  float x,y; //position
  int size;  //radius
  float spX,spY; //velocity
  
  Arrow()
  {
    neW(); //look↓
  }
  
  void display()
  {
    fill(0);
    noStroke();
    ellipse(x,y,size,size);
  }
  
  void move()
  {
    x+=spX;
    y+=spY;
  }
  
  boolean isTouchingBorder()
  {
    if(x<0 || x>width || y<0 || y>height)
      return true;
    return false;
  }
  
  void neW()
  {
    spX=random(4);     //abs(speed) = 4
    spY=sqrt(16-sq(spX));
    
    x=0;       //you never know...
    y=height/2;
    
    int pos=(int)random(4)+1;
    //decide, on which border it appears
    int a=(int)random(2);
    //positive or negative speed
    
    switch(pos)
    {
      case 1:     //left
        x=0;
        y=random(height);
        if(a==0) spY=-spY;
        break;
        
      case 2:     //right
        x=width;
        y=random(height);
        spX=-spX;
        if(a==0) spY=-spY;
        break;
        
      case 3:     //up
        y=0;
        x=random(width);
        if(a==0) spX=-spX;
        break;
        
      case 4:     //down
        y=height;
        x=random(width);
        spY=-spY;
        if(a==0) spX=-spX;
        break;
    }
    
    size=100;//(int)random(70,120);
  }
}