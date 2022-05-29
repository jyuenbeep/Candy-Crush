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
      if (xcor+80<840) {
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
    clear();
    for (int i = 0; i < candies.size(); i++) {
      candies.get(i).display();
    }
  }
  
  void remove(int a, int b, int c) {
    candies.remove(a);
    candies.remove(b);
    candies.remove(c);
    
    while (a >= 0) {
      if (a <= 9 && a >= 0) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies.add(a, new candy(xcor, ycor, rand));
        break;
      } else {
        candy temp = candies.get(a-11);
        candies.set(a, temp);
        a -= 10;
      }
    }
    while (b >= 0) {
      if (b <= 9 && b >= 0) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies.add(b, new candy(xcor, ycor, rand));
        break;
      } else {
        candy temp = candies.get(b-11);
        candies.set(b, temp);
        b -=10;
      }
    }
    while (c >= 0) {
      if (c <= 9 && c >= 0) {
        color rand = colorsToChoose[(int)(Math.random()*4)];
        candies.add(c, new candy(xcor, ycor, rand));
      } else {
        candy temp = candies.get(c-11);
        candies.set(c, temp);
        c -=10;
      }
    }
  }
  
  void clear(){
    int i = 0;
    while (i < candies.size()-2 && candies.get(i).getColor() == candies.get(i+1).getColor() && candies.get(i+1).getColor() == candies.get(i+2).getColor()) {
      if (i-8 % 10 != 0 || i-9% 10 != 0) {
        remove(i,i+1,i+2);
      }
      if (i == candies.size()-3) {
        i = 0;
      } else {
        i++;
      }
    }
  }
  
  
  
  
  
  
}
