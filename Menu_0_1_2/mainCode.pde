import android.media.*;
import android.content.res.AssetManager;
import android.content.res.AssetFileDescriptor;
MediaPlayer menuMusic=new MediaPlayer();
boolean menu=true;
void setup()
{
  size(displayWidth,displayHeight);
  
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
  
  ok=new Button(660,400,120,100, 255,0,0, 255,0,255);
  for(int i=0;i<swipe.length;i++)
  {
    swipe[i]=new Button(600,100+120*i,70,90, 125,255,0, 125,0,255);
  }
  modeRegulator[0]=new Button(420,320,50,50, 200,150,255, 255,155,200);
  modeRegulator[1]=new Button(720,320,50,50, 200,150,255, 255,155,200);
  modes[0]="Classic";
  modes[1]="Arcade";
  modes[2]="Fast typing";
  modes[3]="Mode 4";
  modes[4]="Mode 5";
  
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
  
  orientation(LANDSCAPE);
  
  try
  {
    AssetFileDescriptor file1=getAssets().openFd("Unknown_This_Game_full_ver_No_Game_No_Life_OP_piano_(vmuzice.com).mp3");
    menuMusic.setDataSource(file1.getFileDescriptor(), file1.getStartOffset(), file1.getLength());
    menuMusic.prepare();
    menuMusic.start();
    print(1);
  }
  catch(IOException p){}
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

void draw()
{
  if(intro)//ес��и вступление не закончилось
    introduction();//вступление
  else//если вступление закончилось
  {
    if(menu)//если меню включено
      menu();//меню (ЖЕЛЕЗНАЯ ЛОГИКА)
    else
      gameProcess();//процес���������������������������������������������� игры
  }
}