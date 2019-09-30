Tile[] tiles=new Tile[144];
Button bu,bd,br,bl,restart;
Player player;
boolean doing=true;
void setup()
{
  size(displayWidth,displayWidth);
  player=new Player(0,0,byte(0));
  bu=new Button(1100,400,byte(1));
  bd=new Button(1100,600,byte(2));
  bl=new Button(1000,500,byte(3));
  br=new Button(1200,500,byte(4));
  restart=new Button(1200,0,byte(0));
  newLab();
}
void draw()
{
  background(255);
  player.move();
  for(short i=1;i<tiles.length-1;i++)
  {
    tiles[i].special();
    tiles[i].display();
  }
  player.display();
  bu.display();
  bd.display();
  bl.display();
  br.display();
  restart.display();
  fill(200,180);
  rect(1100,500,60,60);
  if(player.taste==1)
  {
    fill(255,255,0,180);
    ellipse(1130,530,30,30);
  }
  if(player.taste==2)
  {
    fill(255,100,0,180);
    ellipse(1130,530,30,30);
  }
  if(restart.pressed())
  setup();
}