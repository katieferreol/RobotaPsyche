class Star {
  float x = random(-800, -50);
  float y = random(height);
  float xspeed = random(5, 10);

  //makes stars move from left to right
  void fall() {
    x = x + xspeed;
    if (x > width) {
      x = random(-800, -100);
    }
  }

  //makes stars appear or disappear
  void show() {
    //using ellipse
    fill(255);
    ellipse(x, y, 10, 10);
  }
}
