public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  final int INCREMENT = 80; 
  final int XSTART = 90;
  final int YSTART = 140;

  ArrayList<candy> candies;
  int points; 

  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};
  
  int getCandy(float x, float y) {
  for (int i = 0; i < candies.size(); i++) {
    float distStore = dist(x, y, candies.get(i).x, candies.get(i).y);
    if (distStore < 25) {
      return i;
    }
  }
  return -1;
}

  candyList(int total) {
    int xcor = XSTART;
    int ycor = YSTART;
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(new candy(xcor, ycor, rand));
      if (xcor+INCREMENT<920) {
        xcor+=INCREMENT;
      } else {
        xcor=XSTART; 
        ycor+=INCREMENT;
      }
    }
    points = 0; 
  }

  candy set(int index, candy c) {
    return candies.set(index, c);
  }

  candy get(int index) {
    return candies.get(index);
  }

  int size() {
    return candies.size();
  }

  void display() {
    for (int i = 0; i<candies.size(); i++) {
      candies.get(i).display();
    }
  }

  //void clear(int c) {
  //  if (c-1 >= 0 && c+1 <= 10) {
  //    if (candies.get(c).getColor() == candies.get(c-1).getColor() && candies.get(c).getColor() == candies.get(c+1).getColor()) {
  //      candies.set(c, new candy(candies.get(c).x, candies.get(c).y, 25));
  //      candies.set(c-1, new candy(candies.get(c-1).x, candies.get(c-1).y, 25));
  //      candies.set(c+1, new candy(candies.get(c+1).x, candies.get(c+1).y, 25));
  //    }
  //  }
  //}
  
  boolean clear(candyList candies, int index) {
    //int comboVERT = 0; 
    int comboHOR = 0;
    float xcor;
    float ycor;
    color comboColor = get(index).clr;

    xcor = get(index).x;
    ycor = get(index).y;
    for (int i = 0; i<5; i++) {
      boolean allSame = true;
      if (get(getCandy(xcor, ycor)).clr == comboColor && allSame) {
        comboHOR++;
      }
      else {
        allSame = false;
      }
      xcor+=INCREMENT;
    }
    return (comboHOR>=3);
  }
}
