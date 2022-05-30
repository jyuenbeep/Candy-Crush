public class candy {
  float x, y;
  color clr;

  public candy (float x, float y, color clr) {
    this.x = x;
    this.y = y;
    this.clr = clr;
  }

  void display() {
    fill(clr);
    circle (x, y, 50.0);
  }

  color getColor() {
    return clr;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setColor(color c) {
    clr = c;
  }
}
