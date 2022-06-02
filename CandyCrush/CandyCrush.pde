final int TILESIZE = 80;
int ycor; 
int xcor;
candyList candies;
int mouse = 1; 

int rows;
int cols;

boolean swapBool = false;

//for testing
float xval; 
float yval;
float distStore;
int ind;
int firstClick;
int secondClick;

//testing2 
int rowIndex;
int colIndex;
int firstRI;
int firstCI;
int secondRI;
int secondCI;

void setup() {
  size(1000, 800);
  runBoard();
<<<<<<< HEAD
  candies = new candyList(8, 10);
=======
  candies = new candyList(rows, cols);
>>>>>>> 5bf695a46e6baf3c350d48b356899b776473eb27
}

void draw() {
  ycor = 100;
  background(255); 
  fill(#808080);

  testRun();

  fill(0);

  //testing
  circle(mouseX, mouseY, 30);
}

void mouseClicked() {
  if (mouse == 1) { 
    firstClick = getCandy(mouseX, mouseY);
    if (firstClick!=-1) {
      firstRI = rowIndex;
      firstCI = colIndex;
      swapBool = false;
      mouse = 2;
    }
  } else if (mouse == 2) {
    secondClick = getCandy(mouseX, mouseY);
    if (secondClick!=-1) {
      secondRI = rowIndex;
      secondCI = colIndex;
      float distBetweenCandy = dist(candies.get(firstRI, firstCI).getX(), candies.get(firstRI, firstCI).getY(), 
        candies.get(secondRI, secondCI).getX(), candies.get(secondRI, secondCI).getY());
      if (distBetweenCandy<=130) {
        swapBool = true;
      }
      mouse = 1;
    }
  }
  if (swapBool) {
    candy firstTempCandy = candies.get(firstRI, firstCI);
    candy secondTempCandy = candies.get(secondRI, secondCI);
    candies.set1(firstRI, firstCI, secondTempCandy); 
    candies.set1(secondRI, secondCI, firstTempCandy);
    swapBool = false;

    //candies.clearRowForThree();
    //candies.clearColForThree();
  }
}

int getCandy(float x, float y) {
  for (int rows = 0; rows < candies.r; rows++) {
    for (int cols = 0; cols < candies.c; cols++) {
      xval = candies.get(rows, cols).getX();
      println(xval);
      yval = candies.get(rows, cols).getY();
  for (int r = 0; r<rows; r++) {
    for (int c = 0; c<cols; c++) {
      xval = candies.get(r, c).getX();
      yval = candies.get(r, c).getY();
      distStore = dist(xval, yval, x, y);
      if (distStore<25) {
        rowIndex = r;
        colIndex = c;
        return 0;
      }
    }
  }
  return -1;
}

void runBoard() {
  cols=0;
  while (ycor < height-80) {
    xcor = 50;
    rows=0;
    while (xcor<width-TILESIZE*2) {
      //stroke(10);
      rect(xcor, ycor, TILESIZE, TILESIZE);
      xcor+=TILESIZE;
      rows++;
    }
    ycor+=TILESIZE;
    cols++;
  }
}

void testRun() {
  runBoard();
  candies.display();
}
