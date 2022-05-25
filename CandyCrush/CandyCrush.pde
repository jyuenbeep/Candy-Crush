final int TILESIZE = 10;
candyList candies;

void setup(){
    size(1000, 800);
    candies = new candyList(100); 
}

void draw() {
    background(255); 
    candies.display();
}
