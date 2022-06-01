public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  int points;
  int r;
  int c;

  candy[][] candies;

  final int HEIGHT = 840;
  final int WIDTH = 720;
  final int INCREMENT = 80;
  final int XSTART = 90;
  final int YSTART = 140;

  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};

  candyList(int rows, int cols) {
    
    r = rows;
    c = cols;
    
    int ycor = YSTART;
    candies = new candy[rows][cols];
    
    for (int r = 0; r<rows; r++) {
      xcor=XSTART;
      for (int c = 0; c<cols; c++) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies[r][c].setColor(rand);
        //
        xcor+=INCREMENT;
        candies[r][c].setX(xcor);
        candies[r][c].setY(ycor);
        //
      }
      ycor+=INCREMENT;
    }
    
    points = 0;
    
  }

  void set(int row, int col, candy c) {
    candies[row][col] = c;
  }

  void set1(int row, int col, candy c) {
    candies[row][col].setColor(c.getColor());
  }

  candy get(int row, int col) {
    return candies[row][col];
  }

  void display() {
    for (int r = 0; r < candies.length; r++) {
      for (int c = 0; c < candies[r].length; c++) {
        candies[r][c].display();
      }
    }
    clearRowForThree();
    clearColForThree();
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
    int count = 0;
    while (clearRowForThreeH()) {
      count++;
      clearRowForThreeH();
    }
    if (count>=1) {
      points+=100;
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




  void clearColForThree() {
    while (clearColForThreeH()) {
      clearColForThreeH();
    }
  }

  boolean clearColForThreeH() {
    for (int i = 79; i > 19; i--) { 
      if  (get(i).getColor() == get(i-10).getColor() && get(i).getColor() == get(i-20).getColor() ) {
        removeColForThree(i, i-10, i-20);
        return true;
      }
    }
    return false;
  }

  void removeColForThree(int a, int b, int c) {
    while (a >= 30) {
      candy temp = get(a-30);
      set1(a, temp);
      a -= 10;
    }
    while (a <= 29 && a >= 0) {
      float x = get(a).getX();
      float y = get(a).getY();
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      add(a, tem);
      set1(a, tem);
      a -= 10;
    }
  }
}
