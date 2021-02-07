class Rocket {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  boolean movement = false;

  Rocket() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0, 0.0);
    topspeed = 50;
  }

  void drive(PVector direction) {
    acceleration.add(direction);
  }

  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }

  void display() {
    float theta = velocity.heading();
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    drawRocket();
    popMatrix();
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }

  void drawRocket() {
    fill(255);
    rect(30, 75, 60, 30);
    fill(255, 0, 0);
    triangle(30, 75, 30, 50, 60, 75);
    triangle(90, 75, 90, 105, 120, 90);
    triangle(60, 105, 30, 105, 30, 130);
  }
}
