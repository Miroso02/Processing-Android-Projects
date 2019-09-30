Button ok;
Button[] swipe=new Button[2];
String[] modes=new String[5];
Button[] modeRegulator=new Button[2];
int modeIndex=1;
void letsPlay()//окно начала игры
{
  fill(255,255,0);
  strokeWeight(1);
  stroke(0);
  rect(400,60,400,500,30);//само окно
  
  fill(255,0,0);
  rect(440,swipe[0].y+swipe[0].h/2-10,320,20);
  rect(440,swipe[1].y+swipe[1].h/2-10,320,20);
  for(int i=0;i<swipe.length;i++)
  {
    swipe[i].display("",true);
    swipe[i].pressed();
    swipe[i].swiper(420,720);
  }
  radius0=int((swipe[0].x+swipe[0].w/2-350)/50)*50;
  textAlign(LEFT);
  textSize(30);
  fill(0);
  text("Circle Size"+"  -  "+int(radius0),430,120);
  text("Decrease speed",430,240);
  
  modeRegulator[0].display("-",true);
  modeRegulator[1].display("+",true);
  if(modeRegulator[0].pressed() && modeIndex>1)
    modeIndex--;
  if(modeRegulator[1].pressed() && modeIndex<5)
    modeIndex++;
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text(modes[modeIndex-1],590,355);
  textSize(40);
  textAlign(LEFT);
  text("Mode",425,315);
  
  
  ok.display("OK",false);//кнопка "начать игру"
  if(ok.pressed())//если нажимаем "ОК"
  {
    menu=false;//начинается процесс игры
    decreaseSpeedGame=4;//устанавливаем скорость уменьшения круга
  //  radius0=250;//устанавливаем начальный размер круга
  }
}

/////////////////////////////////////////////////////////////////

Button[] settingsButton=new Button[5];//кнопки в настройках
void settings()//настройки (здесь пока пусто)
{
  fill(255,255,0);
  strokeWeight(1);
  stroke(0);
  rect(400,60,700,500,30);//само окно настроек
}

/////////////////////////////////////////////////////////////////

void records()//рекорды (здесь тоже пусто)
{
  fill(0,0,255);
  strokeWeight(1);
  stroke(0);
  rect(600,200,200,200);//синий квадрат посреди экрана
}

/////////////////////////////////////////////////////////////////

Button[] exitButton=new Button[2];
void wantExit()//подтверждение ��ыхода
{
  fill(255,255,0);
  strokeWeight(1);
  stroke(0);
  rect(400,60,500,200,30);//само окно
  
  fill(0);
  textSize(60);
  textAlign(CENTER);
  text("Are you sure?",410,70,480,100);
  
  exitButton[0].display("Yes",false);
  exitButton[1].display("No",false);
  
  if(exitButton[0].pressed())//если нажали "да"
  exit();//выход из игры
  if(exitButton[1].pressed())//если нажали "нет"
  menuWindow=0;//выход из окна
}