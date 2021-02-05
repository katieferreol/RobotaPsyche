Car b1;

void setup() {
  size(500, 500);
  b1 = new Car(0);
}

void draw() {
  background(0);
  b1.display();
  b1.move();
}
