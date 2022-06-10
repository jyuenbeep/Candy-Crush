int TILESIZE;
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
PImage[] imgs;

//colors
final color RED = #AA4A44;
final color BLUE = #89CFF0;
final color GREEN = #00FF00;
final color YELLOW = #FFFF00;
final color PURPLE = #800080;
final color ORANGE = #FFA500;

//change goal
PImage goalImage; 
int goalNumber; 

void setup() {
  size(1000, 800);
  testing = new level();
  TILESIZE = testing.size;
  backgroundImg = loadImage("background.jpg");
  //images //<>//
  redCandy = loadImage("red.png");
  yellowCandy = loadImage("yellow.png");
  blueCandy = loadImage("blue.png");
  greenCandy = loadImage("green.png");
  purpleCandy = loadImage("purple.png"); //<>//
  orangeCandy = loadImage("orange.png");
  redCandy.resize(TILESIZE,TILESIZE);
  yellowCandy.resize(TILESIZE,TILESIZE);
  blueCandy.resize(TILESIZE,TILESIZE); //<>//
  orangeCandy.resize(TILESIZE,TILESIZE);
  greenCandy.resize(TILESIZE,TILESIZE);
  purpleCandy.resize(TILESIZE,TILESIZE);
  //arrays //<>//
  imgs = new PImage[]{redCandy, yellowCandy, blueCandy, greenCandy, purpleCandy, orangeCandy};
  color[] clrs = new color[]{RED, YELLOW, BLUE, GREEN, PURPLE, ORANGE};
  //constructor
  candies = new candyList(testing.row, testing.col, imgs, clrs, testing.size/2, testing.getXstart(), testing.getYstart(), testing.getTilesize());
  //runBoard();
  showGoal();
}

void draw() {
  image(backgroundImg, 0, 0, backgroundImg.width*2, backgroundImg.height*2);
  fill(#D3D3D3);
  runBoard();
  //showGoal();
  candies.display();
  fill(0);
  //testing
  textSize(40);
  fill(#D98121);
  textMode(MODEL);
  text("CANDY CRUSH ", 250, 75); 
  textSize(20);
  fill(0);
  text("MOVES LEFT: " + testing.moves, 50, 80);
  text("LEVEL GOAL", 650, 25); 
  setGoal();
  text(testing.goal1, 660, 70);
  text(testing.goal2, 760, 70);
  text(testing.goal3, 860, 70);
  image(testing.gol1, 600, 40, 50, 50);
  image(testing.gol2, 700, 40, 50, 50);
  image(testing.gol3, 800, 40, 50, 50);
  text(frameRate, 10, 15);
  text("level: " + testing.getLevel(),50, 60);
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
      if (distBetweenCandy<= 130) {
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
  if (testing.goal1 == 0 && testing.goal2 == 0 && testing.goal3 == 0) {
    clearBoard();
    testing.increaseLevel();
    setup();
  }
}

void keyPressed() {
  if (keyCode == TAB) {
    testing.increaseLevel();
    setup();
  } 
  if (keyCode == BACKSPACE) {
    testing.reset();
    setup();
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
    while (ycor < height-TILESIZE) {
      xcor = 40;
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

  void showGoal() {
    int randIndex1 = (int)(Math.random()*imgs.length);
    int randIndex2 = (int)(Math.random()*imgs.length);
    while (randIndex2 == randIndex1) {
      randIndex2 = (int)(Math.random()*imgs.length);
    }
    int randIndex3 = (int)(Math.random()*imgs.length);
    while (randIndex3 == randIndex2 || randIndex3 == randIndex1) {
      randIndex3 = (int)(Math.random()*imgs.length);
    }
    testing.setGoal(imgs[randIndex1], imgs[randIndex2], imgs[randIndex3]);
  }
  
  void setGoal() {
    goalNumber = candies.combo;
    goalImage = candies.comboImage;
    if (testing.gol1 == goalImage) {
      testing.goal1-=goalNumber;
    }
    if (testing.gol2 == goalImage) {
      testing.goal2-=goalNumber;
    }
    if (testing.gol3 == goalImage) {
      testing.goal3-=goalNumber;
    }
  }
  
  void clearBoard() {
    if (testing.goal1 == 0 && testing.goal2 == 0 && testing.goal3 == 0) {
       text("YOU WON LEVEL " + testing.getLevel() + " ON TO THE NEXT LEVEL", 100, 100); 
    }
  }
