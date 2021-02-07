Star[] stars = new Star [10];
Rocket rocket;

PVector right = new PVector(.1, 0);
PVector left = new PVector(-.1, 0);
PVector up = new PVector(0, -.1);
PVector down = new PVector(0, .1);
PVector halt = new PVector(0, 0);

void setup() {
  size(800, 800);
  rocket = new Rocket();

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0, 25, 51);
  rocket.update();
  rocket.checkEdges();
  rocket.display();

  for (int i = 0; i < stars.length; i++) {
    stars[i].fall();
    stars[i].show();
  }

  if (key == CODED && keyPressed == true) {
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

    float c = 0.0091;
    float normal = 1;
    float stopMag = c*normal;
    PVector stop = rocket.velocity.copy();
    stop.normalize();
    stop.mult(stopMag);
    println(stop);

    if (stop.z == -0.0) {
      stop.mult(-1);
    } else if (stop.z == 0.0) {
      stop.mult(1);
    }

    rocket.drive(stop);
  }
}
