public static class level {
  static int levelCount;
  int row;
  int col;
  
  int getLevel() {
    return levelCount;
  }
  
  level() {
    if (levelCount >= 0 && levelCount <= 2 ) {
      row = 10;
      col = 10;
    } else {
      row = 15;
      col = 15;
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
