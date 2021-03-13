//Trash class

class Trash {

  //Regular variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;
  float maxspeed;
  PImage[] trash;

  //Getting DNA and duck
  DNA dna;
  Duck duck;

  //All variables from other classes
  float size;
  int trashnumber;
  float duckx;
  float ducky;
  int whatTrash;

  Trash(float x, float y) {
    maxspeed = 5;
    maxforce = 0.10;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    
    dna = new DNA();
    duck = new Duck();
    trashnumber = dna.getTrashNumber();

    trash = new PImage[4];
    for (int i = 0; i < 4; i++) {
      trash[i] = loadImage("trash"+ i +".png");
    }
  }

  //Getting values from Shark class
  void getDuck() {
    duck.move();
    duckx = duck.getlocx();
    ducky = duck.getlocy();
  }

  //Checking borders
  void checkBorders() {
    if (location.x > 800) {
      velocity.x *= -1;
    }
    if (location.x < 50) {
      velocity.x *= -1;
    }
    if (location.y < 250) {
      velocity.y *= -1;
    }
    if (location.y > 600) {
      velocity.y *= -1;
    }
  }
  
  //Applying force
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Getting values from DNA class
  void getFish() {
    trashnumber = dna.getTrashNumber();
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0); // clear the acceleration for the next frame
  }

  //Displaying trash
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    scale(0.25);
    image(trash[trashnumber], 0, 0, trash[trashnumber].width/2, trash[trashnumber].height/2);
    popMatrix();
  }

  DNA getDNA() {
    return(dna.getDNA());
  }

  //Trash dies (gets "eaten") when it gets too close to the duck
  boolean isDead() {
    if (abs(dist(duckx, ducky, location.x, location.y)) < 50) {
      return true;
    } else {
      return false;
    }
  }
}
