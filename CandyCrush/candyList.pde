public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  
  ArrayList<candy> candies;
  
  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW};
  
  candyList(int total) {
    int xcor = 100;
    int ycor = 150;
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      color rand = colorsToChoose[(int)(Math.random()*4)];
      candies.add(new candy(xcor, ycor, rand));
      if (xcor<920) {
        xcor+=80;
      }
      else {
        xcor=50; 
        ycor+=80;
      }
    }
  }
  
  void display() {
    for (int i = 0; i<candies.size(); i++) {
      candies.get(i).display();
    }
  }
}
