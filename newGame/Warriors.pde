float j=100, k=1;
class Warriors
{
  float x, y;
  int hp;
  float speed, spX=0, spY=0;
  float targetX, targetY;
  int baseIndex;
  int tim=0, tim2=0, timToRes=1;
  int chosenUnitIndex;
  Arrow ar;
  boolean fired;
  boolean choosed;
  int index;

  Warriors(int type, int index)
  {
    if (type==1)
    {
      baseIndex=0;
      x=bases[baseIndex].x;
      y=bases[baseIndex].y;
      speed=2;
      hp=1;
      ar=new Arrow();
      chosenUnitIndex=-1;
    } 
    else
    {
      chosenUnitIndex=-1;
      speed=3.5;
    }
    this.index=index;
  }
  Warriors(float xx, float yy, float tx, float ty, float s, int bi, int index)
  {
    x=xx;
    y=yy;
    targetX=tx;
    targetY=ty;
    speed=s;
    baseIndex=bi;
    ar=new Arrow();
    this.index=index;
  }

  void display(color col)
  {
    fill(col);
    noStroke();
    ellipse(x, y, 10, 10);
    strokeWeight(5);
  }

  boolean move()
  {
    if (spX==0 && spY==0)
    {
      spY=(targetY-y)*speed/sqrt(sq(targetX-x)+sq(targetY-y));
      spX=(targetX-x)*speed/sqrt(sq(targetX-x)+sq(targetY-y));
    }
    if (x>targetX-speed && x<targetX+speed && y>targetY-speed && y<targetY+speed)
    {
      spX=0;
      spY=0;

      return true;
    }
    x+=spX;
    y+=spY;

    return false;
  }
  void setTarget(float tx, float ty)
  {
    targetX=tx;
    targetY=ty;
  }
  void fire()
  {
    if (!fired)
    {
      ar=new Arrow(x, y, j, 500);
      fired=true;
    }
    ar.move(zombie[chosenUnitIndex].x, zombie[chosenUnitIndex].y);

    stroke(255, 0, 0);
    strokeWeight(10);
    if (ar.gotToTarget())
    {
      remove(zombie[chosenUnitIndex].index,true);
      tim2++;
      if (tim2>=30)
      {
        tim2=0;
        fired=false;
      }
    } 
    else
      ar.display();
  }
  void zombieIntelect()
  {
    if (chosenUnitIndex==-1)
    {
      setTarget(random(400,600), 700);
      move();
      for (int i=0; i<people.length; i++)
      {
        if (!people[i].choosed)
        {
          people[i].choosed=true;
          chosenUnitIndex=i;
          break;
        }
      }
    }
    if (chosenUnitIndex>-1)
    {
      setTarget(people[chosenUnitIndex].x, people[chosenUnitIndex].y);
      spX=0;
      spY=0;
      if (move())
      {
         remove(people[chosenUnitIndex].index,false);
      }
    }
  }
  void peopleIntelect()
  {
    if (move())
    {
      targetX=random(bases[baseIndex].x-30, bases[baseIndex].x+90);
      targetY=random(bases[baseIndex].y-30, bases[baseIndex].y+90);
      tim=0;
      timToRes=int(random(5, 30));
    }
    if (chosenUnitIndex==-1)
    {
      for (int i=0; i<zombie.length; i++)
      {
        if (!zombie[i].choosed)
        {
          zombie[i].choosed=true;
          chosenUnitIndex=i;
          break;
        }
      }
    } 
    if(chosenUnitIndex>-1)
      fire();
  }
  void remove(int ind, boolean killedZombie)
  {
    if (!killedZombie)
    {
      people[ind]=null;
      for (int i=ind; i<people.length-1; i++)
      {
        people[i]=people[i+1];
        people[i].index-=1;
      }
      Warriors[] w0=people;
      if (people.length>0)
        nUn--;

      people[people.length-1]=null;
      people=new Warriors[nUn];
      if (people.length>0)
        for (int i=0; i<people.length; i++)
          people[i]=w0[i];
      for (int i=0; i<zombie.length; i++)
      {
        if (zombie[i].chosenUnitIndex>=ind)
          zombie[i].chosenUnitIndex-=1;
      }
    } 
    else
    {
      zombie[ind]=null;
      for (int i=ind; i<zombie.length-1; i++)
      {
        zombie[i]=zombie[i+1];
        zombie[i].index-=1;
      }
      Warriors[] w0=zombie;
      if (zombie.length>0)
        nZo--;

      zombie[zombie.length-1]=null;
      zombie=new Warriors[nZo];
      if (zombie.length>0)
        for (int i=0; i<zombie.length; i++)
          zombie[i]=w0[i];
      for (int i=0; i<people.length; i++)
      {
        if (people[i].chosenUnitIndex>=ind)
          people[i].chosenUnitIndex-=1;
      }
    }
  }
}
