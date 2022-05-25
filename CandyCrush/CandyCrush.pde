candyCrush demo;
int SQUARESIZE;
void setup(){
    size(1000, 800);
    demo = new candyCrush();
    SQUARESIZE = (width/10);
}

void draw() {
  background(255);
  demo.numsToSquares();
}
