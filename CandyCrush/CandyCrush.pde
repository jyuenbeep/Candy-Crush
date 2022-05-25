final int TILESIZE = 10;

void setup(){
    size(1000, 800);
    candies = new candyList(); 
}

void draw() {
    background(255); 
    candies.display();
}
