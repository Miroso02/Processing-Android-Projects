String textFile="example.txt";//я бы сказал, что это - основная переменная в игре
//название файла, из которого мы загружаем
int nText=3;
float deltay=0;
void system()
{
  if(mousePressed && mouseX>0 && mouseX<750 && mouseY>0 && mouseY<280)
    deltay+=pmouseY-mouseY;
  if(deltay<5)deltay=5;
  String[] info,lines,texts;
  String[][] butTexts;
  String tex="",dispText;
  int n;
  lines=loadStrings(textFile);
  if (lines!=null)
  {
    float butY=300,butX;//положение кнопок
    
    for (byte i=0; i<lines.length; i++)
      tex+=lines[i];
    info=split(tex, '*');
    
    dispText="";
    texts=split(info[0],'|');
    dispText+=texts[0];
    try
    {
      if(but[int(texts[1])-1].pressed())
      nText++;
      if(int(texts[2])==1)
      {
        for(int i=3;i<nText;i++)
        {
          if(texts[i]!=null)
          dispText+=texts[i];
        }
      }
      else if(int(texts[2])==0)
      {
        for(int i=3;i<nText;i++)
        {
          if(texts[i]!="")
          dispText=texts[i];
        }
      }
    }
    catch(java.lang.ArrayIndexOutOfBoundsException e){}
    
    n=int(info[2]);//количество кнопок
    
    /*for(int i=0;i<n;i++)
    {
      String[] a=split(info[n+2],'|');
      for(int ai=0;ai<a.length;ai++)
      butTexts[i][ai]=a[ai];
    }*/
    
   /* for(int i=0;i<n;i++)
    {
      butTexts[i]=split(info[n+2],'|');
    }
    println(butTexts);*/
    
    textAlign(LEFT);
    textSize(30);
    fill(255, 230, 200);
    text(dispText, 20, 30-deltay, 730, 280);//текст в комнате
    
    if (!fullImage && !changing)//когда картинка не на полный экран или не меняет размер
    {
      for (int i=0; i<n; i++)//для всех кнопок
      {
        //info[i+3] - текст на кнопке but[i]
        if (i==0)//для первой кнопки
        butX=20;
        else//для остальных кнопок
        {
          if (but[i-1].x+but[i-1].w+50+   int(textWidth(info[i+3]))+10   >width)//если кнопка вылазит за экран
          {
            butY+=80;//переносим на новую строку
            butX=20;
          } 
          else//если не вылазит
            butX=but[i-1].x+but[i-1].w+50;//конец предыдущей кнопки +50
        }
        //             x   , y   , w                           , h , text     , toFile
        but[i].display(butX, butY, int(textWidth(info[i+3]))+10, 50, info[i+3], info[n+i+3]);
        println(but[i].toFile);
        but[i].pressed();
      }
    }
    
    println("textFile is "+textFile);
    println("image is "+info[1]);
    
    PImage im=loadImage(info[1]);
    if (im!=null)
    {
      if(img.w==0)
      img=new Button(750, 0, 500, 280);
      image(im, img.x, img.y, img.w, img.h);
    }
    else
    {
      img=new Button(0,0,0,0);
    }
    
  }
}
