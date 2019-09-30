class Model
{
  ArrayList<Vertex> vertex=new ArrayList<Vertex>();
  Vertex center=new Vertex();
  Vertex movePos=new Vertex(0,0,0);
  int rotT;
  
  Model(Vertex... dots)
  {
    rotT=int(random(6));
    for(int i=0;i<dots.length;i++)
    {
      vertex.add(dots[i]);
    }
    
    float[] cent=new float[3];
    for(int i=0;i<cent.length;i++)
    {
      for(int a=0;a<dots.length;a++)
      {
        cent[i]+=dots[a].cor[i];
      }
    }
    for(int i=0;i<cent.length;i++)
    {
      cent[i]/=4;
    }
    center=new Vertex(cent);
    
    for(Vertex v:vertex)
    {
      v.setCord(v.cor[0]-center.cor[0],
                v.cor[1]-center.cor[1],
                v.cor[2]-center.cor[2]);
    }
  }
  
  void display()
  {
    Vertex[] v=new Vertex[vertex.size()];
    float[] cy= {
    cos(fi), 0, sin(fi),
    0, 1, 0,
    -sin(fi), 0, cos(fi)
    };
  float[] cx= {
    1, 0, 0,
    0, cos(gamma), -sin(gamma),
    0, sin(gamma), cos(gamma)
    };
    
    for(int i=0;i<v.length;i++)
    {
      v[i]=vertex.get(i).addd(center,true).multiple(cy).multiple(cx);
    }
    if(moving[0].pressed())
    {
      Vertex k=new Vertex(-10*cos(fi),0,-10*sin(fi));
      center=center.addd(k,true);
    }
    if(moving[1].pressed())
    {
      Vertex k=new Vertex(10*cos(fi),0,10*sin(fi));
      center=center.addd(k,true);
    }
    if(moving[2].pressed())
    {
      Vertex k=new Vertex(10*sin(fi),0,-10*cos(fi));
      center=center.addd(k,true);
    }
    if(moving[3].pressed())
    {
      Vertex k=new Vertex(-10*sin(fi),0,10*cos(fi));
      center=center.addd(k,true);
    }
    
   ArrayList<Vertex> resV=new ArrayList<Vertex>();
   int m=-1,n=0;
   for(int i=0;i<v.length;i++)
    {
      if(v[i].cor[2]>0)
      {
        m=i;
        resV.add(v[m].translateToPerspective());
        n=m+1;
        if(n==v.length)n=0;
        break;
      }
    }
    if(m<0)return;
    while(n!=m)
    {
      if(v[n].cor[2]>0)
      {
        resV.add(v[n].translateToPerspective());
        n++; if(n==v.length)n=0;
      }
      else
      {
        int k=n-1;
        if(k<0)k=v.length-1;
        Vertex l=v[n].lerpp(v[k]);
        resV.add(l);
        
        k=n+1;
        if(k==v.length)k=0;
        while(v[k].cor[2]<0)
        {
          n++;
          if(n==v.length)n=0;
          k=n+1;
          if(k==v.length)k=0;
        }
        l=v[n].lerpp(v[k]);
        resV.add(l);
        n++;
        if(n==v.length)n=0;
      }
    }
    noStroke();
    beginShape();
    for(int i=0;i<resV.size();i++)
    {
      vertex(resV.get(i).cor[0],resV.get(i).cor[1]);
    }
    endShape();
  
  }
  
  void rotat(Vertex rotA,float[]... matrix)
  {
    Vertex amp=center.addd(rotA,false);
    for(int a=0;a<matrix.length;a++)
    {
      amp=amp.multiple(matrix[a]);
    }
    center=amp.addd(rotA,true);
    
    for(int i=0;i<vertex.size();i++)
    {
      Vertex v=vertex.get(i);
      for(int a=0;a<matrix.length;a++)
      {
        v=v.multiple(matrix[a]);
      }
      vertex.set(i,v);
    }
  }
  void rotat(float[]... matrix)
  {
    rotat(center,matrix);
  }
}