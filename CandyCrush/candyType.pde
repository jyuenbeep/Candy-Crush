
public class candyCrush { 
  public int[][] board;
  public candyCrush() {
    board = new int[10][10];
  }
}

public class candyType extends candyCrush{
  public void CandyType() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        board[i][j] = regularCandies();
      }
    }
    clear();
  }
  
  public int regularCandies() {
    int i = (int)Math.random()*5;
    return i; 
  }
  
  public void clear(){
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        while (j - 1 >= 0 && j+1 <= board.length) {
          if (board[i][j-1] ==  board[i][j] && board[i][j+1] ==  board[i][j]) {
            board[i][j] = -1;
            board[i][j-1] = -1;
            board[i][j+1] = -1;
        }
      }
     }
    }
  }
  

}
