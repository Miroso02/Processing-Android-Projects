class Dot0
{
  float x=0,y=0,z=0;
  float ampX=0,ampY=0,ampZ=0;
  Dot0(){}
  Dot0(float... coord)
  {
    x=coord[0];
    y=coord[1];
    z=coord[2];
  }
  void setAmp(float... values)
  {
    ampX=values[0];
    ampY=values[1];
    ampZ=values[2];
  }
}