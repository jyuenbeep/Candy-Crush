candyCrush demo;
void setup(){
    size(1000, 800);
}

void draw() {
  background(255);
  demo = new candyCrush();
  display();
}

void display(){
  int a = 0;
  int b = 0;
  for (int i = 100; a < 7 && i < width; i += 100) {
    fill(255);
    for (int j = 100; b < 7 && j < height; j += 100) {
      int k = demo.board[a][b];
      int[] temp = demo.colors[k];
      circle(i, j, 100);
      fill(temp[0], temp[1], temp[2]);
      b++;
    }
    a++;
  }
}
