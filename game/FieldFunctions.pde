byte win()
{
  byte n=0,team=0;
  for(byte i=0;i<houses.length;i++)
  {
    if(houses[i].team==1)
    n++;
    else if(houses[i].team==2)
    n--;
    if(n==8)
    {
      team=1;
    }
    if(n==-8)
    {
      team=2;
    }
  }
  return team;
}
void field()
{
  stroke(0);
  for(int i=s;i<=10*s;i+=s)
  line(i,0,i,8*s);
  for(int i=s;i<=8*s;i+=s)
  line(0,i,10*s,i);
  cursor.display();
  next.display();
  swords.display();
  arch.display();
  copit.display();
  vsad.display();
}