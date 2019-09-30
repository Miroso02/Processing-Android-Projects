class Circle
{
  float x,y;//положение
  float diametr;//размер
  
  int decreaseSpeed;//скорость уменьшения (для кругов в меню)
  
  color col;//цвет
  int oppacity=255;//прозрачность
  
  boolean displayInMenu;//изображать ли в меню (недоработано)
  
  Circle(float xx, float yy, float rad, int r, int g, int b)
  {
    x=xx;
    y=yy;
    diametr=rad;
    col=color(r,g,b);//цвет определяем тремя переменными: r,g,b
  } 
  ////////////////////////////////////////////////////////////////////
  void display(boolean wave)//изображение (пока только для кругов)
  {
    if(!wave)
    {
      strokeWeight(1);
      fill(col);
      stroke(0);
    }
    else
    {
      fill(0,0);
      strokeWeight(5);
      stroke(col,oppacity);
      if(oppacity>0)
      {
        diametr+=10;
        oppacity-=5;
      }
    }
    
    ellipse(x,y,diametr,diametr);
  }
  ////////////////////////////////////////////////////////////////////
  boolean pressed()//нажатие на круг
  {
    boolean res=false;
    if(mousePressed)//если мышка нажата
    {
      //если расстояние от точки нажа����������������ия до центра круга < радиус и doing2 ???!!!
      if(sqrt(sq(mouseX-x)+sq(mouseY-y))<diametr/2 && doing2)
      {
        res=true;//возвращаем правду
        doing2=false;//больше не можем нажать пока не отожмешь мышку
      }
    }
    else
    doing2=true;//если отжали мышку
    
    return res;
  }
  ////////////////////////////////////////////////////////////////////
  void decreaseMENU(int maxSize)//действия кругов в меню; передаем макс. размер
  {
    if(diametr>maxSize)//если размер круга больше чем макс. размер круга
      decreaseSpeed=-decreaseSpeed;// круг уменьшается
      
    if(diametr<0)//если диаметр круга < 0
    {
      x=random(width);
      y=random(height);//круг появляется в рандомном месте
      col=color(0,0,0);
      while(red(col)+green(col)+blue(col)<200)//пока цвет темный
      {
        col=color(random(255),random(255),random(255));//выбираем новый цвет
      }
      decreaseSpeed=-decreaseSpeed;//круг начинает увеличиваться
    }
      
    diametr+=decreaseSpeed;//изменяем размер круга
    
    display(false);
  }
  ///////////////////////////////////////////////////////////////////
  void decreaseGAME()//действия круга в игре
  {
    if(diametr<=0)//если размер круга <= 0
    {
      x=width/2;
      y=height/2;//круп появляется в центре
      diametr=radius0;//с начальным радиусом
      lost=true;//вы проиграли
    }
    
    if(pressed())//если круг нажат
    {
      createWave();
      if(withAcceleration)
      decreaseSpeedGame*=deltaDecrease;
      println(deltaDecrease +" "+decreaseSpeedGame);
      diametr=radius0;//размер становится изначальным
      x=random(radius0/2,width-radius0/2);
      y=random(radius0/2,height-radius0/2);//случайное положение
      col=color(0,0,0);
      while(red(col)+green(col)+blue(col)<50)//пока цвет темный
      {
        col=color(random(255),random(255),random(255));//выбираем новый цвет
      }
      if(lost)//для круга в центре (начального)
        lost=false;//начинаем игру!
    }
    
    if(!lost)//если не проиграли (игра идет)
      diametr-=decreaseSpeedGame;//уменьшать круг
      
      display(false);
  }
  
  /////////////////////////////////////////////////////////////////////////////
  
  void createWave()
  {
    for(int i=0;i<wave.length;i++)
    {
      if(wave[i].oppacity<=0)
      {
        wave[i]=new Circle(x,y,diametr,int(red(col)),int(green(col)),int(blue(col)));
        wave[i].oppacity=255;
        break;
      }
    }
  }
  
  //////////////////////////////////////////////////////////////////////////////
  
  void cube()
  {
    
  }
  
}