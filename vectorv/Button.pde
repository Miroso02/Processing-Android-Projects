class Button
{
  float x;
  float y;
  
  int w;
  int h;
  boolean press;
  
  Button(float xx, float yy, int ww, int hh)
  {
    x = xx;
    y = yy;
    w = ww;
    h = hh;
  }
  void display(String text) {
    color col = color(180, 255, 0);
    if(press) {
      col = color(0, 255, 0);
    }
    stroke(col);
    if(text != "") {
      h = 50;
      fill(col);
      textSize(30);
      textAlign(CENTER);
      text(text, x, y);
      w = int(textWidth(text));
    }
    fill(0, 0);
    strokeWeight(0);
    rect(x, y, w, h);
  }
  
  boolean pressed() {
    boolean res = false;
    if(!mousePressed) {
      if(press) {
        res = true;
      }
      doing = true;
      press = false;
    }
    if(mousePressed) {
      if(mouseX > x - w / 2 
      && mouseX < x + w / 2 
      && mouseY > y - h / 2 
      && mouseY < y + h / 2) {
        if(doing) press = true;
      } else if(press) {
        press = false;
        doing = false;
      }
    }
    return res;
  }
}