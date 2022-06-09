public static class level {
  static int levelCount = 0;
  int row;
  int col;
  int goal1;
  int goal2;
  int goal3;
  int moves;
  int size;
  
  public level() {
    if (levelCount >= 0 && levelCount <= 2 ) {
      row = 8;
      col = 10;
    } else {
      row = 11;
      col = 14;
    }
    setGoal();
    setMoves();
    setSize();
  }
  
  
  int getLevel() {
    return levelCount;
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
  
  void setSize() {
    if (levelCount >= 0 && levelCount <= 2 ) {
      size = 80;
    } else {
      size = 100; 
    }
  }
  
  float getXstart() {
     if (levelCount >= 0 && levelCount <= 2 ) {
      return 80;
    } else {
      return 0; 
    }
  }
  
  float getYstart() {
     if (levelCount >= 0 && levelCount <= 2 ) {
      return 140;
    } else {
      return 0; 
    }
  }
  
  int getTilesize(){
    if (levelCount >= 0 && levelCount <= 2 ) {
      return 80;
    } else {
      return 0; 
    }
  }
  
  
  

}
