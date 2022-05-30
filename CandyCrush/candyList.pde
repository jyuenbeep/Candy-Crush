public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  int points;

  ArrayList<candy> candies;

  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};

  candyList(int total) {
    int xcor = 90;
    int ycor = 140;
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(new candy(xcor, ycor, rand));
      if (xcor+80<840) {
        xcor+=80;
      } else if (ycor+80 < 720) {
        xcor=90; 
        ycor+=80;
      }
    }
    points = 0;
  }

  void set(int index, candy c) {
    candies.set(index, c);
  }

  void set1(int index, candy c) {
    candies.get(index).setColor(c.getColor());
  }

  void add(int index, candy c) {
    candies.get(index).setColor(c.getColor());
  }

  candy get(int index) {
    return candies.get(index);
  }

  int size() {
    return candies.size();
  }

  void display() {
    for (int i = 0; i < candies.size(); i++) {
      candies.get(i).display();
    }
    //delay(5000);
    clearRowForThree();
  }

  void removeRowForThree(int a, int b, int c) {
    while (a >= 10) {
      candy temp = get(a-10);
      set1(a, temp);
      a -= 10;
    }
    float x = get(a).getX();
    float y = get(a).getY();
    if (a <= 9 && a >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      add(a, tem);
    }

    while (b >= 10) {
      candy temp = get(b-10);
      set1(b, temp);
      b -= 10;
    }
    x = get(b).getX();
    y = get(b).getY();
    if (b <= 9 && b >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      add(b, tem);
    }

    while (c >= 10) {
      candy temp = get(c-10);
      set1(c, temp);
      c -= 10;
    }
    x = get(c).getX();
    y = get(c).getY();
    if (c <= 9 && c >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      add(c, tem);
    }
  }

  void clearRowForThree() {
    while (clearRowForThreeH()) {
      clearRowForThreeH();
    }
  }

  boolean clearRowForThreeH() {
    for (int i = 79; i >= 2; i--) { 
      if (i % 10 != 0 && i - 1 % 10 != 0 && get(i).getColor() == get(i-1).getColor() && get(i).getColor() == get(i-2).getColor() ) {
        removeRowForThree(i, i-1, i-2);
        return true;
      }
    }
    return false;
  }
}
