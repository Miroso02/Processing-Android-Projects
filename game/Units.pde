class Units
{
  int x;
  int y; 
  int n;

  byte heal, heal0;
  byte dam;
  byte armor;
  byte speed, speed0;
  byte attacks, at0;
  byte type;
  byte team;
  byte cost;
  byte kills, kill0;
  Units(int xx, int yy, int nn, byte hh, byte h0, byte dd, byte ar, byte ss, byte s0, byte at, byte a0, byte ty, byte tt, byte cc, byte kk, byte k0)
  {
    x=xx;
    y=yy;
    n=nn;
    heal=hh;
    heal0=h0;
    dam=dd;
    armor=ar;
    speed=ss;
    speed0=s0;
    attacks=at;
    at0=a0;
    type=ty;
    team=tt;
    cost=cc;
    kills=kk;
    kill0=k0;
  }
  void display(int x, int y)
  {
    if (team==1)
    {
      stroke(0, 0, 255);
      fill(0, 0, 255);
    } else if (team==2)
    {
      stroke(255, 0, 0);
      fill(255, 0, 0);
    }
    switch(type)
    {
    case 1:
      strokeWeight(5);
      line(x+28, y+5, x+28, y-40);
      line(x+30, y-10, x-30, y-10);
      line(x, y-30, x, y+10);
      line(x, y+10, x-15, y+40);
      line(x, y+10, x+15, y+40);
      strokeWeight(1);
      ellipse(x, y-30, 15, 15);
      break;

    case 2:
      strokeWeight(3);
      ellipse(x, y-30, 15, 15);
      line(x, y-30, x, y+10);
      line(x, y+10, x-15, y+40);
      line(x, y+10, x+15, y+40);
      line(x, y-5, x+28, y-13);
      line(x, y-5, x-18, y-10);
      line(x-18, y-10, x+6, y-12);
      strokeWeight(1);
      line(x+19, y-30, x+6, y-12);
      line(x+24, y+10, x+6, y-12);
      stroke(150);
      line(x+6, y-12, x+40, y-17);
      strokeWeight(3);
      fill(0, 0);
      bezier(x+19, y-30, x+34, y-15, x+34, y-15, x+24, y+10);
      break;

    case 3:
      strokeWeight(5);
      rect(x-10, y-40, 20, 25, 20);
      rect(x-10, y, 5, 40, 1);
      rect(x+10, y-15, 5, 55, 2);
      line(x+13, y-10, x+25, y);
      line(x+25, y, x+40, y-10);
      rect(x-30, y-15, 35, 40, 5);
      strokeWeight(2);
      triangle(x+36, y-35, x+40, y-42, x+44, y-35);
      line(x+40, y-40, x+40, y+40);
      fill(255);
      stroke(255);
      ellipse(x-4, y-30, 2, 2);
      ellipse(x+4, y-30, 2, 2);
      ellipse(x, y-24, 2, 2);
      break;

    case 4:
      strokeWeight(1);
      bezier(x-25, y-5, x-35, y, x-35, y+10, x-30, y+35);
      rect(x-11, y-20, 21, 20, 10);

      strokeWeight(5);
      ellipse(x, y, 50, 25);
      line(x-20, y+5, x-15, y+20);
      line(x-15, y+20, x-18, y+35);
      strokeWeight(4);
      line(x-15, y+5, x-5, y+20);
      line(x-5, y+20, x-5, y+30);

      strokeWeight(5);
      line(x+5, y+5, x+10, y+20);
      line(x+10, y+20, x+7, y+35);
      strokeWeight(4);
      line(x+10, y+5, x+20, y+20);
      line(x+20, y+20, x+20, y+30);

      quad(x+20, y-5, x+25, y, x+30, y-25, x+25, y-30);
      ellipse(x+30, y-20, 20, 10);
      strokeWeight(3);
      line(x+18, y-30, x+25, y-45);
      ellipse(x, y-30, 10, 6);
      ellipse(x-8, y-27, 8, 5);
      strokeWeight(5);
      line(x-4, y-5, x+6, y-40);
      ellipse(x+8, y-40, 5, 5);
      strokeWeight(3);
      line(x+2, y-30, x+10, y-24);
      line(x+30, y-20, x+10, y-24);
      line(x+2, y-30, x+20, y-35);
      rect(x-5, y-20, 10, 2, 20);
      break;
    }
  }

  void check()
  {
   for (byte i=0; i<6; i++)
   {
      if (cursor.x==x && cursor.y==y || cursor.x==houses[i].x && cursor.y==houses[i].y && houses[i].team>0 && units[n0].team!=houses[i].team && !houses[i].newCom)
      {
        newU=false;
        moving=false;
        if (units[n0].team!=team && units[n0].speed>0 && units[n0].attacks>0)
        {
          if (team==1 && !moveBlue || team==2 && moveBlue)
          {
            if (units[n0].type==2)
            {
              if (abs(units[n0].x-x)+abs(units[n0].y-y)<=2*s)
              {
                heal-=(units[n0].dam-armor);
                units[n0].speed-=1;
                units[n0].attacks-=1;
                n0=n;
              }
            } 
            else
            {
              if (abs(units[n0].x-x)+abs(units[n0].y-y)<=s)
              {
                heal-=(units[n0].dam-armor);
                units[n0].speed-=1;
                units[n0].attacks-=1;

                if (heal<=0)
                {
                  x=2000;
                  units[n0].kills+=1;
                }
                n0=n;
              }
            }
          }
        }
      }
    }
  }

  void move()
  {
    String tip="";
    moving=true;
    if (cursor.x==x && cursor.y==y)
    {
      for (byte i=0; i<6; i++)
      {
        houses[i].newCom=true;
        for (int i1=0; i1<800; i1++)
        {
          if (abs(houses[i].x-units[i1].x)+abs(houses[i].y-units[i1].y)<=s && houses[i].team==units[i1].team && houses[i].team>0)
          {
            houses[i].newCom=false;
          }
          if(!houses[i].newCom)
            break;
          if (houses[i].x==x && houses[i].y==y && houses[i].team!=team && houses[i].newCom==true)
            houses[i].team=team;
            
        }
      }
      switch(type)
      {
      case 1:
        tip="Swordsman";
        break;

      case 2:
        tip="Archer";
        break;

      case 3:
        tip="Copiton";
        break;

      case 4:
        tip="Horse rider";
        break;
      }
      textSize(20);
      textAlign(LEFT);
      if (team==1)
        fill(0, 0, 255);
      else
        fill(255, 0, 0);
      text(tip + "\n" + "Health  " + heal + "/" + heal0 + "\n" + "Damage  " + dam + "\n" + "Armor  " + armor + "\n" + "Speed  " + speed + "\n" + "Attacks  " + attacks + "\n" + "Kills  " + kills, width-4*s, s/4);

      if (mousePressed && mouseX<10*s)
      {
        cursor.move();
        if (abs(cursor.x-x)<=s && cursor.y==y || abs(cursor.y-y)<=s && cursor.x==x)
        {
          if (speed>0)
          {
            if (team==1 && moveBlue || team==2 && !moveBlue)
            {
              n0=n;
              for (int i6=0; i6<800; i6++)
              {
                units[i6].check();
              }
              if (moving)
              {
                x=int(mouseX/s)*s;
                y=int(mouseY/s)*s;
                speed-=1;
              }
              else
              n0=800;
            }
          }
        }
      }
    }
  }
  void level()
  {
    int rand=0;
    if (kills==kill0)
    {
      rand=int(random(1, 101));
      if (rand<=45)
      {
        heal+=5;
        heal0+=5;
      } else if (rand>45 && rand<86)
        dam+=1;
      else if (rand>=86 && rand<=95)
        armor+=1;
      else if (rand>96)
      {
        speed+=1;
        speed0+=1;
      }
      kill0+=2;
    }
  }
  void healing()
  {
    if (team==1 && x<s && moveBlue || team==2 && x>=9*s && !moveBlue)
    {
      if (heal<heal0)
        heal+=1;
    }
  }
  void move1(int x0,int y0)
  {
    cursor.x=x0;
    cursor.y=y0;
    if(distance(x,y,x0,y0)==1)
    {
      if(!check1(x0,y0))
      {
        x=x0;
        y=y0;
        speed--;
      }
      else
      {
        if(battle(x0,y0,dam,team))
        {
          speed--;
          attacks--;
        }
      }
    }
  }
  boolean battle(int x0,int y0,byte dam0,byte team0)
  {
    boolean res=false;
    for(short i=0;i<800;i++)
    {
      if(units[i].x==x0 && units[i].y==y0)
      {
        if(units[i].team!=team0)
        {
          units[i].heal-=(dam0-units[i].armor);
          res=true;
        }
        else
        res=false;
      }
    }
     return res;
  }
}
