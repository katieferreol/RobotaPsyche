//STAR CLASS

class Star {
  float x = random(-800, -50);
  float y = random(height);
  float xspeed = random(5, 10);

  //Makes stars move from left to right
  void fall() {
    x = x + xspeed;
    if (x > width) {
      x = random(-800, -100);
    }
  }

  //Mkes stars appear or disappear
  void show() {
    fill(255);
    ellipse(x, y, 15, 15);
  }
}
