Button toMenuButton;//кнопка выхода в меню

float radius0=200;//изначальный радиус круга
float decreaseSpeedGame=4;//скорость уменьшения круга
float deltaDecrease;
boolean lost=true;//идет ли сама игра (уменьшается кружочек)

Circle gameCircle;//великий круг
Circle[] wave=new Circle[7];

void gameProcess()//процесс игры
{
  background(0);
  
  toMenuButton.display("Menu",false);//кнопка выхода в меню
  if(toMenuButton.pressed())//если нажали на кнопку
  {
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