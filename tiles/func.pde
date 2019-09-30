boolean watEl(int x,int y)
{
  boolean res=false;
  for(int i=1;i<tiles.length-1;i++)
  {
    if(tiles[i].posX==x && tiles[i].posY==y+1 
    || tiles[i].posX==x && tiles[i].posY==y-1
    || tiles[i].posY==y && tiles[i].posX==x+1
    || tiles[i].posY==y && tiles[i].posX==x-1)
    {
      if(tiles[i].type==4)
      res=true;
    }
  }
  return res;
}
/////////////////////////////////////////////////////////////////////////
void newLab()
{
  for(short i=0;i<tiles.length;i++)
  tiles[i]=new Tile(0,0,byte(0));
  for(int x=0;x<16;x++)
  {
    for(int y=0;y<9;y++)
    {
      if(x*9+y-1<144)
      tiles[x*9+y]=new Tile(x,y,byte(random(1,7)));
    }
  }
}
//////////////////////////////////////////////////////////////////////////
boolean check()
{
  return true;
}

/////////////////////////////////////////////////////////////////////////
void goTo(byte s)
{
  switch(s)
  {
    case 1: player.posX++;
     //posX0=posX;
    // posY0=posY;break;
    case 2: player.posX--;break;
    case 3: player.posY--;break;
    case 4: player.posY++;break;
  }
  
}
/////////////////////////////////////////////////////////////////////////
void win()
{
  if(player.posX==15 && player.posY==8)
  {
    player.posX=0;
    player.posY=0;
    newLab();
  }
}