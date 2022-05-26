public class candyCrush { 
  public int[][] board;
  public int[][] colors;
  public candyCrush() {
    board = new int[7][7];
    colors = new int[][] {{55, 33, 77}, {99, 180, 50}, {180, 33, 100}, {255, 120, 7}}; 
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
  

  
}
