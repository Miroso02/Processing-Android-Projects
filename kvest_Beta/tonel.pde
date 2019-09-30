void Tonel() //start/exit
{
  s="Стены остановились, после чего в одной из сторон открылась потайная дверь: что там - неизвестно. ";
  if(ss==false)s+="Ничего не произошло.";
  //text(s,20,30,730,500);
  b1.display(20,500,150,50,"идти туда");
  b2.display(20,600,350,50,"нажать ещё раз кнопку");
  if(b2.pressed()&&ss==true)ss=false;
  if(b1.pressed()){ss=true;rm="toonel";ss=true;}
}