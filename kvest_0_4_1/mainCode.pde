import android.media.*;
import java.io.IOException;
import android.content.res.AssetManager;
import android.content.res.AssetFileDescriptor;
import android.content.Context;

MediaPlayer snd, snd1;
AssetFileDescriptor fd, fd1;
AssetManager assets;

boolean doing=true;//чтобы вы не могли возить пальцем по экрану, нажимая все подряд
boolean mp=true;//для музыки?
boolean fullImage=false;//[true]-картинка на полный экран;[false]-картинка маленькая
boolean changing=false;//[true]-картинка меняет размер;[false]-не меняет
boolean menu=false;//думаю, понятно
//int time=0;

Button[] but=new Button[10];//кнопки в игровом процессе
Button img=new Button(750, 0, 500, 280);//кнопка для увеличения/уменьшения картинки
//PrintWriter output;
void setup()
{
  size(1250, 700);
  try
  {
    snd = new MediaPlayer();
    AssetManager assets = getAssets();
    AssetFileDescriptor fd = assets.openFd("ph.mp3");
    snd.setDataSource(fd.getFileDescriptor(), fd.getStartOffset(), fd.getLength());
    snd.setAudioStreamType(3);
    snd.prepare();
    snd.setLooping(true);
  }
  catch(IOException e) {
  }
  snd.start();

  orientation(LANDSCAPE);

  for (int i=0; i<but.length; i++)
    but[i]=new Button(0, 0, 0, 0);//кнопки в игре
  for (int i=0; i<menuBut.length; i++)
    menuBut[i]=new Button(0, 0, 0, 0);//кнопки в меню
  img.toFile=null;//нажатие на картинку не ведет ни в какой текстовый файл
}
void draw()
{
  float speed=0.1;//скорость уменьшения/увеличения картинки

  if (menu)
    menu();

  else//в самой игре
  {
    if (mp) {
      snd.start();
      mp=false;
    }

    background(0, 30, 0);
    strokeWeight(10);
    stroke(0, 0, 100);
    fill(0, 0);
    rect(0, 0, 750, 280, 15);
    rect(0, 280, 1250, 420, 15);
    rect(750, 0, 500, 280, 15);

    system();

    menuBut[2].display(1150, 650, 100, 50, "Menu","");//выход в меню
   
    if (menuBut[2].pressed())
    {
      menu=true;
      chooseGame=false;//см.Меню
      loading=false;//см.Меню
      String[] a=new String[1];
      a[0]=textFile;
      saveStrings("saves.txt", a);
    }

    if (img.pressed())
      changing=true;

    if (changing)
    {
      if (fullImage)//если на весь экран
      {
        if (img.x<750)//уменьшаем картинку
        {
          img.x+=speed*width;
          img.w-=speed*width;
          img.h-=speed*height;
        } 
        else//когда уменьшили
        {
          fullImage=false;
          changing=false;
        }
      } 

      else//когда маленькая картинка
      {
        if (img.x>0)//увеличиваем картинку
        {
          img.x-=speed*width;
          img.w+=speed*width;
          img.h+=speed*height;
        } 
        else//когда увеличили
        {
          fullImage=true;
          changing=false;
        }
      }
    }
  }
}

void onBackPressed()
{
  menu=true;
  chooseGame=false;
  fullImage=false;
  loading=false;
}
