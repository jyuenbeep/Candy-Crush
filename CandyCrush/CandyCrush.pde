final int TILESIZE = 80;
int ycor; 
int xcor;
candyList candies;
int mouse = 1; 
int rows;
int cols;
boolean swapBool = false;
level testing;

//testing 
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
  backgroundImg = loadImage("background.jpg");
  //images
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
  testing = new level();
  candies = new candyList(testing.getRow(), testing.getCol(), imgs, clrs);
}

void draw() {
  image(backgroundImg, 0, 0, backgroundImg.width*2, backgroundImg.height*2);
  fill(#D3D3D3);
  runBoard();
  candies.display();
  fill(0);
  //testing
  textSize(40);
  fill(#D98121);
  textMode(MODEL);
  text("CANDY CRUSH ", 310, 75); 
  textSize(20);
  //text("coordinate one: (" + firstRI + ", " + firstCI + ")", 50, 50);
  //text("coordinate two: (" + secondRI + ", " + secondCI + ")", 50, 100);
  fill(0);
  text("MOVES LEFT: " + testing.moves, 50, 80);
  text("GOAL1: " + testing.goal1 , 600, 45);
  text("GOAL2: " + testing.goal2 , 700, 45);
  text("GOAL3: " + testing.goal3 , 800, 45);
  //text("cols: " + candies.c, 500, 100); 
  text(frameRate, 40, 40);
  text("level: " + testing.getLevel(),55, 60);
  //testing
  circle(mouseX, mouseY,20);
}

void mouseClicked() {
  if (mouse == 1) {
    int firstClick = getCandy(mouseX, mouseY);
    if (firstClick!=-1) {
      firstRI = rowIndex;
      firstCI = colIndex;
      swapBool = false;
      mouse = 2;
    }
  } else if (mouse == 2) {
    int secondClick = getCandy(mouseX, mouseY);
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
  if (swapBool && testing.moves > 0) {
    testing.moves--;
    candies.swapCandies(firstRI, firstCI, secondRI, secondCI);
    swapBool = false;
  }
  if (testing.moves == 0) {
    testing.increaseLevel();
    testing.reset();
  }
}

int getCandy(float x, float y) {
  for (int r = 0; r<candies.r; r++) {
    for (int c = 0; c<candies.c; c++) {
      float xval = candies.get(r, c).getX();
      float yval = candies.get(r, c).getY();
      float distStore = dist(xval, yval, x, y);
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
  rows=0;
  ycor=100; 
  while (ycor < height-80) {
    xcor = 50;
    cols=0;
    while (xcor<width-TILESIZE*2) {
      rect(xcor, ycor, TILESIZE, TILESIZE);
      xcor+=TILESIZE;
      cols++;
    }
    ycor+=TILESIZE;
    rows++;
  }
}

void clearBoard() {
  //shows a screen if you met the goal and won or lost the level
}
