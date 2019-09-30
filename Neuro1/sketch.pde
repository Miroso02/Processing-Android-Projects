Arrow[] meteors = new Arrow[20]; //obstacles
Player[] players =new Player[45]; //AIs
int generation; //number of generation
int score, highscore; 

void setup()
{
  size(displayWidth,displayHeight);
  generation=1; //first generation
  score=0;
  highscore=0;
  
  for(int i=0;i<meteors.length;i++)
  {
    meteors[i]=new Arrow();
  }
  
  for(int i=0;i<players.length;i++)
  {
    players[i]=new Player();
  }
}

void draw()
{
  background(155);
  
  score++; //increacing with time
  for(Arrow a: meteors)
  {
    a.display();
    a.move();
    if(a.isTouchingBorder())
      a.neW(); //new meteor appears
  }
  stroke(0);
  fill(0);
  textSize(60);
  text("Gen "+generation,100,100);
  text("Score "+score,width-300,100);
  text("Best "+highscore,width-300,200);
  
  for(Player p:players)
  {
    if(!p.dead)
    {
      p.display();
      p.think(); //creating spX/spY from data and weights
      p.move();
    }
    p.die(); //performs always
  }
  
  boolean allDead=true; //all players are dead
  for(Player p:players)
  {
    if(!p.dead)
    {
      allDead=false;  //if at least 1 is alive
      break;
    }
  }
  
  if(allDead)
    timeToDie();//look↓
}

void timeToDie() //here it is
{
  generation++; //go to next generation
  if(highscore<score)
    highscore=score; //if highscore is beaten
  score=0; //starts from the begining
  
  int champion=0; 
  int champion2=0; //indexes of the best 
  int champion3=0; //players in last game
  int champion4=0;
  for(int i=0;i<players.length;i++)
  {
    if(players[champion].lifeTime<players[i].lifeTime)
    {
      champion=i; //finding the best 1
    }
  }
  for(int i=0;i<players.length;i++)
  {
    if(players[champion2].lifeTime<players[i].lifeTime)
    {
      if(i!=champion)
        champion2=i; //finding the best 2
    }
  }
  for(int i=0;i<players.length;i++)
  {
    if(players[champion3].lifeTime<players[i].lifeTime)
    {
      if(i!=champion && i!=champion2)
        champion3=i; //finding the best 3
    }
  }
  for(int i=0;i<players.length;i++)
  {
    if(players[champion4].lifeTime<players[i].lifeTime)
    {
      if(i!=champion && i!=champion2 && i!=champion3)
        champion4=i; //finding the best 4
    }
  }
  
  int num=40;
  for(int i=0;i<players.length;i++) 
  { //creating champion's children
    if(i==champion || i==champion2 || i==champion3 ||
       i==champion4 || players[i].best==highscore)
    { //if the player is champion or have beaten a highscore
      //we leave him without changes
      players[i].neW(players[champion].weights,false);
      players[i].isChampion=true; //colour parameter
      continue;
    }
    if(num>30)
    {
      players[i].neW(players[champion].weights,true); 
    }
    else if(num>20)
    {
      players[i].neW(players[champion2].weights,true); 
    }
    else if(num>10)
    {
      players[i].neW(players[champion3].weights,true); 
    }
    else
    {
      players[i].neW(players[champion4].weights,true); 
    }
    num--;
    //look Player → neW()
  }
  for(Arrow m:meteors)
  {
    m.neW(); //meteors return to borders
  }
}