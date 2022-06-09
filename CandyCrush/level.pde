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
    if (levelCount >= 0 && levelCount < 3 ) {
      row = 4;
      col = 5;
    } else if (levelCount >= 3 && levelCount < 7)  {
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
      goal1 = (int)(Math.random()*3)+1;
      goal2 = (int)(Math.random()*2)+1;
      goal3 = (int)(Math.random()*1)+1;
    } else if (levelCount >= 3 && levelCount < 7) {
      goal1 = (int)(Math.random()*7)+1;
      goal2 = (int)(Math.random()*8)+1;
      goal3 = (int)(Math.random()*9)+1;
    } else {
      goal1 = (int)(Math.random()*5)+1;
      goal2 = (int)(Math.random()*10)+1;
      goal3 = (int)(Math.random()*14)+1;
    }
  }
  
  void setMoves(){
    if (levelCount >= 0 && levelCount <= 2) {
      moves = 5;
    } else if (levelCount >= 3 && levelCount < 7) {
      moves = 15;
    } else {
      moves = 25;
    }
  }
  
  //void reset() {
  //  setGoal();
  //  setMoves();
  //}
  
  void setSize() {
    if (levelCount >= 0 && levelCount < 3 ) {
      size = 140;
    } else if (levelCount >= 3 && levelCount < 7 ) {
      size = 80; 
    } else {
      size = 60;
    }
  }
  
  float getXstart() {
     if (levelCount >= 0 && levelCount <= 2 ) {
      return 110;
    } else  if (levelCount >= 3 && levelCount < 7) {
      return 80; 
    } else {
      return 70;
    }
  }
  
  float getYstart() {
     if (levelCount >= 0 && levelCount <= 2 ) {
      return 170;
    } else if (levelCount >= 3 && levelCount < 7) {
      return 140; 
    } else {
      return 130;
    }
  }
  
  int getTilesize(){
    if (levelCount >= 0 && levelCount <= 2 ) {
      return 140;
    } else if (levelCount >= 3 && levelCount < 7) {
      return 80; 
    } else {
      return 80;
    }
  }
  
  
  

}
