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
    
    for (int i = 0; i<rows; i++) {
      xcor=XSTART;
      for (int j = 0; j<cols; j++) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies[i][j].setColor(rand);
        //
        xcor+=INCREMENT;
        candies[i][j].setX(xcor);
        candies[i][j].setY(ycor);
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
  
  //void add(int row, int col, candy c) {
  //  candies[row][col].setColor(c.getColor());
  //}

  candy get(int row, int col) {
    return candies[row][col];
  }

  void display() {
    for (int r = 0; r < candies.length; r++) {
      for (int c = 0; c < candies[r].length; c++) {
        candies[r][c].display();
      }
    }
    //clearRowForThree();
    //clearColForThree();
  }







  void removeRowForThree(int row, int col1, int col2, int col3) {
    int tempRow = row;
    int tempRow1 = row;
    while (row >= 10) {
      candy temp = get(row-10, col1);
      set1(row, col1, temp);
      row -= 10;
    }
    float x = get(row, col1).getX();
    float y = get(row, col1).getY();
    if (row <= 9 && row >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(row,col1, tem);
    }

    while (tempRow >= 10) {
      candy temp = get(tempRow-10, col2);
      set1(tempRow, col2, temp);
      tempRow -= 10;
    }
    x = get(tempRow, col2).getX();
    y = get(tempRow, col2).getY();
    if (tempRow <= 9 && tempRow >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(tempRow,col2, tem);
    }

    while (tempRow1 >= 10) {
      candy temp = get(tempRow1-10, col3);
      set1(tempRow1, col3, temp);
      tempRow1 -= 10;
    }
    x = get(tempRow1, col3).getX();
    y = get(tempRow1, col3).getY();
    if (tempRow1 <= 9 && tempRow1 >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(tempRow1,col3, tem);
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
    for (int i = 0; i < r; i ++) {
      for (int j = 0; j < c - 2; j++) {
        if (get(i,j) == get (i,j+1) && get(i,j) == get (i,j+2)) {
          removeRowForThree(i,j,j+1,j+2);
          return true;
        }
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
    for (int i = 0; i < c; i ++) {
      for (int j = 0; j < r - 2; j++) {
        if (get(i,j) == get (i+1,j) && get(i,j) == get (i+2,j)) {
          removeColForThree(i,j+2,j+1,j);
          return true;
        }
      }
    }
    return false;
  }

  void removeColForThree(int col, int row1, int row2, int row3) {
    while (row1 >= 30) {
      candy temp = get(row1-30, col);
      set1(row1, col, temp);
      row1 -= 10;
    }
    while (row1 <= 29 && row1 >= 0) {
      float x = get(row1, col).getX();
      float y = get(row1, col).getY();
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(row1, col, tem);
      row1 -= 10;
    }
  }

  
  //void removeColForThree(int a, int b) {
  //  while (a >= 20) {
  //    candy temp = get(a-20);
  //    set1(a, temp);
  //    a -= 10;
  //  }
  //  while (a <= 19 && a >= 0) {
  //    float x = get(a).getX();
  //    float y = get(a).getY();
  //    color rand = colorsToChoose[(int)(Math.random()*4)];
  //    candy tem = new candy(x, y, rand);
  //    add(a, tem);
  //    set1(a, tem);
  //    a -= 10;
  //  }
  //}
  
  
  

}
