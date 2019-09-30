boolean doing3=true, doing4=true;
//1/clasic/const;
//2/clasic/line;
//3/arkada/;
int score=0;
Button Menu;
Obj[] Wave=new Obj[10];
Obj Circle, Kub;
/////////////////////////////////////////////////////
void mousePressed()
{
  score--;
}
/////////////////////////////////////////////////////
void mouseReleased()
{
  doing3=true;
  doing4=true;
}
/////////////////////////////////////////////////////
void gam()
{
  background(0);
  
  if(playMusic)
  if(startMusic || !gameMusic.isPlaying())
    gameMusic.start();
  
  for(int i=0;i<Wave.length;i++)
  {
    if(Wave[i].a>0)
      Wave[i].wawe();
  }
  if(modeIndex==3 && Kub.R>0)
    Kub.Kube();
    Circle.circle();
  fill(0,0,255);
  textSize(80);
  text(score,width/2,100);
  Menu.display("Menu",false);
  if(Menu.pressed())
  {
    score++;
    menu=true;
    startMusic=true;
    gameMusic.pause();
    gameMusic.seekTo(0);
    
    menuWindow=0;//выключаем все окна в меню
  }
}
/////////////////////////////////////////////////////
class Obj
{
  boolean b=false;
  float x,y,R;
  int a=0;
  color col=color(0,0,0);
/////////////////////////////////////////////////////
  Obj()
  {
    R=radius0;
    x=width/2;
    y=height/2;
    while(red(col)+green(col)+blue(col)<100)
    {
      col=color(random(255),random(255),random(255));
    }
  }
/////////////////////////////////////////////////////
  void spawn(boolean c)
  {
    int j=10;
    for (int i=0;i<10;i++)
    {
      if(Wave[i].a<1)
        j=i;
    }
    Wave[j].R=R;
    Wave[j].col=color(red(col),green(col),blue(col));
    Wave[j].x=x;
    Wave[j].y=y;
    Wave[j].a=255;
    Wave[j].b=c;
  }
/////////////////////////////////////////////////////
void wawe()
{
  R+=10;
  a-=5;
  fill(0,0);
  strokeWeight(10);
  stroke(col,a);
  if(b)
    rect(x-R/2,y-R/2,R,R);
  else 
    ellipse(x,y,R,R);
}
/////////////////////////////////////////////////////
  void circle()
  {
    if(a<1)
      R-=decreaseSpeedGame;
    else
      R-=decreaseSpeedGame/5;
    if(mousePressed && doing3)
    {
      doing3=false;
      if(sq(mouseX-x)+sq(mouseY-y)<R*R/4)
      {
        doing4=false;
        spawn(false);
        col=color(random(255),random(255),random(255));
        while(red(col)+green(col)+blue(col)<100)
        {
          col=color(random(255),random(255),random(255));
        }
        if(a<1)
        {
          x=random(R/2,width-R/2);
          y=random(R/2,height-R/2);
          R=radius0;
          if(int(random(10))==5 && !b && modeIndex==3)
          {
            a=10;
            b=true;
          }
          score+=2;
          if(decreaseSpeedGame==0)
          {
            decreaseSpeedGame=4;
            score=0;
          }
          if(modeIndex==2)
            decreaseSpeedGame+=deltaDecrease;
          if(int(random(10))==3 && Kub.R<1)
          {
            Kub.x=random(R/2,width-R/2);
            Kub.y=random(R/2,height-R/2);
            Kub.R=radius0;
            Kub.col=color(random(255),random(255),random(255));
            while(red(Kub.col)+green(Kub.col)+blue(Kub.col)<100)
            {
              Kub.col=color(random(255),random(255),random(255));
            }
          }
        }
        else
        {
          a--;
          score+=2;
        }
      }
    }
    if(R<0)
    {
      decreaseSpeedGame=0;
      modeIndex=1;
      Circle=new Obj();
    }
    fill(col);
    strokeWeight(0);
    stroke(0);
    ellipse(x,y,R,R);
    fill(255-red(col),255-green(col),255-blue(col));
    textSize(60);
    if(decreaseSpeedGame==0)
      text("Play",width/2,height/2+20);
    if(a>0)
      text(a,x,y+R/10);
  }
/////////////////////////////////////////////////////
  void Kube()
  {
    R-=decreaseSpeedGame*2;
    if(mousePressed && doing4)
    {
      doing4=false;
      if(mouseX>x-R/2 && mouseX<x+R/2 && mouseY>y-R/2 && mouseY<y+R/2)
      {
        doing3=false;
        spawn(true);
        R=0;
        score+=6;
      }
    }
    fill(col);
    strokeWeight(0);
    stroke(0);
    rect(x-R/2,y-R/2,R,R);
  }
}