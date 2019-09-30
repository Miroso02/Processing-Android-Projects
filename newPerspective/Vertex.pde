class Vertex
{
  float[] cor=new float[3];
  Vertex(float... cord)
  {
    cor=cord;
  }
  Vertex(){}
  
  Vertex addd(Vertex point,boolean sign)
  {
    float[] res=new float[3];
    float[] cord=point.cor;
    for(int i=0;i<cor.length;i++)
    {
      if(sign)
        res[i]=cor[i]+cord[i];
      else
        res[i]=cor[i]-cord[i];
    }
    return new Vertex(res);
  }
  
  Vertex multiple(float[] matrix)
  {
    float[] res=new float[cor.length];
    for(int i=0;i<3;i++)
    {
      res[i]=cor[0]*matrix[3*i]+
             cor[1]*matrix[3*i+1]+
             cor[2]*matrix[3*i+2];
    }
    return new Vertex(res);
  }
  /*Vertex multiple4(float[] matrix)
  {
    float[] res=new float[4];
    for(int i=0;i<4;i++)
    {
      res[i]=cor[0]*matrix[4*i]+
             cor[1]*matrix[4*i+1]+
             cor[2]*matrix[4*i+2]+
             cor[3]*matrix[4*i+3];
    }
    return new Vertex(res);
  }*/
  
  void setCord(float... cord)
  {
    cor=cord;
  }
  
  Vertex translateToPerspective()
  {
    float dist=1000, t0=0;
    return new Vertex(
         dist*cor[0]/(cor[2]+t0),
         dist*cor[1]/(cor[2]+t0),0
         );
  }
  Vertex lerpp(Vertex v2)
  {
    Vertex res=new Vertex(0,0,0);
    float z1=abs(cor[2]);
    float z2=abs(v2.cor[2]);
    res.cor[0]=1000*(cor[0]*z2+v2.cor[0]*z1)
               /(z1+z2);
    res.cor[1]=1000*(cor[1]*z2+v2.cor[1]*z1)
               /(z1+z2);
    res.cor[2]=0;
    return res;
  }
}