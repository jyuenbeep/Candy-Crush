final int TILESIZE = 80;
int ycor; 
int xcor;
int candiesNum = 0;
candyList candies;
int mouse = 1; 
boolean swapBool = false;
int firstClick;
int secondClick;

void setup() {
  size(1000, 800);
  runBoard();
  candies = new candyList(candiesNum);
}

void draw() {
  ycor = 100;
  background(255); 
  fill(#808080);
  runBoard();

  if (swapBool) {
    float tempX = candies.get(firstClick).x;
    float tempY = candies.get(firstClick).y;
    candies.get(firstClick).x = candies.get(secondClick).x;
    candies.get(firstClick).y = candies.get(secondClick).y;
    candies.get(secondClick).x = tempX;
    candies.get(secondClick).y = tempY;
    swapBool = false;
  }
  candies.display();
  fill(0);
  textSize(50);
  text("POINTS: " + updateProgress(), 100, 50);
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
      swapBool = true;
      mouse = 1;
    }
  }
}

int updateProgress() {
  return candies.points;
} 

int getCandy(int x, int y) {
  for (int i = 0; i < candies.size(); i++) {
    float distStore = dist(x, y, candies.get(i).x, candies.get(i).y);
    if (distStore < 25) {
      return i;
    }
  }
  return -1;
}

void runBoard() {
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
}
