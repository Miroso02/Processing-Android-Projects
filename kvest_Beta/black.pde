void Black() //start/exit/tonel/toonel
{
  s="Вы поползли в темноту. Но неожыданно нащупали что дальше пропасть.";
  s+="Внизу виднеется тусклый свет.";
  //text(s,20,30,730,500);
  b1.display(20,500,200,50,"прыгнуть туда");
  b2.display(20,600,240,50,"вернуться обратно");
  if(b1.pressed())rm="fall";
  if(b2.pressed())rm="toonel";
}