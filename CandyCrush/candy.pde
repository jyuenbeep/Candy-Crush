public class candy {
  float x, y;
  color clr;
  PImage c;

  public candy(float x, float y, PImage c, color clr) {
    this.x = x;
    this.y = y;
    this.clr = clr;
    this.c =c;
  }

  void display(int increment) {
    image(c, x-increment, y-increment);
    
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
