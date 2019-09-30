void days()
{
  day+=20;
  
  fill(255);
  strokeWeight(3);
  stroke(0);
  rect(20,20,1200,30);
  noStroke();
  fill(0);
  rect(20,20,day,30);
  
  if(day==1200)
  {
    for(Base b1:bases)
    {
      b1.giveMoney();
      if(b1.houses.length!=0)
      {
        for(House h1: b1.houses)
        {
          h1.produce();
        }
      }
    }
    day=0;
  }
}