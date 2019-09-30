boolean doing=true;//ЛЕГЕНДАРНЫЙ!!! думаю, уже все его знают
boolean doing2=true;//??????
class Button
{
  float x=100;
  float y=100;//положение
  
  int w=100;
  int h=100;//размеры
  
  private boolean press;//проверяет, держите ли вы кнопку нажатой
  
  color col1;//основной цвет
  color col2;//цвет при нажатии на кнопку
  
  Button(float xx,float yy,int ww,int hh,int r, int g, int b,int r2, int g2, int b2)
  {
    x=xx;
    y=yy;
    w=ww;
    h=hh;
    col1=color(r,g,b);
    col2=color(r2,g2,b2);
  }
  //////////////////////////////////////////////////////////////////
  void display(String text, boolean swipe)//изображаем кнопку с текстом
  {
    color col=col1;//цвет кнопки (изначально основной)
    if(press)//если кнопка нажата
      col=col2;//цвет - дополнительный
    else//если не нажата
      col=col1;//цвет - основной
    
    if(!swipe)
    {
      fill(0,0);
      strokeWeight(5);
      stroke(col);
      rect(x,y,w,h,20);//рисуем кнопку
    
      fill(col);
      textSize(60);
      textAlign(CENTER);
      text(text,x,y+h/4-5,w,h);//текст на кнопке
    }
    else
    {
      fill(col);
      strokeWeight(1);
      stroke(0);
      rect(x,y,w,h,20);
      
      fill(0);
      textSize(30);
      textAlign(CENTER);
      text(text,x,y+h/4,w,h);//текст на кнопке
    }
  }
  ////////////////////////////////////////////////////////////////
  boolean pressed()
  {
    //начните с первой части
    boolean res=false;
    ///////////////////ВТОРАЯ ЧАСТЬ/////////
    if(!mousePressed)
    {
      if(press)//если мышку отпустили, когда она была на кнопке
        res=true;
        
      doing=true;
      press=false;//кнопка не нажата
    }
    ///////////////////ПЕ��������������������������������������������ВАЯ ЧАСТЬ/////////
    if(mousePressed)
    {
      if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h)//если м������������������шка нажата на кнопке
      {
        if(doing)
          press=true;//запоминаем, что мы нажали на кнопку
      }
      else if(press)//если мышка была нажата на кнопке, а теперь нажата не на кнопке (держа палец на экране уводим его с кнопки)
      {
        press=false;//кнопка не нажата
        doing=false;
      }
      //а теперь вторая часть
    }
    return res;
  }
  /////////////////////////////////////////////////////////////////////////////////////////////////
  void swiper(float minX, float maxX)
  {
    if(mousePressed)
    {
      if(mouseX-w/2>minX && mouseX-w/2<maxX && mouseY>y-10 && mouseY<y+h+10)
      {
        x=mouseX-w/2;
        press=true;
      }
    }
  }
}