//Vehicle class

class Vehicle {
  
  //Regular variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;
  float maxspeed;
  
  //Getting DNA and shark
  DNA dna;
  Shark shark;

  //All variables from other classes
  PImage[] fishes;
  PImage blood;
  float size;
  int fishnumber;
  float spawnareax;
  float spawnareay;
  int sharkx;
  int sharky;

  Vehicle(float x, float y, int fno) {
    maxspeed = 5;
    maxforce = 0.10;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    
    dna = new DNA(fno);
    shark = new Shark();
    blood = loadImage("blood.PNG");

    fishes = new PImage[4];
    for (int i = 0; i < 4; i++) {
      fishes[i] = loadImage("fish"+ i +".png");
    }
  }

  //Getting values from Shark class
  void getShark() {
    shark.move();
    sharkx = shark.getSharkX();
    sharky = shark.getSharkY();
  }

  //Checking borders
  void checkBorders() {
    if (location.x > 700) {
      velocity.x *= -1;
    }
    if (location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y < 0) {
      velocity.y *= -1;
    }
    if (location.y > 500) {
      velocity.y *= -1;
    }
  }

  //Running for iterator
  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  //Getting values from DNA class
  void getFish() {
    fishnumber = dna.getFishNumber();
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }

  //Getting values of collision
  void collision (ArrayList<Vehicle> vehicles) {
    float desireddistance = 40;
    for (Vehicle other : vehicles) {
      float d = dist(location.x, location.y, other.location.x, other.location.y);
      if ((d > 0) && (d < desireddistance)) {
        if (fishnumber == other.fishnumber) {
          spawnareax = location.x;
          spawnareay = location.y;
        } else {
          spawnareax = 0;
          spawnareay = 0;
        }
      }
    }
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0); // clear the acceleration for the next frame
  }

  //Scaling fish depending on its fishnumber to determine which is stronger
  void display() {
    int fno = dna.fishnumber;
    if (fno == 0) {
      size = (0.4);
    } else if (fno == 1) {
      size = (0.6);
    } else if (fno == 2) {
      size = (0.6);
    } else if (fno == 3) {
      size = (0.9);
    }
    pushMatrix();
    translate(location.x, location.y);
    scale(size);
    image(fishes[fno], 0, 0, fishes[fno].width/2, fishes[fno].height/2);
    popMatrix();
  }

  //All returning functions
  DNA getDNA() {
    return(dna.getDNA());
  }

  float getSpawnAreaX() {
    return spawnareax;
  }

  float getSpawnAreaY() {
    return spawnareay;
  }

  int getFishNumber() {
    return fishnumber;
  }

  //Fish dies when it gets too close to the shark
  boolean isDead() {
    if (dist(sharkx, sharky, location.x, location.y) < 50) {
      image(blood, location.x, location.y-100, 50, 50);
      return true;
    } else {
      return false;
    }
  }
}
