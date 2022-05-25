final int TILESIZE = 80;
int ycor; 
int xcor;
int candiesNum = runBoard();
candyList candies;

void setup() {
  size(1000, 800);
  candies = new candyList(100);
}

void draw() {
  ycor = 100;
  background(255); 
  fill(#808080);
  runBoard();
  candies.display();
}

int runBoard() {
  while (ycor < height-80) {
    xcor = 50;
    while (xcor<width-TILESIZE) {
      //stroke(10);
      rect(xcor, ycor, TILESIZE, TILESIZE);
      xcor+=TILESIZE;
      candiesNum++;
    }
    ycor+=TILESIZE;
  }
  return candiesNum;
}
