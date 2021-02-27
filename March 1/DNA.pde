//Katie Ferreol Assignment 3: Sea of Fish Behavior
//February 22, 2021
//Instructions: Watch the various forms of fish swim about!


import java.util.Iterator; 

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
int fishesOcean;
boolean addnew = false;

void setup()
{
  size(800, 600, P2D);
  f = new FlowField(15);

  background = loadImage("background.png");

  particles = new ArrayList<Particle>();

  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(random(width), random(height)));
  }

  fishesOcean = particles.size();
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

    if (hitsame == 1) {
      locationx = p.getLocationX();
      locationy = p.getLocationY();
      addnew = true;
    }
  }

  if (addnew == true) {
    particles.add(new Particle(locationx, locationy));
    addnew = false;
  }
}
