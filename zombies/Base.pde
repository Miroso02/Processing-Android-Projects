class Base
{
  float x,y;
  int lvl;
  int team;
  int hp;
  int index;
  boolean choose;
  House[] houses=new House[0];
  Button levelUp;
  Button newHouse;
  Button newUnit;
  Button base;
  
  Base()
  {
    team=1;
    index=0;
    lvl=1;
    x=200;
    y=200;
    levelUp=new Button(x,y-100,100,50, 255,0,255, 0,255,255);
    newUnit= new Button(x,y+100,100,50, 255,100,255, 100,255,255);
    newHouse=new Button(x+160,y,100,50, 100,100,255, 255,100,100);
    base=new Button(x,y,60,60, 0,0,0, 0,0,0);
  }
  Base(float x, float y, int team, int index)
  {
    this.x=x;
    lvl=1;
    this.y=y;
    levelUp=new Button(x,y-100,100,50, 255,0,255, 0,255,255);
    newUnit= new Button(x,y+100,100,50, 255,100,255, 100,255,255);
    newHouse=new Button(x+160,y,100,50, 100,100,255, 255,100,100);
    this.team=team;
    this.index=index;
    base=new Button(x,y,60,60, 0,0,0, 0,0,0);
  }
  
  void display()
  {
    if(choose)
    {
      levelUp.display("");
      newUnit.display("");
      newHouse.display("");
    }
    for(House h:houses)
    {
      if(h!=null)
      h.display();
    }
    if(team==1)
    fill(0,0,255);
    else
    fill(255,0,0);
    noStroke();
    rect(x,y,60,60);
    
    fill(255,255,0);
    switch(lvl)
    {
      case 1: ellipse(x+30,y+30,20,20);break;
      case 2: ellipse(x+15,y+30,20,20);
              ellipse(x+45,y+30,20,20);break;
      case 3: ellipse(x+30,y+15,20,20);
              ellipse(x+15,y+45,20,20);
              ellipse(x+45,y+45,20,20);break;
      case 4: ellipse(x+15,y+15,20,20);
              ellipse(x+15,y+45,20,20);
              ellipse(x+45,y+15,20,20);
              ellipse(x+45,y+45,20,20);break;
      
    }
  }
  void lvlUp()
  {
    if(levelUp.pressed() && money[team-1]>=5*(sq(lvl)+1) && lvl<4 && choose)
    {
      lvl++;
      money[team-1]-=5*(sq(lvl-1)+1);
    }
  }
  void newUn(boolean bought)
  {
    if(newUnit.pressed() && choose || !bought)
    {
      if(team==1 && money[0]>=2)
      {
        Warriors[] info=new Warriors[nUn];
        for(int i=0;i<people.length;i++)
        {
          info[i]=people[i];
        }
        
        nUn++;
        people=new Warriors[nUn];
        people[nUn-1]=new Warriors(x+30, y+30, x,y, 2, index, nUn-1);
        people[nUn-1].setTarget(bases[people[nUn-1].baseIndex].x,bases[people[nUn-1].baseIndex].y);
        
        for(int i=0;i<people.length-1;i++)
        {
          people[i]=info[i];//new Warriors(info[0][i], info[1][i], info[2][i], info[3][i], 2);
        }
        if(bought)
        money[0]-=2;
      }
    }
  }
  void newHow()
  {
    if(newHouse.pressed() && choose && money[team-1]>=25 && houses.length<2)
    {
      if(houses.length==0)
      {
        houses=new House[1];
        houses[0]=new House(index);
      }
      else
      {
        House h1=houses[0];
        
        houses=new House[2];
        houses[0]=h1;
        houses[1]=new House(index);
      }
      money[team-1]-=25;
    }
  }
  void giveMoney()
  {
    money[team-1]+=lvl;
  }
  void choosed()
  {
    if(base.pressed())
    {
      if(choose)
      choose=false;
      else
      choose=true;
    }
  }
}