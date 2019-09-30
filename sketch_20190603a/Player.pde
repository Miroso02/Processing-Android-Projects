class Player
{
  float[] weights = new float[56];
  //parameters: 12 for spX and 12 for spY

  float x, y; //position
  int speed;  //absolute
  float spX, spY; //speed X and speed Y
  boolean dead; //he's a trash!
  boolean isChampion; //green colour

  int best=0; //record for THIS player
  int lifeTime=0; //time from birth

  Player()
  {
    dead=false; //Hello, world!
    isChampion=false; //You have to do something to become a champion!
    x=width/2; //appears in center
    y=height/2;
    speed=10; //faster than meteors

    for (int i=0; i<weights.length; i++)
    {
      weights[i]=random(-100, 100); //Oh, yeah!!
    }
  }

  void display()
  {
    fill(255, 0, 0); //red – default
    if(isChampion)
      fill(0,255,0); //green – was the best in last gen.
    if(best==highscore)
      fill(0,0,255); //blue – last who've beaten the highscore
    noStroke();
    ellipse(x, y, 10, 10); //size is fixed
  }

  void move()
  {
    x+=spX;
    y+=spY;
    
    /* if(x>width) //walls don't kill you
     x=0;          
     else if(x<0)
     x=width;
     if(y>height)
     y=0;
     else if(y<0)
     y=height;*/
  }

  void think() //the hardest stuff
  {
    float spXc=0, spYc=0; //ratios of spX and spY
    
    //parameters
    float[] parameters=new float[weights.length/2];
    for(float a:parameters) a=0;
    
    parameters[0]=x-width; //dist to right wall
    parameters[1]=x;       //dist to left wall
    parameters[2]=y-height;//dist to down wall
    parameters[3]=y;       //dist to down wall
    
    for(Arrow a:meteors)
    {
      float distX=x-a.x;
      float distY=y-a.y;
      float dist=sqrt(sq(distX)+sq(distY));
      int numInMass=0;
      
      if(abs(distX)<a.size)//vertical x=0
      {
        numInMass=7;       //up
        if(distY<0)        //down
          numInMass=4;
      }
      else if(abs(distY)<a.size)//horisontal y=0
      {
        numInMass=13;           //left
        if(distX<0)             //right
          numInMass=10;
      }
      else if(abs(abs(distX)-abs(distY))<a.size/sqrt(2)) //diagonals
      {
        if(distX*distY>0)//diagonal y=-x
        {
          numInMass=19;  //up-left
          if(distX<0)    //down-right
            numInMass=16;
        }
        else             //diagonal.y=x
        {
          numInMass=25;  //up-right
          if(distX<0)    //down-left
            numInMass=22;
        }
      }
      
      if(numInMass!=0)
      {
        if(abs(dist)<abs(parameters[numInMass])  
         || parameters[numInMass]==0)
        {
          int g=80;
          parameters[numInMass]=dist;//distance
          parameters[numInMass+1]=a.spX*g;//X speed
          parameters[numInMass+2]=a.spY*g;//Y speed
        }
      }
    }

    for(int i=0;i<weights.length/2;i++)
    {
      spXc+=weights[i]*parameters[i];
    }
    for(int i=weights.length/2;i<weights.length;i++)
    {
      spYc+=weights[i]*parameters[i-weights.length/2];
    }

    spX=spXc*speed/(abs(spXc)+abs(spYc));
    spY=spYc*speed/(abs(spXc)+abs(spYc));
  }

  void die()
  {
    if(!dead)
    {
      lifeTime++; //you still exist!
    }
    
    for (Arrow a : meteors)
    {  //if meteor is touching you
      if (sq(x-a.x)+sq(y-a.y)<sq(a.size/2+10))
      {
        setRec();
      }
    }
    if (x<0 || x>width || y<0 || y>height)
    {  //or if wall is touching you
      setRec();
    }
  }

  void neW(float[] genes, boolean change)
  {
    //genes – parameters of the best players
    //change – false for the best players
    dead=false;  //reborn
    x=width/2;
    y=height/2;
    speed=10;
    lifeTime=0;

    if (change) //if you're not the chosen one
    {
      for (int i=0; i<weights.length; i++)
      {
        //we change his weights according to
        //the best ones
        int t=(int)random(20)+1;
        switch(t)
        {
        case 1: 
          weights[i]=genes[i]+4; 
          break;
        case 2: 
          weights[i]=genes[i]-4; 
          break;
        case 3: 
          weights[i]=genes[i]*1.1; 
          break;
        case 4: 
          weights[i]=genes[i]/1.1; 
          break;
        case 5: 
          weights[i]=genes[i]+10; 
          break;
        case 6: 
          weights[i]=genes[i]-10; 
          break;
        case 7: 
          weights[i]=genes[i]*1.3; 
          break;
        case 8: 
          weights[i]=genes[i]/1.3; 
          break;
        case 9: 
          weights[i]=-genes[i]; 
          break;
        case 10:
          weights[i]=random(-100,100);
          break;
        case 11:
          weights[i]=random(-100,100);
          break;
        default: //45% chance not to change parameter
          weights[i]=genes[i]; 
        }
      }
    }
  }
  
  void setRec()
  {
    if(!dead)
    {
      dead=true;
      if(lifeTime>best)
        best=lifeTime;
      isChampion=false;
    }
  }
}
