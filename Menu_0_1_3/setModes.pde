void setClassic()//классический режим
{
    fill(255, 0, 0);
    rect(440, swipe[0].y+swipe[0].h/2-10, 320, 20);//макет первого ползунка
    rect(440, swipe[1].y+swipe[1].h/2-10, 320, 20);//макет второго ползунка
    for (int i=0; i<swipe.length; i++)
    {
      swipe[i].display("", true);//изображаем непрозрачный ползунок
      swipe[i].pressed();
      swipe[i].swiper(420, 720);//движение ползунка
    }
    
    accel.display("Acc", true);//кнопка ускорения
    if (accel.pressed())//если "ускорение" нажато
    {
      if (withAcceleration)//если ускорение было включено
      {
        withAcceleration=false;//выключить ускорение
        accel.col1=color(255, 0, 0);//поменять цвет кнопки
      } 
      else//если было выключено
      {
        withAcceleration=true;//включить ускоре������ие
        accel.col1=color(0, 255, 0);
      }
    }

    textAlign(LEFT);
    textSize(30);
    fill(0);
    text("Circle Size"+"  -  "+int(radius0), 430, 120);//выводим диаметр круга
    radius0=int((swipe[0].x+swipe[0].w/2-350)/50)*50;//определяем диаметр круга
    if (!withAcceleration)//если ускорение выключено
    {
      decreaseSpeedGame=(swipe[1].x+swipe[1].w/2-200)/100;//определяем постоянную скорость уменьшения круга
      text("Decrease speed"+"  -  "+decreaseSpeedGame, 430, 240);//выводим постоянную скорость уменьшения круга
    } 
    else//если ускорение включено
    {
      deltaDecrease=1+(swipe[1].x+swipe[1].w/2-200)/100000;//определяем ускорение
      text("× Acceleration"+"  -  "+deltaDecrease, 430, 240);//выводим ускорение
    }
}

///////////////////////////////////////////////////////////////////

void setArcade()
{
  
}

///////////////////////////////////////////////////////////////////

void setFastTapping()
{
  
}