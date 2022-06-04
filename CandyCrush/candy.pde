public class candy {
  float x, y;
  color clr;
  PImage c;

<<<<<<< HEAD
  public candy(float x, float y, color clr) {
=======
  public candy (float x, float y, PImage c, color clr) {
>>>>>>> jasmine
    this.x = x;
    this.y = y;
    this.c = c;
    this.clr = clr; 
  }

  void display() {
    image(c, x-40, y-40, 80, 80); 
  }

  color getColor() {
    return clr;
  }
  
  void setColor(color clr) {
    this.clr = clr;
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
  
  void setX(float xvar) {
    x = xvar;
  }
  
  void setY(float yvar) {
    y = yvar;
  }
}
