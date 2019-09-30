void setup() {
  size(displayWidth, displayHeight);
  noSmooth();
  rectMode(CENTER);

  //*******************ИНСТРУКЦИЯ*****************************
  //sn=new Cannon(1: количество пуль, за которые отвечает эта пушка (не знаешь – ставь 500),
  //                2-3: координаты пушки (x,y),
  //                4: задержка между выстрелами,
  //                5: количество пуль, которые выпускаются за один выстрел,
  //                6: HP пушки,
  //                7: случайное перемещение: после скольких выстрелов перемещение; 0,если нет; 
  //                8: функция движения каждой пули(номер текущей пули, координаты точки из пунктов 2-3):
  //  1) float x,y,bulletspeedX,bulletSpeedY – переменные, которые ты ����������������������������������олжен определить в этом методе
  //  2) x=... ; y=... ; – координаты точки запуска пули 
  //  P.S. Используй xL, yL и numberOfCurrentBullet
  //  3) bulletSpeedX=... ; bulletSpeedY=... ; – скорость по x/y пули(скорость не меняется!!)
  //  P.S. Используй numberOfCurrentBullet; xL, yL и какую-то другую хрень – не рекомендуется, АРТЁМ
  //  4) float[] res={...}; ты должен вернуть минимум 5 значений:
  //  1-4: x,y,bulletSpeedX, bulletSpeedY – см. выше
  //  5: Множитель скорости пули (не знаешь – ставь 4)
  //  Необязательные аргументы:
  //  6: Количество рикошетов пули
  //  7: Диаметр (размер) стрелы (не знаешь - ставь 10)
  //  8: Ус��ор��ни�� ↓ пули
  //************************************************************
  //
  s[0]=new Cannon(1000, width/2, height/2-200, 80, 100, 0, 100,true, new Moving() {
    public float[] fire(int numberOfCurrentBullet, float xL, float yL, float...other)
    {
      float x=2000, y=0, bulletSpeedX=0, bulletSpeedY=0;
      
      x=xL;
      y=yL;
      bulletSpeedX=0.01*(numberOfCurrentBullet%100+15)*cos(1.06*numberOfCurrentBullet);
      bulletSpeedY=0.01*(numberOfCurrentBullet%100+15)*sin(1.06*numberOfCurrentBullet);
      
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 14,1
      };
      return res;
    }
  }
  );
  s[1]=new Cannon(1000, width/2, height/2-200, 80, 100, 0, 100,true, new Moving() {
    public float[] fire(int numberOfCurrentBullet, float xL, float yL, float...other)
    {
      float x=2000, y=0, bulletSpeedX=0, bulletSpeedY=0;
      x=xL;
      y=yL;
      bulletSpeedX=0.01*(numberOfCurrentBullet%100+15)*cos(1.06*numberOfCurrentBullet);
      bulletSpeedY=-0.01*(numberOfCurrentBullet%100+15)*sin(1.06*numberOfCurrentBullet);
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 14, 1
      };
      return res;
    }
  }
  );
  s[2]=new Cannon(600, width/2, 100, 3, 4, 0, 500,true, new Moving() {
    public float[] fire(int numberOfCurrentBullet, float xL, float yL, float...other)
    {
      float x=2000, y = 2000, bulletSpeedX, bulletSpeedY;
      float m=-120+80*(numberOfCurrentBullet%4);
      x = xL - m;
      y = yL;
      /*float tx=player.x - x, ty=player.y - y;
      float sqt = sqrt(sq(tx) + sq(ty)) / 1.2;
      bulletSpeedX = tx / sqt;
      bulletSpeedY = ty / sqt;*/
      float k = 1 + 0.3*sin(PI*(float)numberOfCurrentBullet/200);
      float k2 = 25*sin(HALF_PI*(float)numberOfCurrentBullet/2);
      bulletSpeedY = k * abs(0.8*cos(PI*numberOfCurrentBullet/(100)))+0.2;
      bulletSpeedX = k * sin(PI*numberOfCurrentBullet/(100));
      float[] res= {
        x, y, bulletSpeedX, bulletSpeedY, 5, 1, 15
      };
      return res;
    }
  }
  );
  
  
  time=0;
  death=false;
  restartButton=new Button(width/2-150, height/2+50, 400, 100);
  player.x=width/2;
  player.y=height-300;
  //  smooth();
}