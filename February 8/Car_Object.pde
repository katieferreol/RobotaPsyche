Car b1;

void setup() {
  size(800, 800);
  b1 = new Car();
  smooth();
}

void draw() {
  PVector speed = new PVector(.1, 0);
  PVector friction = b1.velocity.copy();
  float c = 0.01;
  
  friction.mult(-1);
  friction.normalize();
  friction.mult(c);

  background(0);
  b1.move();
  b1.update();
  b1.checkEdges();
  b1.display();
  b1.applyForce(speed);
}

//void keyPressed() {
//  b1.move(true);
//}
//void keyReleased() {
//  b1.move(false);
//}
