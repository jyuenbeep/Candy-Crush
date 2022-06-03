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
  final float XSTART = 90;
  final float YSTART = 140;

  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};

  candyList(int rows, int cols) {
    
    r = rows;
    c = cols;
    
    float ycor = YSTART;
    candies = new candy[rows][cols];
    
    for (int r = 0; r <rows; r++) {
      float xcor = XSTART-80;
      for (int c = 0; c <cols; c++) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies[r][c] = new candy(xcor, ycor, rand);
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
  

  void removeRowForThree(int row, int col1, int col2, int col3) {
    int tempRow = row;
    int tempRow1 = row;
    while (row > 0) {
      candy temp = get(row-1, col1);
      set1(row, col1, temp);
      row -= 1;
    }
    float x = get(row, col1).getX();
    float y = get(row, col1).getY();
    if (row == 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(row,col1, tem);
    }

    while (tempRow > 0) {
      candy temp = get(tempRow-1, col2);
      set1(tempRow, col2, temp);
      tempRow -= 1;
    }
    x = get(tempRow, col2).getX();
    y = get(tempRow, col2).getY();
    if (tempRow == 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(tempRow,col2, tem);
    }

    while (tempRow1 > 0) {
      candy temp = get(tempRow1-1, col3);
      set1(tempRow1, col3, temp);
      tempRow1 -= 1;
    }
    x = get(tempRow1, col3).getX();
    y = get(tempRow1, col3).getY();
    if (tempRow1 == 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(tempRow1,col3, tem);
    }
  }

  void clearRowForThree() {
    //int count = 0;
    while (clearRowForThreeH()) {
      //count++;
      clearRowForThreeH();
    }
    //if (count>=1) {
    //  points+=100;
    //} 
  }

  boolean clearRowForThreeH() {
    for (int i = 0; i < r; i ++) {
      for (int j = 0; j < c - 2; j++) {
        if (get(i,j).getColor() == get(i,j+1).getColor() && get(i,j).getColor() == get(i,j+2).getColor()) {
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
        if (get(j,i).getColor() == get (j+1,i).getColor() && get(j,i).getColor() == get (j+2,i).getColor()) {
          removeColForThree(j+2,i);
          return true;
        }
      }
    }
    return false;
  }

  void removeColForThree(int row, int col) {
    while (row >= 3) {
      candy temp = get(row-3, col);
      set1(row , col, temp);
      row -= 1;
    }
    while (row <= 2 && row >= 0) {
      float x = get(row, col).getX();
      float y = get(row, col).getY();
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candy tem = new candy(x, y, rand);
      set1(row, col, tem);
      row -= 1;
    }
  }

  
  
  
  

}
