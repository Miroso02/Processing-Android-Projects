class Dot
{
  float[] cord=new float[3];
  float ampX=0,ampY=0,ampZ=0;
  Dot(){}
  Dot(float[] coord,float aX,float aY,float aZ)
  {
    cord=coord;
    ampX=aX;
    ampY=aY;
    ampZ=aZ;
  }
  Dot(float... coord)
  {
    cord=coord;
  }
  
  Dot multiple(Matrix m)
  {
    float[] res=new float[3];
    float[][] data=m.data;
    res[0]=cord[0]*data[0][0]+
            cord[1]*data[0][1]+
            cord[2]*data[0][2];
    res[1]=cord[0]*data[1][0]+
            cord[1]*data[1][1]+
            cord[2]*data[1][2];
    res[2]=cord[0]*data[2][0]+
            cord[1]*data[2][1]+
            cord[2]*data[2][2];
    return new Dot(res,ampX,ampY,ampZ);
  }
  Dot addd(Dot d)
  {
    float[] res=new float[3];
    res[0]=cord[0]+d.cord[0];
    res[1]=cord[1]+d.cord[1];
    res[2]=cord[2]+d.cord[2];
    return new Dot(res,ampX,ampY,ampZ);
  }
  void setAmp(float... values)
  {
    ampX=values[0];
    ampY=values[1];
    ampZ=values[2];
  }
}