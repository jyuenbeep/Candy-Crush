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
    int i = (int)Math.random()*5;
    return i; 
  }
  
  void display() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (board[i][j] == 2) {
           rect(i*10,j*10,10,10); 
        }
      }
    }
  }
  

}
