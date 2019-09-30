class Player
{
  int posX, posY;
  int posX0, posY0;
  byte taste;
  Player(int px, int py, byte t)
  {
    posX=px;
    posY=py;
    taste=t;
  }
  void display()
  {
    noStroke();
    fill(0);
    ellipse(posX*80+40, posY*80+40, 40, 40);
    // triangle(posX*80+30,posY*80+10,posX*80+50,posY*80+10,posX*80+40,posY*80+70);
  }
  void move()
  {
      if (br.pressed())
      {
        posY0=posY;
        posX0=posX;
        posX++;
      }
      if (bl.pressed())
      {
        posY0=posY;
        posX0=posX;
        posX--;
      }
    
      if (bu.pressed())
      {
        posX0=posX;
        posY0=posY;
        posY--;
      }
      if (bd.pressed())
      {
        posX0=posX;
        posY0=posY;
        posY++;
      }
      if(posX<0 || posX>15 || posY<0 || posY>8)
      {
        posX=posX0;
        posY=posY0;
      }
  }
}
