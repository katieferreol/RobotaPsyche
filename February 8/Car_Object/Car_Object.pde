Car b1;

void setup() {
  size(500, 500);
  b1 = new Car(0);
}

void draw() {
  b1.display();
  b1.move();
}
