Star[] stars = new Star [10];
Rocket rocket;

PVector right = new PVector(.1, 0);
PVector left = new PVector(-.1, 0);
PVector up = new PVector(0, -.1);
PVector down = new PVector(0, .1);
PVector halt = new PVector(0, 0);

boolean move = false;

void setup() {
  size(800, 800);

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  rocket = new Rocket();
}

void draw() {
  background(0, 25, 51);

  for (int i = 0; i < stars.length; i++) {
    stars[i].fall();
    stars[i].show();
  }

  rocket.update();
  rocket.checkEdges();
  rocket.display();

  if (keyPressed == true) {
    move = true;
    if (keyCode == RIGHT) {

      rocket.drive(right);
    }
    if (keyCode == LEFT) {

      rocket.drive(left);
    }
    if (keyCode == UP) {
      rocket.drive(up);
    }
    if (keyCode == DOWN) {
      rocket.drive(down);
    }
  }

  if (keyPressed == false) {
    move = false;

    PVector stop = rocket.velocity.copy();
    stop.mult(-1);
    stop.normalize();
    stop.mult(0.1);

    rocket.drive(stop);
  }
}
