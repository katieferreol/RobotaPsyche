//General class

ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
FlowField f;
Shark s;

PVector[] flowField;
PImage background;
PImage burst;
int fishnumber;
boolean addNewFish;
float spawnareax;
float spawnareay;

import java.util.Iterator;

void setup() {
  size (800, 600);

  f = new FlowField(5);
  s = new Shark();

  background = loadImage("background.png");
  burst = loadImage("burst.PNG");

  for (int i = 0; i < 30; i++) {
    vehicles.add(new Vehicle(random(600), random(400), int(random(0, 4))));
  }
  //for (int i = 0; i < 10; i++) {
  //  vehicles.add(new Vehicle(random(600), random(400), 2));
  //}
}

//To make things easier for presentation if fishes aren't meeting
void mousePressed() {
  vehicles.add(new Vehicle(mouseX, mouseY, int(random(0, 4))));
  //vehicles.add(new Vehicle(mouseX, mouseY, 2));
}

void draw()
{
  background(background);
  println(vehicles.size());

  //Enhanced for loop for vehicles
  for (Vehicle v : vehicles) {
    v.checkBorders();
    v.update();
    v.display();
    v.follow(f);
    v.getFish();
    v.getShark();
    v.collision(vehicles);

    fishnumber = v.getFishNumber();
    spawnareax = v.getSpawnAreaX();
    spawnareay = v.getSpawnAreaY();
  }
  
  //Adding a fish of the same species
  if (frameCount % 100 == 0) {
    if (spawnareax > 0) {
      if (fishnumber == 0) {
        vehicles.add(new Vehicle(spawnareax, spawnareay, 0));
      } else if (fishnumber == 1) {
        vehicles.add(new Vehicle(spawnareax, spawnareay, 1));
      } else if (fishnumber == 2) {
        vehicles.add(new Vehicle(spawnareax, spawnareay, 2));
      } else if (fishnumber == 3) {
        vehicles.add(new Vehicle(spawnareax, spawnareay, 3));
      }
      image(burst, spawnareax, spawnareay, 100, 100);
    }
  }

  //Displaying shark
  s.display();

  //Iterator class to kill of fishes
  Iterator<Vehicle> it = vehicles.iterator();
  while (it.hasNext()) {
    Vehicle v = it.next();
    v.run();
    if (v.isDead()) {
      it.remove();
    }
  }
}
