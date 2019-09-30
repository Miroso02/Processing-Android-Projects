class Model
{
  ArrayList<Dot> vertex=new ArrayList<Dot>();
  Dot center;
  Model(Dot... newV)//нужно передать 4 точки
  {
    for(int i=0;i<newV.length;i++)
    {
      vertex.add(newV[i]);
    }
    
    int x0=0,y0=0,z0=0;
    for(int i=0;i<newV.length;i++)
    {
      x0+=vertex.get(i).cord[0];
      y0+=vertex.get(i).cord[1];
      z0+=vertex.get(i).cord[2];
    }
    x0/=4;y0/=4;z0/=4;
    center=new Dot(x0,y0,z0);
    
    setAmp(center);
  }
  void display()
  {
    float[] v1=vertex.get(0).cord,
            v2=vertex.get(1).cord,
            v3=vertex.get(2).cord,
            v4=vertex.get(3).cord;
    fill(0);
    stroke(255);
    quad(v1[0]/v1[2]*100,v1[1]/v1[2]*100,
         v2[0]/v2[2]*100,v2[1]/v2[2]*100,
         v3[0]/v3[2]*100,v3[1]/v3[2]*100,
         v4[0]/v4[2]*100,v4[1]/v4[2]*100);
  }
  void rotat()
  {
    //setAmp(center);
    Dot[] v=new Dot[4];
    for(int i=0;i<v.length;i++)
    {
      v[i]=gertex.get(i);
    }
    float[] d1={v[0].ampX,v[0].ampY,v[0].ampZ},
            d2={v[1].ampX,v[1].ampY,v[1].ampZ},
            d3={v[2].ampX,v[2].ampY,v[2].ampZ},
            d4={v[3].ampX,v[3].ampY,v[3].ampZ};
    float[][] d=new float[3][v.length];
    for(int i=0;i<v.length;i++)
    {
      d[i]={v[0].ampX,v[0].ampY,v[0].ampZ};
      d[i]={v[1].ampX,v[1].ampY,v[1].ampZ};
      d[i]={v[2].ampX,v[2].ampY,v[2].ampZ};
    }
    Dot a1=new Dot(d1,v[0].ampX,v[0].ampY,v[0].ampZ),
        a2=new Dot(d2,v[1].ampX,v[1].ampY,v[1].ampZ),
        a3=new Dot(d3,v[2].ampX,v[2].ampY,v[2].ampZ),
        a4=new Dot(d4,v[3].ampX,v[3].ampY,v[3].ampZ); 
    for(int i=0;i<v.length;i++)
    {
      v[i]=a
    }
    v1=a1.multiple(n)/*.multiple(k)/*.multiple(m)*/.addd(center); vertex.set(0,v1);
    v2=a2.multiple(n)/*.multiple(k)/*.multiple(m)*/.addd(center); vertex.set(1,v2);
    v3=a3.multiple(n)/*.multiple(k)/*.multiple(m)*/.addd(center); vertex.set(2,v3);
    v4=a4.multiple(n)/*.multiple(k)/*.multiple(m)*/.addd(center); vertex.set(3,v4);
  }
  void setAmp(Dot cent)
  {
    for(int i=0;i<vertex.size();i++)
    {
      vertex.get(i).ampX=vertex.get(i).cord[0]-cent.cord[0];
      vertex.get(i).ampY=vertex.get(i).cord[1]-cent.cord[1];
      vertex.get(i).ampZ=vertex.get(i).cord[2]-cent.cord[2];
    }
  }
}