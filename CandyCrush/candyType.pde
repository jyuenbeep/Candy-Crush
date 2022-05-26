public class candyCrush {  
  public candyCrush() {
    
  }
  
  public int[] regularCandies() {
    int[][] col = {{55, 33, 77}, {99, 180, 50}, {180, 33, 100}, {255, 120, 7}}; 
    int i = (int)(Math.random()*col.length);
    return col[i]; 
  }
  
  void display(){
    for (int i = 100; i < width; i += 100) {
      for (int j = 100; j < height; j += 100) {
        circle(i, j, 100);
        int[] temp = regularCandies();
        fill(temp[0], temp[1], temp[2]);
      }
    }
  }
  
}
