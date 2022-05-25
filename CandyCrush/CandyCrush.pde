final int TILESIZE = 80;
int ycor; 
int xcor;
int candiesNum = runBoard();
candyList candies;
int mouse = 1; 
//for testing
float xval; 
float yval;
float distStore;

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
  //cursor???? 
  fill(0);
  //testing
  text("x: " + xval, 50, 50);
  text("y: " + yval, 50, 100);
  text("mouseX: " + mouseX, 100, 50);
  text("mouseY: " + mouseY, 100, 100);
  text("distance: " + distStore, 200, 50);
  //testing
  circle(mouseX, mouseY, 30);
}

int firstClick;
int secondClick;
candy firstTemp;

void mouseClicked() {

  if (mouse == 1) {
    firstClick = getCandy(mouseX, mouseY);
    if (firstClick!=-1) {
      firstTemp = candies.get(firstClick);
      mouse = 2;
    }
  }
  else if (mouse == 2) {
    secondClick = getCandy(mouseX, mouseY);
    if (secondClick!=-1) {
      candies.set(firstClick, candies.get(secondClick));
      candies.set(secondClick, firstTemp); 
      candies.display();
      mouse = 1;
    }
  }
}

int getCandy(int x, int y) {
  for (int i = 0; i<candies.size(); i++) {
    //testing
    xval = candies.get(i).x;
    yval = candies.get(i).y;
    //testing
    distStore = dist(x, y, candies.get(i).x, candies.get(i).y);
    if (distStore<25) {
      return i;
    }
  }
  return -1;
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
