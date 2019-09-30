Button[] menuButtons=new Button[5];
void menu()
{
  background(255);
  
  //menuButtons[0].display("Levels");
  
  menuButtons[1].display("Arcade");
 // menuButtons[2].display("Seetings");
  //menuButtons[3].display("Records");
 // menuButtons[4].display("Exit");
  
  if(menuButtons[1].pressed())
  {
    menu=false;
    death=true;
  }
}