public class candyType {
  boolean clear(candyList candies, int index) {
    //int comboVERT = 0; 
    int comboHOR = 0;
    float xcor;
    float ycor;
    color comboColor = candies.get(index).clr;

    xcor = candies.get(index).x;
    ycor = candies.get(index).y;
    for (int i = 0; i<5; i++) {
      boolean allSame = true;
      if (candies.get(candies.getCandy(xcor, ycor)).clr == comboColor && allSame) {
        comboHOR++;
      }
      else {
        allSame = false;
      }
      xcor+=candies.INCREMENT;
    }
    return (comboHOR>=3);
    
  }
}
