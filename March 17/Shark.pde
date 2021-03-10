//Shark class

class Shark {
  PImage shark;
  int sharkx;
  int sharky;
  int speed = 3;

  Shark () {
    shark = loadImage("shark.png");
    sharkx = -200;
    sharky = 200;
  }

  //moving using arrow keys, what I use in the vehicle class to avoid lag
  void move() {
    if (keyPressed) {
      if (keyCode == RIGHT) {
        sharkx+=speed;
      } 
      if (keyCode == LEFT) {
        sharkx-=speed;
      } 
      if (keyCode == UP) {
        sharky-=speed;
      } 
      if (keyCode == DOWN) {
        sharky+=speed;
      }
    }
  }

  //moving of shark image, if I used this in the vehicle class it lags
  void display() {
    pushMatrix();
    translate(-350, -100);
    image(shark, sharkx, sharky, 400, 200);
    popMatrix();
    if (keyPressed) {
      if (keyCode == DOWN) {
        sharky+=speed;
      }
      if (keyCode == LEFT) {
        sharkx-=speed;
      }
      if (keyCode == RIGHT) {
        sharkx+=speed;
      }
      if (keyCode == UP) {
        sharky-=speed;
      }
    }
  }

  //return x coordinate of shark
  int getSharkX() {
    return sharkx;
  }

  //return y coordinate of shark
  int getSharkY() {
    return sharky;
  }
}
