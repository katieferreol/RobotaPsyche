//Katie Ferreol Assignment 1: Rocket Arrow Keys
//Instructions: Use the arrow keys to see the rocketship fly!

//Inputting stars and rocket
Star[] stars = new Star [10];
Rocket rocket;

//Setting up direction vectors
PVector right = new PVector(.1, 0);
PVector left = new PVector(-.1, 0);
PVector up = new PVector(0, -.1);
PVector down = new PVector(0, .1);
PVector halt = new PVector(0, 0);

//Setting boolean to see if arrow is pressed
boolean move = false;

void setup() {
  size(800, 800);

  //Stars array
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  rocket = new Rocket();
}

void draw() {
  background(0, 25, 51);

  //Drawing stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].fall();
    stars[i].show();
  }

  //Drawing rocket
  rocket.update();
  rocket.checkEdges();
  rocket.display();

  //Detecting arrow key press and moving rocket to said direction
  if (keyPressed == true) {
    move = true;
    if (keyCode == RIGHT) {
      rocket.drive(right);
    }
    if (keyCode == LEFT) {

      rocket.drive(left);
    }
    if (keyCode == UP) {
      rocket.drive(up);
    }
    if (keyCode == DOWN) {
      rocket.drive(down);
    }
  }

  //If no key is pressed, no acceleration and rocket will slow down
  if (keyPressed == false) {
    move = false;
  }
}
