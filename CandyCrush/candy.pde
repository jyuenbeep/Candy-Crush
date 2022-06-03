public class candy {
  float x, y;
  color clr;
  PImage c;
  //PImage i;

  public candy (float x, float y, PImage c, color clr) {
    this.x = x;
    this.y = y;
    this.c = c;
    this.clr = clr; 
  }

  void display(PImage img) {
    //fill(clr);
    //circle (x, y, 50.0);
    //i = loadImage(c);
    image(img, x-40, y-40, 80, 80); 
  }

  color getColor() {
    return clr;
  }
  
  void setImage(PImage img) {
    c = img;
  }
  
  PImage getImage() {
    return c;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  //void setColor(color c) {
  //  clr = c;
  //}
  
  void setX(float xvar) {
    x = xvar;
  }
  
  void setY(float yvar) {
    y = yvar;
  }
}
