Button[] menuBut=new Button[5];//кнопки в меню
boolean chooseGame=false;//после нажатия на Play выбираем, в какую ветку играть
boolean loading=false;//после нижатия на Saves вылазит окно с якобы сохранениями
void menu()
{
  background(0,30,30);
  
  if(!chooseGame && !loading)//стандартное меню
  {
    menuBut[0].display(500,100,250,70,"Play","");
    menuBut[1].display(500,200,250,70,"Saves","");
    menuBut[2].display(500,300,250,70,"Achivement","");
    menuBut[3].display(500,400,250,70,"Seetings","");
    menuBut[4].display(500,500,250,70,"Exit","");
    
    if(menuBut[0].pressed())//нажали Play
    chooseGame=true;
    if(menuBut[1].pressed())//нажали Saves
    loading=true;
    if(menuBut[4].pressed())//нажали Exit
    exit();
  }
  
  /////////////////////////////////////////////////////////////////
 
  if(chooseGame)//выбор ветки
  {
    menuBut[1].display(0,0,200,100,"The begining","");
    menuBut[0].display(200,0,200,100,"Volcano","");
    menuBut[2].display(0,650,100,50,"Back","");
    menuBut[3].display(400,0,200,100,"Ice desert","");
   
    if(menuBut[1].pressed())//идем в начало
    {
      menu=false;
      textFile="room1.txt";
    }
    if(menuBut[0].pressed())//идем к вулкану
    {
      menu=false;
      textFile="MineV1.txt";
    }
    if(menuBut[3].pressed())
    {
      menu=false;
      textFile="MineC1.txt";
    }
    if(menuBut[2].pressed())//назад в основное меню
    chooseGame=false;
  }
  
  /////////////////////////////////////////////////////////////////
  
  if(loading)//сохранения
  {
    menuBut[0].display(0,0,100,50,"Back","");
    menuBut[1].display(200,50,300,300,"","");
    menuBut[2].display(600,50,300,300,"","");
    menuBut[3].display(200,400,300,300,"","");
    menuBut[4].display(600,400,300,300,"","");
    if(menuBut[0].pressed())//назад в основное меню
      loading=false;
    for(int i=1;i<4;i++)
    {
      if(menuBut[i].pressed())
      {
        try
        {
          String[] b=loadStrings("saves.txt");
          if(b[0]!="")
          {
            menu=false;
            textFile=b[0];
          }
        }
        catch(java.lang.ArrayIndexOutOfBoundsException e)
        {e.printStackTrace();}
      }
    }
  }
}