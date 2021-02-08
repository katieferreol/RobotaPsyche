//ROCKET CLASS

class Rocket {

  //Declaring variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Rocket() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0, 0.0);
    topspeed = 50;
  }

  //If arrow keys are pressed, add said direction to acceleration
  void drive(PVector direction) {
    if (move == true) {
      acceleration.add(direction);
    }
  }

  //updating acceleration every time you draw
  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
    velocity.add(acceleration);
    acceleration.mult(0);
  }

  //display rocket and rotate accordingly
  void display() {
    noStroke();
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    drawRocket();
    popMatrix();
  }

  //If rocket goes out of canvas, reappear at other side
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

  //Drawing the rocket
  void drawRocket() {
    fill(255, 255, 255);
    rect(0, 45, 60, 30);
    fill(255, 0, 0);
    triangle(0, 45, 0, 20, 30, 45);
    triangle(60, 45, 60, 75, 90, 60);
    fill(102, 0, 0);
    triangle(30, 75, 0, 75, 0, 100);
    fill(100, 100, 100);
    ellipse(40, 60, 20, 20);
    fill(180, 180, 180);
    ellipse(40, 60, 15, 15);
    fill(0, 80);
    quad(0, 75, 60, 75, 90, 60, 0, 60);
  }
}
