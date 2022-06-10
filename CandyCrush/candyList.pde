public class candyList {
  int points;
  int r;
  int c;
  candy[][] candies;
  PImage[] imagesList;
  color[] colorsList; 
  final int HEIGHT = 840;
  final int WIDTH = 720;
  int INCREMENT;
  float XSTART;
  float YSTART;
  int size;
  int tilesize;

  candyList(int rows, int cols, PImage[] images, color[] colors, int size, float xstart, float ystart, int tilesize) {
    r = rows;
    c = cols;
    this.size = size;
    INCREMENT = size;
    XSTART = xstart;
    YSTART = ystart;
    this.tilesize = tilesize;
    imagesList = images.clone();
    colorsList = colors.clone();
    float ycor = YSTART;
    candies = new candy[r][c];
    
    for (int i = 0; i<r; i++) {
      float xcor = XSTART;
      for (int j = 0; j<c; j++) {
        int randIndex = (int)(Math.random()*images.length);
        candies[i][j] = new candy(xcor, ycor, images[randIndex], colors[randIndex]);
        xcor+=INCREMENT*2;
      }
      ycor+=INCREMENT*2;
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
    int a = INCREMENT;
    for (int r = 0; r < candies.length; r++) {
      for (int c = 0; c < candies[r].length; c++) {
        candies[r][c].display(a);
      }
    }
    clearCol();
  }
  
  
  void clearCol() {
    int combo = 5;
    while (combo>=3) {
      for (int i = 0; i<c; i++) {
        for (int j = 0; j<r-(combo-1); j++) {   
          boolean go = true;
          PImage check = get(j, i).getImage();
          for (int inc = 1; inc<combo; inc++) {
            if (check!=get(j+inc,i).getImage()) {
              go = false;
            }
          }
          if (go) {
            removeCol(j+(combo-1), i, combo);
          }
        }
      }
      combo--;
    }
  }

  void removeCol(int row, int col, int combo) {
    while (row >= combo) {
      candy temp = get(row-combo, col);
      set1(row, col, temp);
      row -= 1;
    }
    while (row <= combo-1 && row >= 0) {
      float x = get(row, col).getX();
      float y = get(row, col).getY();
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(row, col, tem);
      row -= 1;
    }
  }
  
  
  
  //need these functions
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

    while (tempRow1 > 0) {
      candy temp = get(tempRow1-1, col3);
      set1(tempRow1, col3, temp);
      tempRow1 -= 1;
    }
    x = get(tempRow1, col3).getX();
    y = get(tempRow1, col3).getY();
    if (tempRow1 == 0) {
      int randIndex = (int)(Math.random()*imagesList.length);
      candy tem = new candy(x, y, imagesList[randIndex], colorsList[randIndex]);
      set1(tempRow1,col3, tem);
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
    while (row >= 1) {
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

    while (tempRow >= 1) {
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
  
  
  
  
  //Clearing L
  void clearLshape() {
    while (clearLshapeH()) {
      clearLshapeH();
    }
  }
  
  
  boolean clearLshapeH() {
    for (int i = 0; i < r; i ++) {
      for (int j = 0; j +2 < c; j++) {
        if (i + 2 < r) {
          if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
            if (get(i,j).getImage() == get(i+1,j).getImage() && get(i,j).getImage() == get(i+2,j).getImage()) {
               removeRowForThree(i, j , j+1, j+2);
               removeColForTwo(i+2,j);
               return true;
            }
          }
          if (get(i,j+2).getImage() == get(i,j).getImage() && get(i,j+2).getImage() == get(i,j+1).getImage()) {
            if (get(i,j+2).getImage() == get(i+1,j+2).getImage() && get(i,j+2).getImage() == get(i+2,j+2).getImage()) {
               removeRowForThree(i, j, j+1, j+2);
               removeColForTwo(i+2,j+2);
               return true;
            }
          }
        }
        
        if (i - 2 >= 0) {
          if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
            if (get(i,j).getImage() == get(i-1,j).getImage() && get(i,j).getImage() == get(i-2,j).getImage()) {
              removeColForThree(i,j);
              removeRowForTwo(i,j+1, j+2); 
              return true;
            }
          }
          
          if (get(i,j+2).getImage() == get(i,j).getImage() && get(i,j+2).getImage() == get(i,j+1).getImage()) {
            if (get(i,j+2).getImage() == get(i-1,j+2).getImage() && get(i,j+2).getImage() == get(i-2,j+2).getImage()) {
              removeColForThree(i,j+2);
              removeRowForTwo(i,j, j+1);
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  
  //clearing T shape 
  
  void clearTshape() {
    while (clearTshapeH()) {
      clearTshapeH();
    }
  }
  
  boolean clearTshapeH() {
    for (int i = 0; i < r; i ++) {
      for (int j = 0; j < c; j++) {
        if (i + 2 < r && j + 2 < c) {
          if (get(i,j+1).getImage() == get(i,j).getImage() && get(i,j+1).getImage() == get(i,j+2).getImage()) {
            if (get(i,j+1).getImage() == get(i+1,j+1).getImage() && get(i,j+1).getImage() == get(i+2,j+1).getImage()) {
               removeRowForThree(i, j , j+1, j+2);
               removeColForTwo(i+2,j+1);
               return true;
            }
          }
        }
        if (i - 2 >= 0 && j + 2 < c) {
          if (get(i,j+1).getImage() == get(i,j).getImage() && get(i,j+1).getImage() == get(i,j+2).getImage()) {
            if (get(i,j+1).getImage() == get(i-1,j+1).getImage() && get(i,j+1).getImage() == get(i-2,j+1).getImage()) {
              removeRowForThree(i, j , j+1, j+2);
              removeColForTwo(i,j+1);
              return true;
            }
          }
        }
        if (i -1 >= 0 && i+1 <= r && j+2 < c) {
          if (get(i,j).getImage() == get(i,j+1).getImage() && get(i,j).getImage() == get(i,j+2).getImage()) {
            if (get(i,j).getImage() == get(i-1,j).getImage() && get(i,j).getImage() == get(i+1,j).getImage()) {
              removeColForThree(i+1,j);
              removeRowForTwo(i,j+1, j+2); 
              return true;
            }
          }
        }
        if (i -1 >= 0 && i+1 <= r && j+2 < c) {
          if (get(i,j+2).getImage() == get(i,j+1).getImage() && get(i,j+2).getImage() == get(i,j).getImage()) {
            if (get(i,j+2).getImage() == get(i-1,j+2).getImage() && get(i,j+2).getImage() == get(i+1,j+2).getImage()) {
              removeColForThree(i+1,j+2);
              removeRowForTwo(i,j, j+1); 
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  
  
  

  
  
  
  

}
