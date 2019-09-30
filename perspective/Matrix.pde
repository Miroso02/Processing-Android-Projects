class Matrix
{
  float[][] data=new float[3][3];
  
  Matrix()
  {}
  void setData(float[][] a)
  {
    data=a;
  }
  void setData(float... args)
  {
    for(int i=0;i<3;i++)
    {
      for(int a=0;a<3;a++)
      {
        data[i][a]=args[3*i+a];
      }
    }
  }
}