
<<<<<<< HEAD
=======
//public class candyType {

//public class candyCrush { 
//  public int[][] board;
//  public candyCrush() {
//    board = new int[10][10];
//  }
//}

//public class candyType extends candyCrush{
//  public void CandyType() {
//    for (int i = 0; i < 10; i++) {
//      for (int j = 0; j < 10; j++) {
//        board[i][j] = regularCandies();
//      }
//    }
//    clear();
//  }
  
//  public int regularCandies() {
//    int i = (int)Math.random()*5;
//    return i; 
//  }
  
//  public void clear(){
//    for (int i = 0; i < 10; i++) {
//      for (int j = 0; j < 10; j++) {
//        while (j - 1 >= 0 && j+1 <= board.length) {
//          if (board[i][j-1] ==  board[i][j] && board[i][j+1] ==  board[i][j]) {
//            board[i][j] = -1;
//            board[i][j-1] = -1;
//            board[i][j+1] = -1;
//        }
//      }
//     }
//    }
//  }

public class candyCrush { 
  private int[][] board;
  private int[][] colors;
  public candyCrush() {
    board = new int[7][7];
    colors = new int[][] {{5, 33, 77}, {99, 180, 50}, {180, 33, 100}, {255, 120, 7}};
    setBoard();
    display();
  }
  
  public int regularCandies() {
    int i = (int)(Math.random()*4);
    return i;
  }
  
  void setBoard() {
    for (int i = 0; i < 7; i ++) {
      for (int j = 0; j < 7; j ++) {
        board[i][j] = regularCandies();
      }
    }
  }
  
  void display(){
    int a = 0;
    int b = 0;
    for (int i = 100; a < 7 && i < width; i += 100, a++) {
      for (int j = 100; b < 7 && j < height; j += 100, b++) {
        int k = board[a][b];
        int[] temp = colors[k];
        circle(i, j, 100);
        fill(temp[0], temp[1], temp[2]);
      }
    }
  }

  
//}


//public class candyCrush implements candyType{ 
//  private int[][] board;
//  public candyCrush() {
//    board = new int[10][10];
//  }
//}


  
}
>>>>>>> 9e6c95fcb243edff9c670a0dc99f0519233b500e
