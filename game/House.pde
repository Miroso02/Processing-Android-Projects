class House
{
  int x;
  int y;
  byte team;
  boolean newCom=true;
  House(int xx,int yy,byte tt)
  {
    x=xx;
    y=yy;
    team=tt;
  }
  void display(int x,int y)
  {
    strokeWeight(1);
    switch(team)
    {
      case 0:
      stroke(0);
      fill(0);
      break;
      
      case 1:
      stroke(0,0,255);
      fill(0,0,255);
      break;
      
      case 2:
      stroke(255,0,0);
      fill(255,0,0);
      break;
      
    }
      noStroke();
      rect(x-30,y-15,60,55);
      triangle(x-35,y-15,x,y-25,x+35,y-15);
      fill(255);
      rect(x-5,y+10,10,15);
      bezier(x-5,y+10,x-5,y,x+5,y,x+5,y+10);
  }
  void plusGold()
  {
    if(team==1)
    moneyB+=5;
    else if(team==2)
    moneyR+=5;
  }
  void newCommand()
  {
    
  }
}