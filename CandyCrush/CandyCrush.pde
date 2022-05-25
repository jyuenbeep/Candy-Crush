final int TILESIZE = 80;
int ycor = 100; 
int xcor;
int candiesNum = 0;
candyList candies;

void setup(){
    size(1000, 800);
    candies = new candyList(100); 
}

void draw() {
    background(255); 
    runBoard();
    candies.display();
}

void runBoard() {
  while (ycor > 50) {
    xcor = 50;
    while (xcor<width-50) {
      stroke(10);
      rect(xcor, ycor, TILESIZE, TILESIZE);
      xcor+=TILESIZE;
    }
    ycor+=TILESIZE;
  }
}
