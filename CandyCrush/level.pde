public static class level {
  static int levelCount = 0;
  int row;
  int col;
  int goal1;
  int goal2;
  int goal3;
  int moves;
  
  public level() {
    if (levelCount >= 0 && levelCount <= 2 ) {
      row = 8;
      col = 10;
    } else {
      row = 15;
      col = 15;
    }
    setGoal();
    setMoves();
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
  
  void setGoal(){
    if (levelCount >= 0 && levelCount <= 2) {
      goal1 = (int)(Math.random()*5)+1;
      goal2 = (int)(Math.random()*5)+1;
      goal3 = (int)(Math.random()*5)+1;
    }
  }
  
  void setMoves(){
    if (levelCount >= 0 && levelCount <= 2) {
      moves = 5;
    }
  }
  
  void reset() {
    setGoal();
    setMoves();
  }
  
}
