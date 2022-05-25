interface board { 
  int[][] board = new int[10][10]; 
}

public class candyCrush implements board{  
  public candyCrush() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        board[i][j] = regularCandies();
      }
    }
  }
  
  public int regularCandies() {
    int i = (int)(Math.random()*5);
    return i; 
  }
  
  void numsToSquares() {
     for (int i = 0; i < 10;i++) {
       for (int j = 0; j < 10;j++) {
         if (board[i][j] == 0) {
           fill(59,40,99);
           square(j*SQUARESIZE, i*SQUARESIZE, SQUARESIZE);
           fill(0);
         } else if (board[i][j] == 1) {
           fill(27,255,99);
           square(j*SQUARESIZE, i*SQUARESIZE, SQUARESIZE);
           fill(0);
         }  else if (board[i][j] == 2) {
           fill(59,88,99);
           square(j*SQUARESIZE, i*SQUARESIZE, SQUARESIZE);
           fill(0);
         }  else if (board[i][j] == 3) {
           fill(0,0,100);
           square(j*SQUARESIZE, i*SQUARESIZE, SQUARESIZE);
           fill(0);
         }  else if (board[i][j] == 4) {
           fill(199,40,99);
           square(j*SQUARESIZE, i*SQUARESIZE, SQUARESIZE);
           fill(0);
         }
       }
     }
  }
  

}
