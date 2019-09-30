void Life() //start
{
  s="В углу комнаты открылась потайная дверь, из которой выпали вода и еда, после чего она закрылась.";
  //text(s,20,30,730,500);
  b1.display(20,415,660,50,"нажать на правую кнопку с надписью «выход»");
  b2.display(20,490,200,50,"попить воды");
  if(eat1==true)b3.display(20,565,180,50,"поесть еды");
  if(drink==false)b4.display(300,495,165,50,"взять воду");
  if(eat==false&&eat1==true)b5.display(300,565,160,50,"взять еду");
  b6.display(20,640,110,50,"ждать");
  if(b1.pressed())rm="exit";
  if(b2.pressed())rm="drink";
  if(b3.pressed()){eat1=false;eat=false;}
  if(b4.pressed())drink=true;
  if(b5.pressed())eat=true;
  if(b6.pressed())time++;
}