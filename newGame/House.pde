class House
{
  float x,y;
  int team;
  int lvl;
  int baseIndex;
  int daysToUnit=-1;
  int hp;
  
  House(int bi)
  {
    baseIndex=bi;
    team=bases[baseIndex].team;
    if(bases[baseIndex].houses.length==1)
    {
      x=bases[baseIndex].x-40;
      y=bases[baseIndex].y;
    }
    else
    {
      x=bases[baseIndex].x-40;
      y=bases[baseIndex].y+60;
    }
  }
  
  void display()
  {
    if(team==1)
    fill(0,0,255);
    else
    fill(255,0,0);
    noStroke();
    
    triangle(x-20,y+20,x,y-20,x+20,y+20);
  }
  
  void produce()
  {
    daysToUnit++;
    if(daysToUnit==4)
    {
      bases[baseIndex].newUn(false);
      daysToUnit=0;
    }
  }
}