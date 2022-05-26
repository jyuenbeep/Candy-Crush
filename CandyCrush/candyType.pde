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
    for (int i = 200, a = 0; a < 7 && i < width; i += 100, a++) {
      for (int j = 100, b= 0; b < 7 && j < height; j += 100, b++) {
        int k = board[a][b];
        int[] temp = colors[k];
        circle(i, j, 100);
        fill(temp[0], temp[1], temp[2]);
      }
    }
  }
  
  


  
}
