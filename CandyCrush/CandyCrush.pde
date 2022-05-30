final int TILESIZE = 80;
int ycor; 
int xcor;
int candiesNum = runBoard();
candyList candies;
int mouse = 1; 

boolean swapBool = false;

//for testing
float xval; 
float yval;
float distStore;
int ind;
int firstClick;
int secondClick;

void setup() {
  size(1000, 800);
  candies = new candyList(100);
}

void draw() {
  ycor = 100;
  background(255); 
  fill(#808080);

  testRun();

  fill(0);

  //testing
  textSize(10);
  text("x: " + xval, 50, 50);
  text("y: " + yval, 50, 100);
  text("mouseX: " + mouseX, 100, 50);
  text("mouseY: " + mouseY, 100, 100);
  text("distance: " + distStore, 200, 50);
  text("index: " + ind, 200, 100);
  text("mouse: " + mouse, 400, 50);
  text("swapBool: " + swapBool, 400, 100); 
  text("firstClick: " + firstClick, 500, 50); 
  text("secondClick: " + secondClick, 500, 100); 
  textSize(50);
  text("POINTS: " + candies.points, 600, 75);
  //testing
  circle(mouseX, mouseY, 30);
}

void mouseClicked() {
  if (mouse == 1) {
    firstClick = getCandy(mouseX, mouseY);
    if (firstClick!=-1) {
      swapBool = false;
      mouse = 2;
    }
  } else if (mouse == 2) {
    secondClick = getCandy(mouseX, mouseY);
    if (secondClick!=-1) {
      float distBetweenCandy = dist(candies.get(firstClick).x, candies.get(firstClick).y, candies.get(secondClick).x, candies.get(secondClick).y);
      if (distBetweenCandy<=130) {
        swapBool = true;
      }
      mouse = 1;
    }
  }
  if (swapBool) {
    float tempX = candies.get(firstClick).x;
    float tempY = candies.get(firstClick).y;
    candies.get(firstClick).x = candies.get(secondClick).x;
    candies.get(firstClick).y = candies.get(secondClick).y;
    candies.get(secondClick).x = tempX;
    candies.get(secondClick).y = tempY;
    swapBool = false;

    candy firstTemp = candies.get(firstClick);
    candies.set(firstClick, candies.get(secondClick));
    candies.set(secondClick, firstTemp);
    candies.clearRowForThree();
    //candies.points+=100;
  }
}

int getCandy(int x, int y) {
  for (int i = 0; i < candies.size(); i++) {
    //testing
    xval = candies.get(i).x;
    yval = candies.get(i).y;
    //testing
    distStore = dist(x, y, candies.get(i).x, candies.get(i).y);
    if (distStore < 25) {
      ind = i;
      return i;
    }
  }
  return -1;
}

int runBoard() {
  while (ycor < height-80) {
    xcor = 50;
    while (xcor<width-TILESIZE*2) {
      //stroke(10);
      rect(xcor, ycor, TILESIZE, TILESIZE);
      xcor+=TILESIZE;
      candiesNum++;
    }
    ycor+=TILESIZE;
  }
  return candiesNum;
}

void testRun() {
  runBoard();
  candies.display();
}
