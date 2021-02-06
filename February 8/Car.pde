class Car {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  boolean movement = false;

  Car() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.0, 0.0);
    topspeed = 50;
  }

  void applyForce(PVector force) {
    if (movement == true) {
      acceleration.add(force);
    }
  }

  void update() {
    velocity.limit(topspeed);
    location.add(velocity);
    velocity.add(acceleration);
  }

  void display() {
    //float theta = velocity.heading();
    noStroke();
    pushMatrix();
    //location.x += cos(theta);
    //location.y += sin(theta);
    translate(location.x, location.y);
    //rotate(theta);
    drawRocket();
    popMatrix();
  }

  void move() {
    println(movement);
    if (keyPressed) {
      movement = true;
      if (keyCode == LEFT) {
        //velocity.x = 0; 
        acceleration.x -= 1;
      }
      if (keyCode == RIGHT) {
        //velocity.x = 0;
        acceleration.x += 1;
      }
      if (keyCode == UP) {
        //velocity.y = 0;
        acceleration.y -= 1;
      }
      if (keyCode == DOWN) {
        //velocity.y = 0; 
        acceleration.y += 1;
      }
    } else {
      movement = false;
    }
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
    rect(30, 75, 60, 100);
    fill(255, 0, 0);
    triangle(30, 75, 60, 20, 90, 75);
    triangle(90, 175, 90, 120, 120, 175);
    triangle(0, 175, 30, 120, 30, 175);
  }
}
