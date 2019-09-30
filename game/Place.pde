int place(boolean[] house)
{
  int y=0,minX=10000;
  for(byte i=0;i<6;i++)
  {
    if(houses[i].team!=0)
    house[i]=false;
  }
  for(byte i=0;i<6;i++)
  {
    if(house[i]==true)
    {
      if(houses[i].x<minX)
      {
        boolean un=true;
        for(short i0=0;i0<800;i0++)
        {
          if(units[i0].x==9*s && units[i0].y==houses[i].y)
          {
            un=false;
          }
        }
        if(un==false)
        {
          house[i]=false;
          place(house);
        }
        else
        {
          minX=houses[i].x;
          y=houses[i].y;
        }
      }
    }
  }
  if(y==0)
  {
    boolean noY=true;
    for(byte i=0;i<8;i++)
    {
      for(short i0=0;i0<800;i0++)
      {
        if(units[i0].x==9*s && units[i0].y==i*s)
        noY=false;
        if(noY)
        y=s*i;
      }
    }
  }
  return(y);
}