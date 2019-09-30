void opponent()
{
  newU=true;
  typeUnit=1;
  cursor.x=9*s;
  boolean[] house={true,true,true,true,true,true};
  cursor.y=place(house);
  if(moneyR>=30)
  newUnit(cursor.x+1,cursor.y);
  moveBlue=true;
  next.b=255;
  next.r=0;
}