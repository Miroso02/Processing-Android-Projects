int distance(int x0,int y0,int xt,int yt)
{
  int res=0;
  res=int(abs(xt-x0)/s)+int(abs(yt-y0)/s);
  return res;
}
boolean check1(int x0,int y0)
  {
    boolean res=false;
    for(short i=0;i<800;i++)
    {
      if(units[i].x==x0 && units[i].y==y0)
      res=true;
    }
    return res;
  }
int biggest(int[] mass)
{
  int res=0;
  for(int i=0;i<mass.length;i++)
  {
    if(res<mass[i])
    res=mass[i];
  }
  for(int i=0;i<mass.length;i++)
  {
    if(mass[i]==res)
    res=i;
  }
  return(res);
}