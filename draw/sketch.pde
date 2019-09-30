boolean wasP=true;
void setup()
{
  size(displayWidth,displayHeight);
}
void draw()
{
  strokeWeight(20);
  if(mousePressed)
  {
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  else
  wasP=true;
}