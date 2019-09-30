import android.media.*;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
MediaPlayer menuMusic=new MediaPlayer();
MediaPlayer gameMusic=new MediaPlayer();

boolean startMusic=true;
boolean menu=true;
void setup()
{
  size(displayWidth,displayHeight);
  orientation(LANDSCAPE);
  
  ///////////////////////////////////////////////////////////////
  
  menuButton[0]=new Button(175,100,150,80, 255,0,0, 0,255,0);
  menuButton[1]=new Button(123,200,250,80, 255,0,0, 0,255,0);
  menuButton[2]=new Button(150,300,200,80, 255,0,0, 0,255,0);
  menuButton[3]=new Button(175,400,150,80, 255,0,0, 0,255,0);
  
  for(int i=0;i<menuEllipse.length;i++)
  {
    menuEllipse[i]=new Circle(random(width), random(height), 3*i+1, int(random(255)),int(random(255)),int(random(255)));
    menuEllipse[i].decreaseSpeed=3;
    menuEllipse[i].displayInMenu=true;
  }
  
  accel=new Button(510,400,120,80, 255,0,0, 255,0,255);
  ok=new Button(660,400,120,100, 255,0,0, 255,0,255);
  for(int i=0;i<swipe.length;i++)
  {
    swipe[i]=new Button(600,100+120*i,70,90, 125,255,0, 125,0,255);
  }
  modeRegulator[0]=new Button(420,320,50,50, 200,150,255, 255,155,200);
  modeRegulator[1]=new Button(720,320,50,50, 200,150,255, 255,155,200);
  modes[0]="Classic";
  modes[1]="Arcade";
  modes[2]="Fast tapping";
  modes[3]="Mode 4";
  modes[4]="Mode 5";
  
  for(int i=0; i<settingsButton.length;i++)
    settingsButton[i]=new Button(420,100*i+100,200,80, 0,255,0, 255,255,0);
  
  exitButton[0]=new Button(420,150,200,100, 255,0,0, 0,255,255);
  exitButton[1]=new Button(670,150,200,100, 255,0,0, 0,255,255);
  
  ////////////////////////////////////////////////////////////////////
  
  for(int i=0;i<wave.length;i++)
  {
    wave[i]=new Circle(0,0,0, 0,0,0);
  }
  gameCircle=new Circle(0,0,0, 255,255,255);
  
  toMenuButton=new Button(0,0,200,100, 0,0,255, 255,255,255);
  
  ////////////////////////////////////////////////////////////////////
  
  setMusic();
    
  ////////////////////////////////////////////////////////////////////
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

void draw()
{
  if(intro)//если вступление не закончилось
    introduction();//вступление
  else//если вступление закончилось
  {
    if(menu)//если меню включено
      menu();//меню (ЖЕЛЕЗНАЯ ЛОГИКА)
    else
      gameProcess();//процесс игры
  }
}