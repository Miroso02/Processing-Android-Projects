Button ok;
Button[] swipe=new Button[2];
String[] modes=new String[5];
Button[] modeRegulator=new Button[2];
int modeIndex=1;
Button accel;
void letsPlay()//окно начала игры
{
  fill(255, 255, 0);
  strokeWeight(1);
  stroke(0);
  rect(400, 60, 850, 640, 30);//само окно

  switch(modeIndex)
  {
    case 1: setClassic(); break;
    case 2: setArcade(); break;
    case 3: setFastTapping(); break;
  }
  modeRegulator[0].display("-", true);
  modeRegulator[1].display("+", true);
  if (modeRegulator[0].pressed() && modeIndex>1)
    modeIndex--;
  if (modeRegulator[1].pressed() && modeIndex<5)
    modeIndex++;
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text(modes[modeIndex-1], 590, 355);
  textSize(40);
  textAlign(LEFT);
  text("Mode", 425, 315);


  ok.display("OK", false);//кнопка "начать игру"
  if (ok.pressed())//если нажимаем "ОК"
  {
    startMusic=true;
    menuMusic.pause();
    menuMusic.seekTo(0);

    menu=false;//начинается процесс игры
    if (withAcceleration)
      decreaseSpeedGame=4;//устанавливаем скорость уменьшения круга
  }
}

/////////////////////////////////////////////////////////////////

Button[] settingsButton=new Button[5];//кнопки в настройках
void settings()//настройки (здесь пока пусто)
{
  fill(255, 255, 0);
  strokeWeight(1);
  stroke(0);
  rect(400, 60, 700, 500, 30);//само окно настроек
  
  settingsButton[0].display("Music",true);
  settingsButton[1].display("Language",true);
  
  if(settingsButton[0].pressed())
  {
    if(playMusic)
    {
      playMusic=false;
      settingsButton[0].col1=color(255,0,0);
      settingsButton[0].col2=color(0,255,0);
    }
    else
    {
      playMusic=true;
      settingsButton[0].col1=color(0,255,0);
      settingsButton[0].col2=color(255,0,0);
    }
  }
}

/////////////////////////////////////////////////////////////////

void records()//рекорды (здесь тоже п����������������������������������������������������сто)
{
  fill(0, 0, 255);
  strokeWeight(1);
  stroke(0);
  rect(600, 200, 200, 200);//синий квадрат посреди экрана
}

/////////////////////////////////////////////////////////////////

Button[] exitButton=new Button[2];
void wantExit()//подтверждение выхода
{
  fill(255, 255, 0);
  strokeWeight(1);
  stroke(0);
  rect(400, 60, 500, 200, 30);//само окно

  fill(0);
  textSize(60);
  textAlign(CENTER);
  text("Are you sure?", 410, 70, 480, 100);

  exitButton[0].display("Yes", false);
  exitButton[1].display("No", false);

  if (exitButton[0].pressed())//если нажали "да"
    exit();//выход из игры
  if (exitButton[1].pressed())//если нажали "нет"
    menuWindow=0;//выход из окна
}
