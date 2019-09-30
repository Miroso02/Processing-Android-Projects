import android.media.*;
import java.io.IOException;
import android.content.res.AssetManager;
import android.content.res.AssetFileDescriptor;
import android.content.Context;
MediaPlayer snd, snd1;
AssetFileDescriptor fd, fd1;
AssetManager assets;
boolean doing=true, ss=true, ea=false,mp=true;
boolean drink=false, eat=false, eat1=true,disp=true;
String s="", rm="start";
int time=0,t=0;
String _text;
Button b1, b2, b3, b4, b5, b6;
Button[] but=new Button[10];
void setup()
{
  size(1250,700);
  b1=new Button(color(255,230,150));
  b2=new Button(color(255,230,150));
  b3=new Button(color(255,230,150));
  b4=new Button(color(255,230,150));
  b5=new Button(color(255,230,150));
  b6=new Button(color(255,230,150));
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
    catch(IOException e){}
    snd.start();
    orientation(LANDSCAPE);
}
void draw()
{
  if(mp){snd.start();mp=false;}
  background(0,30,0);
  textAlign(LEFT);
  textSize(30);
  fill(255,230,200);
 // system();
  if(rm=="start")Start();       //начало
  else if(rm=="life")Life();    //нажали жизнь
  else if(rm=="exit")Exit();    //нажали выход
  else if(rm=="drink")Drink();  //выпили воды - сон
  else if(rm=="lifex")Lifex();  //стены здвигаются
  else if(rm=="tonel")Tonel();  //стены остановились
 // else if(rm=="toonel")Toonel();//вошли в тунель - закрылась дверь
  else if(rm=="white")White();  //пошли на свет
  else if(rm=="black")Black();  //пошли в тьму
  else if(rm=="fall")Fall();    //упали из тонеля
  else if(rm=="luk")Luk();      //пойти к вентилятору
    
  else if(rm=="fast")Fast();    //разрезать синий про������������������������������������������������������������од
  else if(rm=="stop")Stop();
  else if(rm=="telephone")Tel();//пойти к телефону
  strokeWeight(10);
  stroke(0,0,100);
  fill(0,0);
  rect(0,0,750,400,15);
  rect(0,400,1250,300,15);
  rect(750,0,500,400,15);
  textSize(60);
  textAlign(CENTER);
  text(time,20,20);
  println(disp);
}
void onBackPressed()
{
  doing=true; ss=true; ea=false; mp=true;
  drink=false; eat=false; eat1=true;
  rm="start";
  time=0;
}