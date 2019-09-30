short[] target()
{
  short[] res=new short[2];
  int[] dist=new int[2];
  /*
  res[0] 
  1-units
  2-houses
  
  res[1]
  number in massive
  */
 /* for(short i=0;i<800;i++)
  {
    if(units[i].team==1 && units[i].x==9*s)
    {
      res[0]=1;
      res[1]=i;
    }
  }*/
  for(byte i=0;i<8;i++)
  {
    if(houses[i].team==0)
    {
      res[0]=2;
      res[1]=i;
      dist[0]=houses[i].x;
      dist[1]=houses[i].y;
    }
    else if(houses[i].team==1)
    {
      for(short i0=0;i0<800;i0++)
      {
        if(units[i0].x==houses[i].x && units[i0].y==houses[i].y)
        {
          res[0]=1;
          res[1]=i0;
          dist[0]=units[i0].x;
          dist[1]=units[i0].y;
        }
      }
    }
  }
  return(res);
}