public static class level {
  static int levelCount = 0;
  int row;
  int col;
  
  public level() {
    if (levelCount >= 0 && levelCount <= 2 ) {
      row = 8;
      col = 10;
    } else {
      row = 15;
      col = 15;
    }
  }
  
  
  int getLevel() {
    return levelCount;
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
