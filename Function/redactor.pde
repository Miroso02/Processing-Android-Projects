Button[] speed=new Button[4];
Button continueTraectory;
Button drawTraectory;
Button show;
Button changeTraectory;
void redactor()
{
  for(int i=0;i<speed.length;i++)
  {
    speed[i].doAll();
  }
  continueTraectory.doAll();
  drawTraectory.doAll();
  fill(255,255,0);
  textAlign(LEFT);
  text("SPEED: "+a.speed, 520, 100);
} 