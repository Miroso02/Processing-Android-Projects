class Me
{
  float x,y;
  int w;
  int nAr;
  Arrow[] bullets=new Arrow[150];
  public Me(float xx,float yy,int ww)
  {
    x=xx;
    y=yy;
    w=ww;
    for(int a=0;a<bullets.length;a++)
    {
      bullets[a]=new Arrow(x,y,6,new Moving()
      {
        public float[] fire(int a, float xL,float yL, float...other)
        {
          float spArX=0,spArY=0;
          int p=nAr%3;
          switch(p)
          {
            case 0: 
              spArX=0;
            break;
            case 1:
              spArX=2;;
            break;
            case 2:
              spArX=-2;
            break;
          }
          spArY=-30;
          
          float[] res={xL,yL,spArX,spArY,1};
          return res;
        }
      });
    }
  }
  private void display()
  {
    noStroke();
    fill(255);
    ellipse(x,y,w,w);
  }
  public void move()
  {
    for(int a=0;a<2;a++)
    {
      bullets[nAr].fire(nAr,x,y,null);
      nAr++;
      if(nAr>=149)
        nAr=0;
    }
    for(int a=0;a<bullets.length;a++)
    {
      bullets[a].doAll();
    }
    if(mousePressed)
    {
      if(x>0 && x<width && y>0 && y<height)
      {
        x+=0.8*(mouseX-pmouseX);
        y+=0.8*(mouseY-pmouseY);
      }
      else
      {
        if(x<=0)x=1;
        else if(x>=width)x=width-1;
        if(y<=0)y=1;
        else if(y>=height)y=height-1;
      }
    }
    display();
  }
}