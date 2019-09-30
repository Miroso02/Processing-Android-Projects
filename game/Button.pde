class Button
{
  int x;
  int y;
  int w;
  int h;
  
  int r;
  int g;
  int b;
  Button(int xx,int yy,int ww,int hh,int rr,int gg,int bb)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    r=rr;
    g=gg;
    b=bb;
  }
  void display()
  {
    strokeWeight(1);
    stroke(r,g,b);
    fill(r,g,b,100);
    rect(x,y,w,h);
  }
  boolean pressed()
  {
    boolean res=false;
    if(doing)
    {
      if(mousePressed && mouseX>=x && mouseX<=x+w && mouseY>=y && mouseY<=y+h)
      {
        doing=false;
        res=true;
        
      }
      else
      res=false;
    }
    if(!mousePressed)
    doing=true;
    return res;
  }
}