public class candyList {
  final color RED = #AA4A44;
  final color BLUE = #89CFF0;
  final color GREEN = #00FF00;
  final color YELLOW = #FFFF00;
  
  ArrayList<candy> candies;
  
  color[] colorsToChoose = new color[]{RED, BLUE, GREEN, YELLOW);
  
  candyList(int total) {
    int xcor = 50;
    int ycor = 50;
    candies = new ArrayList<candy>();
    for (int i = 0; i<total; i++) {
      candies.add(new candy(xcor, ycor, colorsToChoose[(int)Math.random()*4]));
      if (xcor<950) {
        xcor+=50;
      }
      else {
        xcor=50; 
        ycor+=50;
      }
    }
  }
}
