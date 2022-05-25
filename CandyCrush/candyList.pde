public class candyList {
  ArrayList<candy> candies;
  
  color[] colorsToChoose = new color[]{#AA4A44, #89CFF0, #00FF00, #FFFF00);
  
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
