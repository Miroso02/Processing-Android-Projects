boolean doing=true;
boolean moveBlue=true;
boolean newU=false;
boolean moving=true;
boolean newCom=false;
int j; 
int s;
int[] dist=new int[6];
int n0;
int l1=-1, l2=199, l3=399, l4=599;
int moneyB=50, moneyR=1000;
byte typeUnit;

Cursor cursor;

Button next;
Button swords, arch, copit, vsad;

Units[] units=new Units[801];

House[] houses=new House[6];
void setup()
{
  size(displayWidth, displayHeight);
  s=height/8;

  cursor=new Cursor(-100, 0);

  next=new Button(width-2*s, height-s, 2*s, s, 0, 0, 255);

  swords=new Button(width-s, 0, s, s, 0, 255, 0);
  arch=new Button(width-s, s, s, s, 0, 255, 0);
  copit=new Button(width-s, s*2, s, s, 0, 255, 0);
  vsad=new Button(width-s, s*3, s, s, 0, 255, 0);

  for (int i3=0; i3<801; i3++)
  {
    units[i3]=new Units(-100, -100, 0, byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0), byte(0));
  }

  houses[0]=new House(s, s, byte(0));
  houses[1]=new House(s, 6*s, byte(0));
  houses[2]=new House(4*s, 3*s, byte(0));
  houses[3]=new House(5*s, 4*s, byte(0));
  houses[4]=new House(8*s, s, byte(0));
  houses[5]=new House(8*s, 6*s, byte(0));

  orientation(LANDSCAPE);
}
void draw()
{
  background(255);
  field();
  for (int i5=0; i5<800; i5++)
  {
    units[i5].move();
    units[i5].level();
  }
  cursor.move();
  textSize(30);
  textAlign(LEFT);

  if (!moveBlue)
  {
    next.r=255;
    next.b=0;
    opponent();
  }
  if (moveBlue)
  {
    fill(0, 0, 255);
    text("Money  " + moneyB, width-4*s, height-s/2);
  } else
  {
    fill(255, 0, 0);
    text("Money  " + moneyR, width-4*s, height-s/2);
  }

  if (next.pressed())
  {
    if (moveBlue)
    {
      next.r=255;
      next.b=0;
      moveBlue=false;
    } else
    {
      moveBlue=true;
      next.b=255;
      next.r=0;
      for (byte i1=0; i1<houses.length-1; i1++)
        houses[i1].plusGold();
    }
    for (int i7=0; i7<800; i7++)
    {
      units[i7].speed=units[i7].speed0;
      units[i7].attacks=units[i7].at0;
      units[i7].healing();
    }
  }

  if (moveBlue)
  {
    if (moneyB>=30)
    {
      if (swords.pressed())
      {
        if (newU)
        {
          newU=false;
          swords.r=0;
        }

        newU=true;
        typeUnit=1;
        cursor.x=swords.x;
        cursor.y=swords.y;
        swords.r=255;
        arch.r=0;
        copit.r=0;
        vsad.r=0;
      } else if (arch.pressed())
      {
        if (newU)
        {
          newU=false;
          arch.r=0;
        }
        newU=true;
        typeUnit=2;
        cursor.x=arch.x;
        cursor.y=arch.y;
        arch.r=255;
        copit.r=0;
        swords.r=0;
        vsad.r=0;
      } else if (copit.pressed())
      {
        if (newU)
        {
          newU=false;
          copit.r=0;
        }
        newU=true;
        typeUnit=3;
        cursor.x=copit.x;
        cursor.y=copit.y;
        arch.r=0;
        copit.r=255;
        swords.r=0;
        vsad.r=0;
      } else if (vsad.pressed())
      {
        if (newU)
        {
          newU=false;
          vsad.r=0;
        }
        newU=true;
        typeUnit=4;
        cursor.x=vsad.x;
        cursor.y=vsad.y;
        arch.r=0;
        copit.r=0;
        swords.r=0;
        vsad.r=255;
      }
    }
    for (int i4=0; i4<800; i4++)
    {
      units[i4].check();
    }
    if (newU && mousePressed)
    {
      newUnit(mouseX, mouseY);
    }
  }

  for (int i2=0; i2<800; i2++)
  {
    if (i2<6)
      houses[i2].display(houses[i2].x+s/2, houses[i2].y+s/2);
    units[i2].display(units[i2].x+s/2, units[i2].y+s/2);
  }
}
