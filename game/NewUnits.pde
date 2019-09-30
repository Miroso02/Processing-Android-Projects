void newUnit(int x,int y)
{
  if (x<10*s)
  {
    if (moveBlue && x<s || !moveBlue && x>9*s)
    {
      switch(typeUnit)
      {
      case 1:
        l1+=1;
        units[l1]=new Units(int(x/s)*s, int(y/s)*s , l1, byte(80), byte(80), byte(45), byte(10), byte(3), byte(3), byte(1), byte(1), byte(1), byte(1), byte(30), byte(0), byte(3));
        if (!moveBlue)
          units[l1].team=2;
        if (units[l1].team==1)
          moneyB-=units[l1].cost;
        else
          moneyR-=units[l1].cost;
        break;

      case 2:
        l2+=1;
        units[l2]=new Units(int(x/s)*s, int(y/s)*s , l2, byte(30), byte(30), byte(35), byte(5), byte(4), byte(4), byte(1), byte(1), byte(2), byte(1), byte(30), byte(0), byte(3));
        if (!moveBlue)
          units[l2].team=2;
        if (units[l2].team==1)
          moneyB-=units[l2].cost;
        else
          moneyR-=units[l2].cost;
        break;

      case 3:
        l3+=1;
        units[l3]=new Units(int(x/s)*s, int(y/s)*s , l3, byte(100), byte(100), byte(25), byte(20), byte(2), byte(2), byte(1), byte(1), byte(3), byte(1), byte(30), byte(0), byte(3));
        if (!moveBlue)
          units[l3].team=2;
        if (units[l3].team==1)
          moneyB-=units[l3].cost;
        else
          moneyR-=units[l3].cost;
        break;

      case 4:
        l4+=1;
        units[l4]=new Units(int(x/s)*s, int(y/s)*s , l4, byte(70), byte(70), byte(3000), byte(0), byte(50), byte(50), byte(2), byte(2), byte(4), byte(1), byte(30), byte(0), byte(3));
        if (!moveBlue)
          units[l4].team=2;
        if (units[l4].team==1)
          moneyB-=units[l4].cost;
        else
          moneyR-=units[l4].cost;
        break;
      }
      newU=false;
      swords.r=0;
      arch.r=0;
      copit.r=0;
      vsad.r=0;
    }
  }
}
