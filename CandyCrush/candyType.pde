private int[][]board;
public class candyCrush {  
  board = new int[10][10];

}

public class candyType extends candyCrush{
  public void tempBoard() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        board[i][j] = regularCandies();
      }
    }
  }
  
  public int regularCandies() {
    int i = (int)Math.random()*10;
    return i; 
  }
  
  public void clear(){
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        
      }
    }
  }

}
