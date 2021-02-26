class Particle {
  PVector location = new PVector(random(width - 1), random(height - 1));
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector prevlocation = location.copy();
  float maxSpeed;
  float maxForce;
  PImage fish;
  float size;
  float speed;
  int fishnumber;
  boolean hitsame;
  boolean hitdiff;
  float appearx;
  float appeary;
  DNA dna;
  PImage burst;
  PImage blood;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxSpeed = 10;
    maxForce = 0.10;
    dna = new DNA();
    burst = loadImage("burst.png");
    blood = loadImage("blood.png");
  }

  void getDNA() {
    size = dna.getSize();
    fish = dna.getFish();
    fishnumber = dna.getFishNumber();
  }

  void update() {
    velocity.add(acceleration); 
    velocity.limit(maxSpeed);
    location.add(velocity); 
    // reset acceleration
    acceleration.mult(0);
  }

  void checkBorders() {
    if (location.x > width) {
      velocity.x *= -1;
    }
    if (location.x < 0) {
      velocity.x *= -1;
    }
    if (location.y < 0) {
      velocity.y *= -1;
    }
    if (location.y > height) {
      velocity.y *= -1;
    }
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void show() {
    stroke(0);
    fill(255, 255, 0);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    scale(size);
    image(fish, 0, 0, fish.width/2, fish.height/2);
    popMatrix();
  }

  //make fish follow a certain force
  void follow(FlowField flow) {
    // Look up the vector at that spot in the flow field
    PVector desired = flow.lookup(location);
    desired.mult(maxSpeed);

    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  void separate (ArrayList<Particle> particles) {
    //println(hitsame);

    for (Particle other : particles) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < 20)) {
        PVector diff = PVector.sub(location, other.location);
        if ((int(diff.x) < 0) && (abs(fishnumber - other.fishnumber) == 1)) {
          hitdiff = true;
          appearx = location.x;
          appeary = location.y;
          image(blood, int(appearx), int(appeary)+30, 30, 30);
        } else {
          hitdiff = false;
        }
        if ((int(diff.x) < 20) && (int(diff.y) < 20) && (fishnumber - other.fishnumber == 0)) {
          hitsame = true;
          appearx = location.x;
          appeary = location.y;
          image(burst, int(appearx), int(appeary), 70, 70);
        } else {
          hitsame = false;
        }
      }
    }
  }
  
  boolean getHitSame() {
    return hitsame;
  }
  
  boolean getHitDiff() {
    return hitdiff;
  }
  
  float getLocationX() {
    return appearx;
  }
  float getLocationY() {
    return appeary;
  }
}
