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

DNA[] population = new DNA[100];

void setup()
{
  size(800, 600, P2D);
  f = new FlowField(15);

  background = loadImage("background.png");

  particles = new ArrayList<Particle>();

  for (int i = 0; i < 30; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
}


void mouseClicked() {
  particles.add(new Particle(mouseX, mouseY));
}

void draw()
{
  background(background);


  for (Particle p : particles) {
    p.getDNA();
    p.checkBorders();
    p.follow(f);
    p.update();
    p.show();
  }
}
