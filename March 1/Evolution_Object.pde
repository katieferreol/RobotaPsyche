//Katie Ferreol Assignment 3: Sea of Fish Behavior
//February 22, 2021
//Instructions: Watch the various forms of fish swim about!

int cols, rows;
int x = 0;

FlowField f;
ArrayList<Particle> particles;
PImage background;

PVector[] flowField;
PVector mouse;
PVector center;
PVector newmouse;

int hitsame;
int hitdiff;
int fishnumber;
float locationx;
float locationy;
int addnew;
int decreasenew;

void setup()
{
  size(800, 600, P2D);
  f = new FlowField(15);

  background = loadImage("background.png");

  particles = new ArrayList<Particle>();

  for (int i = 0; i < 2; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
  
 frameRate(60);
}

void mouseClicked() {
  particles.add(new Particle(mouseX, mouseY));
}

void draw()
{
  background(background);

  for (Particle p : particles) {

    hitdiff = p.getHitDiff();
    hitsame = p.getHitSame();
    fishnumber = p.getFishNumber();

    p.getDNA();
    p.checkBorders();
    p.follow(f);
    p.update();
    p.show();
    p.separate(particles);

    if ((hitsame == 1)) {
      locationx = p.getLocationX();
      locationy = p.getLocationY();
      if (frameCount % 180 == 0) {
      addnew = 1;
      }
    }

    if (hitdiff == 1) {
      decreasenew = 1;
    }
  }

  
  addNewFish();
  decreaseFish();
}

void addNewFish() {
  if (addnew == 1) {
    //println("fishhasbeenadded");
    particles.add(new Particle(locationx, locationy));
    addnew = 2;
  }

  if (addnew == 2) {
    addnew = 0;    
  }
  println(addnew);
}

void decreaseFish() {
  if (decreasenew == 1) {
    //particles.remove(10);
    decreasenew = 2;
  }
  //if (decreasenew == 2) {
  //  decreasenew = 0;    
  //}
}
