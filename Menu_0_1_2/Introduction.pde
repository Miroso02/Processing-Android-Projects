boolean intro=true;//если true, идет вступление; по окончанию становится false
int timeIntro=0;//время для каждого слайда вступления
int textIntroOpp=255;//прозрачность текста во вступлении
void introduction()//вступление
{
  String text="";//надписи на экране
  background(0);
  fill(255,textIntroOpp);//устанавливаем прозрачность
  textSize(120);
  ////////////первый слайд/////////
  if(timeIntro<300)
  {
    text="Company 'Four idiots'";
    text+="\n";
    text+="           presents";
  }
  ////////////второй слайд/////////
  else if(timeIntro>=300 && timeIntro<600)
  {
    if(timeIntro<345)
      textIntroOpp=255;
      
    text="    Created by HANDS";
    
    if(timeIntro>340)//позже добавляется еще текст
    {
      text+="\n";
      text+="And processing a little...";
    }
  }
  ////////////третий с��������������������������������������������������������������������������������������������������������������������������айд////////
  else if(timeIntro>=600 && timeIntro<900)
  {
    if(timeIntro<620)
      textIntroOpp=255;
    text="       Tap The Circle";
  }
  ////////////конец вступления///
  else if(timeIntro==900)
  {
    menu=true;
    intro=false;
  }
  
  if(mousePressed)
  intro=false;
  
  text(text,20,height/2);//выводим текст
  timeIntro++;//время увеличивается
  textIntroOpp--;//прозрачность уменьшается
}