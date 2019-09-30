Point[] p;
int n=0, drawingType=0;
boolean seetings,drawing;
Arrow a;
float traectX0, traectY0;
void setup()
{
  rectMode(CENTER);
  p=new Point[1000];
  for (int i=0; i<1000; i++)p[i]=new Point();
  background(0);
  a=new Arrow(p);
  speed[0]=new Button(400, 200, 80, 80, new Action() {
    public void act()
    {
      a.speed-=1;
    }
  }
  );
  speed[0].setText("-1");
  speed[1]=new Button(480, 200, 80, 80, new Action() {
    public void act()
    {
      a.speed-=0.1;
    }
  }
  );
  speed[1].setText("-0.1");
  speed[2]=new Button(560, 200, 80, 80, new Action() {
    public void act()
    {
      a.speed+=0.1;
    }
  }
  );
  speed[2].setText("+0.1");
  speed[3]=new Button(640, 200, 80, 80, new Action() {
    public void act()
    {
      a.speed+=1;
    }
  }
  );
  speed[3].setText("+1");
  continueTraectory=new Button(480, 280, 240, 80, new Action() {
    public void act()
    {
      switch(a.typeOfMovingAfterTraectory)
      {
      case 0: 
        continueTraectory.setText("continue/line"); 
        a.typeOfMovingAfterTraectory++; 
        break;
      case 1: 
        continueTraectory.setText("continue/restart"); 
        a.typeOfMovingAfterTraectory++; 
        break;
      case 2: 
        continueTraectory.setText("stop"); 
        a.typeOfMovingAfterTraectory=0; 
        break;
      }
    }
  }
  );
  continueTraectory.setText("stop");
  drawTraectory=new Button(655, 280, 100, 80, new Action()
  {
    public void act()
    {
      switch(drawingType)
      {
      case 0: 
        drawingType=1; 
        drawTraectory.setText("lines"); 
        break;
      case 1: 
        drawingType=0; 
        drawTraectory.setText("free"); 
        break;
      }
    }
  }
  );
  drawTraectory.setText("free");
  show=new Button(width-160, height-80, 160, 80, new Action()
  {
    public void act()
    {
      if (seetings)
      {
        show.setText("stop");
        seetings=false;
        a.x=a.traectory[0].x;
        a.y=a.traectory[0].y;
        a.nPoint=0;
      } 
      else
      {
        show.setText("show");
        seetings=true;
        n=0;
        traectX0=mouseX;
        traectY0=mouseY;
      }
    }
  }
  );
  show.setText("show");
  changeTraectory=new Button(width-160,height/2,160,80,new Action()
  {
    public void act()
    {
      if(drawing)
      {
        drawing=false;
        changeTraectory.setText("redraw");
        a.setTraectory(p);
        n=0;
      }
      else
      {
        drawing=true;
        changeTraectory.setText("OK");
        for (int i=0; i<1000; i++)
          p[i]=new Point();
      }
    }
  });
  changeTraectory.setText("redraw");
}
void draw()
{
  if (seetings)
  {
    changeTraectory.doAll();
    if(drawing)
    {
      if(mousePressed && !changeTraectory.press)
      {
      if (drawingType==0)
      {
        p[n].x=mouseX;
        p[n].y=mouseY;
        stroke(255);
        strokeWeight(5);
        if(n>0)
        line(p[n-1].x,p[n-1].y,mouseX,mouseY);
      } 
      else
      {
        line(traectX0, traectY0, mouseX, mouseY);
      }
      n++;
      if (n==999)n=0;
      }
    }
    else
    {
      stroke(255);
      strokeWeight(2);
      for(int i=1;i<a.traectory.length;i++)
      {
        if(a.traectory[i].x==0)break;
        line(a.traectory[i-1].x,a.traectory[i-1].y,a.traectory[i].x,a.traectory[i].y);
      }
      redactor();
      show.doAll();
    }
  } 
  else
  {
    background(0);
    a.move();
    a.display();
    show.doAll();
  }
}