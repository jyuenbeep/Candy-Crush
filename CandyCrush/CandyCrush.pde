candyCrush demo;
void setup(){
<<<<<<< HEAD
  size(1000, 800);
  candies = new candyList(100);
}

void draw() {
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
  int ind; 
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
  text("index: " + ind, 200, 100);
  text("mouse: " + mouse, 400, 50);
  text("firstClick: " + firstClick, 500, 50); 
  text("secondClick: " + secondClick, 500, 100); 
  //testing
  circle(mouseX, mouseY, 30);
}

int firstClick;
int secondClick;

void mouseClicked() {

  if (mouse == 1) {
    firstClick = getCandy(mouseX, mouseY);
    if (firstClick!=-1) {
      mouse = 2;
    }
  }
  else if (mouse == 2) {
    secondClick = getCandy(mouseX, mouseY);
    if (secondClick!=-1) {
      candy firstTemp = candies.get(firstClick);
      candies.set(firstClick, candies.get(secondClick));
      candies.set(secondClick, firstTemp); 
      mouse = 1;
    }
  }
  candies.display();
}

int getCandy(int x, int y) {
  for (int i = 0; i<candies.size(); i++) {
    //testing
    xval = candies.get(i).x;
    yval = candies.get(i).y;
    //testing
    distStore = dist(x, y, candies.get(i).x, candies.get(i).y);
    if (distStore<25) {
      ind = i;
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
=======
    size(1000, 800);
}

void draw() {
  background(255);
  demo = new candyCrush();
>>>>>>> demo
}
