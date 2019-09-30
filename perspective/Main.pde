float t=0, nn=10;
Matrix m=new Matrix(),n=new Matrix(),k=new Matrix();
Model ob1;
void setup()
{
  background(100);
  size(displayWidth, displayHeight);
  ob1=new Model(new Dot(200,-200,200),
                 new Dot(200,200,500),
                 new Dot(-200,200,500),
                 new Dot(-200,-200,200)
                 );
}
void draw()
{
  m.setData(cos(t/nn),-sin(t/nn), 0,
            sin(t/nn),cos(t/nn),0,
            0,        0,         1);
  n.setData(cos(t/nn),0, sin(t/nn),
            0,        1,         0,
            -sin(t/nn),0,cos(t/nn));
  k.setData(1,        0,         0,
            0,cos(t/nn),-sin(t/nn),
            0,sin(t/nn), cos(t/nn));
  translate(displayWidth/2,displayHeight/2);
  //background(100);
  
  ob1.display();
  ob1.rotat();
  t++;
}