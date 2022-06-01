public class level {
  int levelCount;
  int row;
  int col;
  
  int getLevel() {
    return levelCount;
  }
  
  level() {
    if (levelCount >= 0 && levelCount <= 10 ) {
      row = 10;
      col = 10;
    }
  }
  
  int getRow() {
    return row;
  }

  int getCol() {
    return col;
  }
  
  void increaseLevel() {
    levelCount++;
  }
  
  
}
