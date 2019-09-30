Button[] menuButton=new Button[4];//кнопки в меню
Object[] menuEllipse=new Object[50];//кружочки на заднем фоне
int menuWindow=0;//переключатель окон в меню
boolean playMusic=true;

void menu()
{
  background(10);
  
  if(playMusic)
  {
  if(startMusic || !menuMusic.isPlaying())
    menuMusic.start();
  }
  else
  {
    if(menuMusic.isPlaying())
    {
      menuMusic.pause();
      menuMusic.seekTo(0);
    }
  }
  
  for(int i=0;i<menuEllipse.length;i++)
  {
    if(menuEllipse[i].displayInMenu())
    {
    //  menuEllipse[i].display(false);//рисуем круги на заднем фоне
      menuEllipse[i].decreaseMENU(150);//круги уменьшаются и увеличиваются
    }
    if(menuEllipse[i].pressed())//если нажал на круг
      menuEllipse[i].displayInMenu=false;//он и��������чезает (функция недоработана)
  }
  
  fill(255,255,0);
  noStroke();
  rect(100,60,300,450,30);//панель с кнопками
  
  menuButton[0].display("Play",false);
  menuButton[1].display("Settings",false);
  menuButton[2].display("Records",false);
  menuButton[3].display("Exit",false);//изо��ражаем кнопки
  for(int i=0;i<menuButton.length;i++)
  {
    if(menuButton[i].pressed())//если нажал на одну из кнопок
    {
      if(menuWindow==0)//если никакое окно не открыто
        menuWindow=i+1;//выбираем номер окна
      else//если окно открыто
        menuWindow=0;//закрываем все окна
    }
  }
  switch(menuWindow)//выбор окна
  {
    case 1: letsPlay(); break;//игра
    case 2: settings(); break;//настройки
    case 3: records(); break;//рекорды
    case 4: wantExit(); break;//подтверждение выхода
  }
}