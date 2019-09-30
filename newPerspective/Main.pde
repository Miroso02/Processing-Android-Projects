Model[] models=new Model[100];
Model[] model=new Model[1];
float t=0.1;
String[] lines;
float fi=0,gamma=0;
Button[] moving=new Button[4];

void setup()
{
  size(displayWidth, displayHeight);
  background(100);

  moving[0]=new Button(150,500,80,80);
  moving[1]=new Button(50,500,80,80);
  moving[2]=new Button(100,400,80,80);
  moving[3]=new Button(100,600,80,80);
 /* try
  {
    lines=loadStrings("models.txt");
    if (lines!=null)
    {
      models=new Model[lines.length];
      for (int i=0; i<lines.length; i++)
      {
        String[] data=split(lines[i], '|');
        String[] coordVert=split(data[0], ';');
        float[][] cordVert=new float[4][3];
        for (int a=0; a<coordVert.length; a++)
        {
          String[] coord=split(coordVert[a], ",");
          float[] cords= {
            Float.parseFloat(coord[0]), Float.parseFloat(coord[1]), Float.parseFloat(coord[2])
            };
            cordVert[a]=cords;
        }
        models[i]=new Model(new Vertex(cordVert[0]), 
        new Vertex(cordVert[1]), 
        new Vertex(cordVert[2]), 
        new Vertex(cordVert[3]));

        String[] other=split(data[1], ";");
        String[] centerCords=split(other[0], ',');
        float[] centCords= {
          Float.parseFloat(centerCords[0]), 
          Float.parseFloat(centerCords[1]), 
          Float.parseFloat(centerCords[2])
        };
        models[i].setRotAxis(new Vertex(centCords));
      }
    }
  }
  catch(java.lang.NullPointerException e) {
  }*/

  for(int i=0;i<models.length;i++)
  {
    float xx1=random(-5000,5000);
    float xx2=xx1+random(-300,300);
    float yy1=random(-2000,2000);
    float yy2=yy1+random(-300,300);
    float zz1=random(-5000,5000);
    float zz2=zz1+random(-300,300);
    int c=int(random(2));
    if(c==1)
    {
    models[i]=new Model(
    new Vertex(xx1,yy1,zz2),
    new Vertex(xx1,yy2,zz1),
    new Vertex(xx2,yy2,zz1),
    new Vertex(xx2,yy1,zz2));
    }
    else
    {
    models[i]=new Model(
    new Vertex(xx1,yy1,zz1),
    new Vertex(xx1,yy2,zz1),
    new Vertex(xx2,yy2,zz2),
    new Vertex(xx2,yy1,zz2));
    }
  }
  model[0]=new Model(new Vertex(100, 50, 700), 
  new Vertex(200, 50, 700), 
  new Vertex(200, -50, 700), 
  new Vertex(100, -50, 700));
 /* model[1]=new Model(new Vertex(400, -100, 1200), 
  new Vertex(300, -100, 1200), 
  new Vertex(300, -500, 1200), 
  new Vertex(400, -500, 1200));*/
}
void draw()
{
  float[] z= {
    cos(t), -sin(t), 0,
    sin(t), cos(t), 0,
    0, 0, 1
  };
  float[] y= {
    cos(t), 0, sin(t),
    0, 1, 0,
    -sin(t), 0, cos(t)
    };
  float[] x= {
    1, 0, 0,
    0, cos(t), -sin(t),
    0, sin(t), cos(t)
    };
    
   fi+=(float)(pmouseX-mouseX)/(float)500;
   gamma-=(float)(pmouseY-mouseY)/(float)500;
    translate(displayWidth/2, displayHeight/2);
   background(100);
   fill(0);
   stroke(255);
  
  for(int i=model.length-1;i>-1;i--)
  {
    model[i].display();
  }
  for (Model m : models)
  {
    m.display();
    switch(m.rotT)
    {
      case 0: m.rotat(x); break;
      case 1: m.rotat(y); break;
      case 2: m.rotat(z); break;
    }
  }
  for(Button b: moving)
  {
    b.display("");
  }
}
