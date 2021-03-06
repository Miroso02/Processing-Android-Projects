Button toMenuButton;//кнопка выхода в меню

boolean withAcceleration=false;
float radius0=200;//изначальный радиус круга
float decreaseSpeedGame=4;//скорость уменьшения круга
float deltaDecrease=1.001;//ускорение скорости
boolean lost=true;//идет ли сама игра (уменьшается кружочек)

Circle gameCircle;//великий круг
Circle[] wave=new Circle[7];//воооооолночки!!!:)

void gameProcess()//процесс игры
{
  background(0);
  
  if(playMusic)
  if(startMusic || !gameMusic.isPlaying())
    gameMusic.start();
  
  toMenuButton.display("Menu",false);//кнопка выхода в меню
  if(toMenuButton.pressed())//если нажали на кнопку
  {
    startMusic=true;
    gameMusic.pause();
    gameMusic.seekTo(0);
    
    menuWindow=0;//выключаем все окна в меню
    menu=true;//включаем меню
  }
  
  for(int i=0;i<wave.length;i++)
  {
    wave[i].display(true);
  }
  
  gameCircle.display(false);//рисуем круг
  gameCircle.decreaseGAME();//уменьшение и телепортация круга
 }