public class candyList {
  int points;
  int r;
  int c;
  candy[][] candies;
  PImage[] imagesList;
  color[] colorsList; 
  final int HEIGHT = 840;
  final int WIDTH = 720;
  final int INCREMENT = 80;
  final float XSTART = 90;
  final float YSTART = 140;

  candyList(int rows, int cols, PImage[] images, color[] colors) {
    
    r = rows;
    c = cols;
    imagesList = images.clone();
    colorsList = colors.clone(); 

    float ycor = YSTART;
    candies = new candy[r][c];
    
    for (int i = 0; i<rows; i++) {
      float xcor = XSTART;
      for (int j = 0; j<cols; j++) {
        int randIndex = (int)(Math.random()*images.length);
        candies[i][j] = new candy(xcor, ycor, images[randIndex], colors[randIndex]);
        xcor+=INCREMENT;
      }
      ycor+=INCREMENT;
    } 
    points = 0;   
  }

  void set(int row, int col, candy c) {
    candies[row][col] = c;
  }

  void set1(int row, int col, candy c) {
    candies[row][col].setImage(c.getImage());
  }
  
  void swapCandies(int x1, int y1, int x2, int y2) {
    PImage tempImage = candies[x1][y1].getImage();
    color tempColor = candies[x1][y1].getColor(); 
    candies[x1][y1].setImage(candies[x2][y2].getImage());
    candies[x1][y1].setColor(candies[x2][y2].getColor());
    candies[x2][y2].setImage(tempImage);
    candies[x2][y2].setColor(tempColor);
  }

  candy get(int row, int col) {
    return candies[row][col];
  }

  void display() {
    for (int i = 0; i<r; i++) {
      for (int j = 0; j<c; j++) {
        candies[i][j].display();
      }
    }
    clearLshape();
    clearLshape1();
    clearLshape2();
    clearLshape3();
    clearRowForThree();
    clearColForThree();
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
    if (row == 0) {
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(row,col1, tem);
    }

    while (tempRow >= 10) {
      candy temp = get(tempRow-10, col2);
      set1(tempRow, col2, temp);
      tempRow -= 10;
    }
    x = get(tempRow, col2).getX();
    y = get(tempRow, col2).getY();
    if (tempRow == 0) {
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(tempRow,col2, tem);
    }

    while (tempRow1 >= 10) {
      candy temp = get(tempRow1-10, col3);
      set1(tempRow1, col3, temp);
      tempRow1 -= 10;
    }
    x = get(tempRow1, col3).getX();
    y = get(tempRow1, col3).getY();
    if (tempRow1 == 0) {
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
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
        if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
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
        if (get(j,i).getImage() == get (j+1,i).getImage() && get(j,i).getImage() == get(j+2,i).getImage()) {
          removeColForThree(j+2,i);
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
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(row1, col, tem);
      row1 -= 10;
    }
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
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(row,col, tem);
      row -= 1;
    }
  }
  
  void removeColForTwo(int row, int col) {
    while (row >= 2) {
      candy temp = get(row-2, col);
      set1(row , col, temp);
      row -= 1;
    }
    while (row <= 1 && row >= 0) {
      float x = get(row, col).getX();
      float y = get(row, col).getY();
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(row, col, tem);
      row -= 1;
    }
  }
  
  
  void removeRowForTwo(int row, int col1, int col2) {
    int tempRow = row;
    while (row > 0) {
      candy temp = get(row-1, col1);
      set1(row, col1, temp);
      row -= 1;
    }
    float x = get(row, col1).getX();
    float y = get(row, col1).getY();
    if (row == 0) {
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
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
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(tempRow,col2, tem);
    }
  }
  
  
  
  
  //Clearing upside down L & T
  void clearLshape() {
    while (clearLshapeH()) {
      clearLshapeH();
    }
  }
  
  boolean clearLshapeH() {
    for (int i = 0; i < r-2; i ++) {
      for (int j = 0; j < c-2; j++) {
        if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
          if (get(i,j).getImage() == get(i+1,j).getImage() && get(i,j).getImage() == get(i+2,j).getImage()) {
            removeRowForThree(i,j,j+1,j+2);
            removeColForTwo(i+2,j);
            return true;
           } else if (get(i,j+1).getImage() == get(i+1,j+1).getImage() && get(i,j+1).getImage() == get(i+2,j+1).getImage()) {
            removeRowForThree(i,j,j+1,j+2);
            removeColForTwo(i+2,j+1);
            return true;
           } else if (get(i,j+2).getImage() == get(i+1,j+2).getImage() && get(i,j).getImage() == get(i+2,j+2).getImage()) {
            removeRowForThree(i,j,j+1,j+2);
            removeColForTwo(i+2,j+2);
            return true;
          }  
        }
      }
    }
    return false;
  }
  
  
  
  //Clearing L & upside T 
  void clearLshape1() {
    while (clearLshapeH1()) {
      clearLshapeH1();
    }
  }
  
  boolean clearLshapeH1() {
    for (int i = 0; i < r; i++) {
      for (int j = 0; j < c-2; j++) {
        if (i-2 >= 0) {
           if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
             if (get(i,j).getImage() == get(i-1,j).getImage() && get(i,j).getImage() == get(i-2,j).getImage()) {
              removeRowForThree(i,j,j+1,j+2);
              removeColForTwo(i,j);
              return true;
             } else if (get(i,j+1).getImage() == get(i-1,j+1).getImage() && get(i,j+1).getImage() == get(i-2,j+1).getImage()) {
              removeRowForThree(i,j,j+1,j+2);
              removeColForTwo(i,j-1);
              return true;
             } else if (get(i,j+2).getImage() == get(i-1,j+2).getImage() && get(i,j+2).getImage() == get(i-2,j-2).getImage()) {
              removeRowForThree(i,j,j+1,j+2);
              removeColForTwo(i,j-2);
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  

  //clearing right side L/T
    void clearLshape2() {
    while (clearLshapeH2()) {
      clearLshapeH2();
    }
  }
  
  boolean clearLshapeH2() {
    for (int i = 0; i < r-2; i++) {
      for (int j = 0; j < c-2; j++) {
         if (get(i,j).getImage() == get(i+1,j).getImage() && get(i,j).getImage() == get(i+2,j).getImage()) {
           if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
            removeColForThree(i+2,j);
            removeRowForTwo(i,j+1,j+2);
            return true;
           } else if (get(i+1,j).getImage() == get(i+1,j+1).getImage() && get(i+1,j).getImage() == get(i+1,j+2).getImage()) {
            removeColForThree(i+2,j);
            removeRowForTwo(i+1,j+1,j+2);
            return true;
           } else if (get(i+2,j).getImage() == get(i+2,j+1).getImage() && get(i+2,j).getImage() == get(i+2,j+2).getImage()) {
            removeColForThree(i+2,j);
            removeRowForTwo(i+2,j+1,j+2);
            return true;
          }
        }    
      }
    }
    return false;
  }
  
  
  
  //clearing left side L/T
  void clearLshape3() {
    while (clearLshapeH3()) {
      clearLshapeH3();
    }
  }
  
  boolean clearLshapeH3() {
    for (int i = 0; i < r-2; i++) {
      for (int j = 0; j < c; j++) {
        if (j-2 >= 0) {
          if (get(i,j).getImage() == get(i+1,j).getImage() && get(i,j).getImage() == get(i+2,j).getImage()) {
             if (get(i,j).getImage() == get(i,j-1).getImage() && get(i,j).getImage() == get(i,j-2).getImage()) {
              removeColForThree(i+2,j);
              removeRowForTwo(i,j-1,j-2);
              return true;
             } else if (get(i+1,j).getImage() == get(i+1,j-1).getImage() && get(i+1,j).getImage() == get(i+1,j-2).getImage()) {
              removeColForThree(i+2,j);
              removeRowForTwo(i+1,j-1,j-2);
              return true;
             } else if (get(i+2,j).getImage() == get(i+2,j-1).getImage() && get(i+2,j).getImage() == get(i+2,j-2).getImage()) {
              removeColForThree(i+2,j);
              removeRowForTwo(i+2,j-1,j-2);
              return true;
            }
          } 
        }     
      }
    }
    return false;
  }
  
  
  
  

}
