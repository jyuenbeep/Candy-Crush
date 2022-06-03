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

//images
PImage backgroundImg;
PImage redCandy;
PImage orangeCandy;
PImage yellowCandy;
PImage greenCandy;
PImage purpleCandy;
PImage blueCandy;
//colors
final color RED = #AA4A44;
final color BLUE = #89CFF0;
final color GREEN = #00FF00;
final color YELLOW = #FFFF00;
final color PURPLE = #800080;
final color ORANGE = #FFA500;

void setup() {
  size(1000, 800);
  runBoard();
  //images
  backgroundImg = loadImage("background.jpg");
  redCandy = loadImage("red.png");
  yellowCandy = loadImage("yellow.png");
  blueCandy = loadImage("blue.png");
  greenCandy = loadImage("green.png");
  purpleCandy = loadImage("purple.png");
  orangeCandy = loadImage("orange.png");
  //arrays
  PImage[] imgs = new PImage[]{redCandy, yellowCandy, blueCandy, greenCandy, purpleCandy, orangeCandy};
  color[] clrs = new color[]{RED, YELLOW, BLUE, GREEN, PURPLE, ORANGE};
  //constructor
  candies = new candyList(rows, cols, imgs, clrs);
}

void draw() {
  ycor = 100;
  background(255); 
  fill(#808080);
  image(backgroundImg, 0, 0, backgroundImg.width*2, backgroundImg.height*2); 

  testRun();

  fill(0);
  //testing
  textSize(30);
  text("coordinate one: (" + firstRI + ", " + firstCI + ")", 50, 50);
  text("coordinate two: (" + secondRI + ", " + secondCI + ")", 50, 100);
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
  for (int r = 0; r<candies.r; r++) {
    for (int c = 0; c<candies.c; c++) {
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
