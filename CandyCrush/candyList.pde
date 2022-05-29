public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  
  ArrayList<candy> candies;
  
  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};
  
  candyList(int total) {
    int xcor = 90;
    int ycor = 140;
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(new candy(xcor, ycor, rand));
      if (xcor+80<920) {
        xcor+=80;
      }
      else if (ycor+80 < 720) {
        xcor=90; 
        ycor+=80;
      }
    }
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
  
  void remove(int a, int b, int c) {
    candies.remove(a);
    candies.remove(b);
    candies.remove(c);
    if (a - 11 >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(a-11,new candy(xcor, ycor, rand));
    }
    if (b - 11 >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(b-11,new candy(xcor, ycor, rand));
    }
    if (c - 11 >= 0) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(c-11,new candy(xcor, ycor, rand));
    }
    display();
  }
  
  void clear() {
    for (int i = 0; i < candies.size()-3;i++) {
      if (i % 10 != 0 && i % 9 != 0 && candies.get(i).getColor() == candies.get(i+1).getColor() && candies.get(i+1).getColor() == candies.get(i+2).getColor() ) {
        remove(i,i+1,i+2);
      }
    }
  }
  
  boolean tripleChecker(){
    for (int i = 0; i < candies.size()-3; i++) {
      if (i % 10 != 0 && i % 9 != 0 && candies.get(i).getColor() == candies.get(i+1).getColor() && candies.get(i+1).getColor() == candies.get(i+2).getColor() ) {
        return true;
      }
    }
    return false;
  }
  
  
  
  
}
