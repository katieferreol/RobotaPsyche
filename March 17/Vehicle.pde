//Vehicle class

class Vehicle {

  //Regular variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float maxforce;
  float maxspeed;
  boolean collisionLastFrame = false;
  boolean returnValue = false;

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

  boolean reproduceNew;

  Vehicle(float x, float y) {
    maxspeed = 5;
    maxforce = 0.10;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);

    dna = new DNA();
    shark = new Shark();
    blood = loadImage("blood.PNG");

    fishnumber = dna.getFishNumber();

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
          //println("collision detected");
          if (!collisionLastFrame) {
            //println("collision detected");
            // Aha! We have a new collision
            collisionLastFrame = true; // remember this for next time
            returnValue = true;
          } else if (collisionLastFrame == true) {
            spawnareax = location.x;
            spawnareay = location.y;
            collisionLastFrame = false;
            }
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
  if (fishnumber == 0) {
    size = (0.4);
  } else if (fishnumber == 1) {
    size = (0.6);
  } else if (fishnumber == 2) {
    size = (0.6);
  } else if (fishnumber == 3) {
    size = (0.9);
  }
  pushMatrix();
  translate(location.x, location.y);
  scale(size);
  image(fishes[fishnumber], 0, 0, fishes[fishnumber].width/2, fishes[fishnumber].height/2);
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

boolean getCollision() {
  return collisionLastFrame;
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
