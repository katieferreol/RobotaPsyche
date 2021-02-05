class Car {

  PVector location;
  int value = 250;
  float diameter;

  Car(float tempD) {
    location = new PVector(0,0);
    diameter = tempD;
  }

  void display() {
    noStroke();
    fill(255);
    rect(30+location.x, 75+location.y, 60, 100);
    fill(255, 0, 0);
    triangle(30+location.x, 75+location.y, 60+location.x, 20+location.y, 90+location.x, 75+location.y);
    triangle(90+location.x, 175+location.y, 90+location.x, 120+location.y, 120+location.x, 175+location.y);
    triangle(0+location.x, 175+location.y, 30+location.x, 120+location.y, 30+location.x, 175+location.y);
  }

  void move() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        location.x--;
      }
      if (keyCode == RIGHT) {
        location.x++;
      }
      if (keyCode == UP) {
        location.y--;
      }
      if (keyCode == DOWN) {
        location.y++;
      }
    }
  }
}
