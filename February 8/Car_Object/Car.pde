class Car {

  float x;
  float y;
  int value = 250;
  float diameter;

  Car(float tempD) {
    x = 0;
    y = 0;
    diameter = tempD;
  }

  void display() {
    noStroke();
    fill(255);
    rect(30+x, 75+y, 60, 100);
    fill(255, 0, 0);
    triangle(30+x, 75+y, 60+x, 20+y, 90+x, 75+y);
    triangle(90+x, 175+y, 90+x, 120+y, 120+x, 175+y);
    triangle(0+x, 175+y, 30+x, 120+y, 30+x, 175+y);
  }

  void move() {
    if (keyPressed) {
      if (keyCode == LEFT) {
        x--;
      }
      if (keyCode == RIGHT) {
        x++;
      }
      if (keyCode == UP) {
        y++;
      }
      if (keyCode == DOWN) {
        y--;
      }
    }
  }
}
