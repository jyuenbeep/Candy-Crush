public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  
  ArrayList<candy> candies;
  
  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};
  
  candyList(int total) {
<<<<<<< HEAD
    int xcor = 50;
    int ycor = 100;
=======
    int xcor = 90;
    int ycor = 140;
>>>>>>> jasmine
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(new candy(xcor, ycor, rand));
<<<<<<< HEAD
      if (xcor<920) {
=======
      if (xcor+80<920) {
>>>>>>> jasmine
        xcor+=80;
      }
      else {
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
}
