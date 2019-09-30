class Tile
{
  int posX=0, posY=0;
  byte type=1;
  Tile(int px, int py, byte t)
  {
    posX=px;
    posY=py;
    type=t;
  }
  void display()
  {
    noStroke();
    switch(type)
    {
    case 1: 
      fill(0, 255, 0); 
      break;
    case 2: 
      fill(255, 0, 0); 
      break;
    case 3: 
      fill(0, 0, 255); 
      break;
    case 4: 
      fill(255, 255, 0); 
      break;
    case 5: 
      fill(255, 0, 255); 
      break;
    case 6: 
      fill(255, 100, 0); 
      break;
    }
    rect(posX*80, posY*80, 80, 80);
  }
  void special()
  {
    if (player.posX==posX && player.posY==posY )
    {
      if (type==2 || type==4 || type==3 && player.taste==2
       || type==3 && watEl(posX,posY))
      {
        player.posX=player.posX0;
        player.posY=player.posY0;
      }
      if (type==6)
      {
        player.taste=2;
      }
      if (type==5)
      {
        player.taste=1;
        player.posX+=(player.posX-player.posX0);
        player.posY+=(player.posY-player.posY0);
        player.posX0=posX;
        player.posY0=posY;
      }
    }
  }
}
