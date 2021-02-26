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

boolean hitsame;
boolean hitdiff;
float locationx;
float locationy;
int fishesOcean = 20;

void setup()
{
  size(800, 600, P2D);
  f = new FlowField(15);

  background = loadImage("background.png");

  particles = new ArrayList<Particle>();

  for (int i = 0; i < fishesOcean; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
}

void mouseClicked() {
  particles.add(new Particle(mouseX, mouseY));
  fishesOcean++;
}

void draw()
{
  background(background);

  println(fishesOcean);

  for (Particle p : particles) {
    
    hitdiff = p.getHitDiff();
    hitsame = p.getHitSame();
    locationx = p.getLocationX();
    locationy = p.getLocationY();
    
    p.getDNA();
    p.checkBorders();
    p.follow(f);
    p.update();
    p.show();
    p.separate(particles);
  }
  
  if (hitsame == true) {
      particles.add(new Particle(locationx, locationy));
      fishesOcean++;
    }
    
  if (hitdiff == true) {
    
  }
}
