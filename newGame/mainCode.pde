int nUn=0;
int nZo=10;
Warriors[] people=new Warriors[nUn];
Warriors[] zombie=new Warriors[nZo];
Base[] bases=new Base[4];
int day=0;
int[] money=new int[2];
void setup()
{
  size(displayWidth, displayHeight);
  for(int i=0; i<bases.length; i++)
  {
    bases[i]=new Base(200*(i+1), 200, 1, i);
  }
  for(int i=0;i<zombie.length;i++) 
  {
    zombie[i]=new Warriors(2,i);
  }
  for(int i=0;i<people.length;i++) 
  {
    people[i]=new Warriors(1,i);
    people[i].setTarget(500,500);
  }
  orientation(LANDSCAPE);
}

void draw()
{
  try
  {
  background(255);
  
  days();
  
  for(Base b1: bases)
  {
    b1.display();
    b1.lvlUp();
    b1.newUn(true);
    b1.newHow();
    b1.choosed();
  }
  for(int i=0;i<people.length;i++)
  {
    if(people[i]==null)
    people[i]=new Warriors(1,i);
    people[i].display(color(0));
    people[i].peopleIntelect();
  }
  for(int i=0;i<zombie.length;i++)
  {
    if(zombie[i]==null)
    zombie[i]=new Warriors(2,i);
    zombie[i].display(color(255,0,0));
    zombie[i].zombieIntelect();
  }
  fill(0);
  textSize(60);
  text(money[0],100,200);
 }
 catch(java.lang.ArrayIndexOutOfBoundsException e)
 {
   e.printStackTrace();
 }
}