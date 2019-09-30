class Model0
{
  ArrayList<Dot0> vertex=new ArrayList<Dot0>();
  Dot0 center=new Dot0();
  Model0(Dot0... newV)
  {
    for(int i=0;i<newV.length;i++)
    {
      vertex.add(newV[i]);
    }
    int x0=0,y0=0,z0=0;
    for(int i=0;i<newV.length;i++)
    {
      x0+=vertex.get(i).x;
      y0+=vertex.get(i).y;
      z0+=vertex.get(i).z;
    }
    x0/=4;y0/=4;z0/=4;
    center=new Dot0(x0,y0,z0);
    
    for(int i=0;i<newV.length;i++)
    {
      vertex.get(i).ampX=vertex.get(i).x-x0;
      vertex.get(i).ampY=vertex.get(i).y-y0;
      vertex.get(i).ampZ=vertex.get(i).z-z0;
    }
  }
  
  void display()
  {
    Dot0 v1=vertex.get(0),
        v2=vertex.get(1),
        v3=vertex.get(2),
        v4=vertex.get(3);
    int k=100;
    fill(0);
    stroke(255);
    quad(v1.x/v1.z*k, v1.y/v1.z*k,
         v2.x/v2.z*k, v2.y/v2.z*k,
         v3.x/v3.z*k, v3.y/v3.z*k,
         v4.x/v4.z*k, v4.y/v4.z*k);
  }
  
  void rotat()
  {
    Dot0[] ver=new Dot0[4];
    for(int i=0;i<vertex.size();i++)
    {
      ver[i]=vertex.get(i);
    }
    int n=10;
    for(Dot0 v:vertex)
    {
      v.x=center.x+v.ampX*cos(t/n)/*-v.ampY*sin(t/n)*/+v.ampZ*sin(t/n);
    //  v.y=center.y+v.ampY*cos(t/n)-v.ampZ*sin(t/n);;
      v.z=center.z+v.ampZ*cos(t/n)-v.ampX*sin(t/n)/*+v.ampZ*cos(t/n)*/;
    }
  }
}