class Button
{
  int x;
  int y;
  
  int w;
  int h;
  
  color col;
  String toFile;
  
  Button(color cc)
  {
    col=cc;
  }
  void display(int xx,int yy, int ww, int hh,String text,String fileName)
  {
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
    doing=true;
    else
    {
      if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h && doing==true)
      {
        textFile=toFile;
        res=true;
        doing=false;
      }
    }
    return res;
  }
}