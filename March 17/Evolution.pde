//General class

ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
FlowField f;
Shark s;

PVector[] flowField;
PImage background;
PImage burst;
int fishnumber;
boolean addNewFish;

import java.util.Iterator;

void setup() {
  size (800, 600);

  f = new FlowField(5);
  s = new Shark();

  background = loadImage("background.png");
  burst = loadImage("burst.PNG");

  //for (int i = 0; i < 5; i++) {
  //  vehicles.add(new Vehicle(random(600), random(400)));
  //}
  for (int i = 0; i < 5; i++) {
    vehicles.add(new Vehicle(random(600), random(400)));
  }
}

//To make things easier for presentation if fishes aren't meeting
void mousePressed() {
  vehicles.add(new Vehicle(mouseX, mouseY));
  //vehicles.add(new Vehicle(mouseX, mouseY, 2));
}

void draw()
{
  background(background);
  //println(vehicles.size());

  //Displaying shark
  s.display();

  for (int i = vehicles.size()-1; i>=0; i--) {

    Vehicle v = vehicles.get(i);

    v.checkBorders();
    v.update();
    v.display();
    v.follow(f);
    v.getFish();
    v.getShark();
    v.collision(vehicles);

    fishnumber = v.getFishNumber();
    addNewFish = v.getCollision();

    if (v.isDead()) {
      vehicles.remove(v);
    }
    for (int j=0; j<int(random(0, 4)); j++) {
      if (frameCount % 100 == 0) {
        if (addNewFish == true) {
          if (fishnumber == 0) {
            fishnumber = 0;
            vehicles.add(new Vehicle(v.spawnareax, v.spawnareay));
            image(burst, v.spawnareax, v.spawnareay, 100, 100);
          }
          if (fishnumber == 1) {
            fishnumber = 1;
            vehicles.add(new Vehicle(v.spawnareax, v.spawnareay));
            image(burst, v.spawnareax, v.spawnareay, 100, 100);
          }
          if (fishnumber == 2) {
            fishnumber = 2;
            vehicles.add(new Vehicle(v.spawnareax, v.spawnareay));
            image(burst, v.spawnareax, v.spawnareay, 100, 100);
          }
          if (fishnumber == 3) {
            fishnumber = 3;
            vehicles.add(new Vehicle(v.spawnareax, v.spawnareay));
            image(burst, v.spawnareax, v.spawnareay, 100, 100);
          }
        }
      }
    }
  }
}
