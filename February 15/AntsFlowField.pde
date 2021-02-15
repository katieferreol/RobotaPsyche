//Katie Ferreol Assignment 2: Flow Field
//Instructions: Use the mouse to move the burger. Click the mouse to generate as many ants as you want.
//The ants follow the burger, try not to let them get it!

//Ant or particle class
class Particle {
  PVector location = new PVector(random(width - 1), random(height - 1));
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector prevlocation = location.copy();
  float maxSpeed = 2;

  //keeping previous location
  void update() {
    prevlocation.x = location.x; 
    prevlocation.y = location.y; 

    // apply acceleration and velocity
    velocity.add(acceleration); 
    velocity.limit(maxSpeed);
    location.add(velocity); 

    // handle window edges
    if (location.x >= width) location.x = prevlocation.x = 0;
    if (location.x < 0) location.x = prevlocation.x = width - 1;
    if (location.y >= height) location.y = prevlocation.y = 0;
    if (location.y < 0) location.y = prevlocation.y = height - 1;

    // reset acceleration
    acceleration.mult(0);
  }

  //adding force to acceleration
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    applyForce(steer);
  }

  //displaying "ants" (lines)
  void show() {
    stroke(139, 0, 0);
    strokeWeight(5);
    line(location.x, location.y, prevlocation.x, prevlocation.y);
  }

  //make ants follow a certain force, whether Perlin noise or following mouse
  void follow(PVector[] flowField) {
    // get the index in the flow field
    int x = floor(location.x / scalar);
    int y = floor(location.y / scalar);
    int index = x + y * cols;

    // get the force and apply it
    PVector force = flowField[index];
    applyForce(force);
  }
}
//end of Ant class

//declaring all variables
float inc = 0.1;
float scalar = 10;
float zoff = 0;

int cols, rows;

ArrayList<Particle> particles;

PImage burgerpic;
PImage background;

PVector[] flowField;
PVector mouse;
PVector center;
PVector newmouse;

void setup()
{
  size(800, 600, P2D);
  cols = floor(width / scalar);
  rows = floor(height / scalar);

  //setting class as an array list
  particles = new ArrayList<Particle>();

  flowField = new PVector[cols * rows];

  burgerpic = loadImage("burger.png");
  background = loadImage("background.jpg");
}

//adding a new ant every time mouse is pressed
void mousePressed() {
  particles.add(new Particle());
}

void draw()
{
  background(210, 180, 140);
  background(background);

  //setting up vectors for mouse
  mouse = new PVector(mouseX, mouseY);
  center = new PVector(0, 0);
  newmouse = mouse.sub(center);

  //creating flowfield to add real movement/behavior
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      // set the vector in the flow field
      int index = x + y * cols; 
      float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
      PVector v = PVector.fromAngle(angle);
      v.setMag(1); 
      flowField[index] = v;
      xoff += inc;
    }
    yoff += inc;
    zoff += 0.000000003; // rate the flow field
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.follow(flowField);
    
    //making ants look for the "burger" (mouse)
    p.seek(newmouse);
    p.update();
    p.show();
  }

  //translating burger to make it on center of mouse instead of on the side
  translate(-20, -20);
  image(burgerpic, mouseX, mouseY, 70, 70);
}
