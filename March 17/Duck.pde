//Duck class

class Duck {
  PImage normalduck;
  PImage happyduck;
  PImage sickduck;
  
  boolean left = false;
  PImage duckL;
  PImage happyduckL;
  PImage sickduckL;
  
  PImage duckling;
  
  int speed = 2;
  float locx;
  float locy;


  Duck () {
    normalduck = loadImage("duck0.png");
    happyduck = loadImage("duck1.png");
    sickduck = loadImage("duck2.png");
    
    duckL = loadImage("duck0left.png");
    happyduckL = loadImage("duck1left.png");
    sickduckL = loadImage("duck2left.png");
    duckling = loadImage("duckling.png");
    
    locx = 500;
    locy = 500;
  }


  //Movement function for Trash class
  void move() {
    if (keyPressed) {
      if (keyCode == DOWN) {
        locy+=speed;
        if (locy > 600) {
          locy-=speed;
        }
      }
      if (keyCode == LEFT) {
        locx-=speed;
        left = true;
        if (locx < 10) {
          locx+=speed;
        }
      }
      if (keyCode == RIGHT) {
        locx+=speed;
        left = false;
        if (locx > 850) {
          locx-=speed;
        }
      }
      if (keyCode == UP) {
        locy-=speed;
        if (locy < 200) {
          locy+=speed;
        }
      }
    }
  }

  //Moving of duck image (depends on what trash the duck eats)
  void display(int trashnumber) {
    pushMatrix();
    translate(-50, -50);
    if (left == false) {
      if (trashnumber == 0 || trashnumber == 1 || trashnumber == 2) {
        image(sickduck, locx, locy, 130, 130);
      } else if (trashnumber == 3) {
        image(happyduck, locx, locy, 130, 130);
      } else {
        image(normalduck, locx, locy, 130, 130);
      }
    }
    if (left == true) {
      if (trashnumber == 0 || trashnumber == 1 || trashnumber == 2) {
        image(sickduckL, locx, locy, 130, 130);
      } else if (trashnumber == 3) {
        image(happyduckL, locx, locy, 130, 130);
      } else {
        image(duckL, locx, locy, 130, 130);
      }
    }
    popMatrix();
  }
  
  //Duckling following the duck
  void duckling() {
    image(duckling, locx-130, locy+20, 60, 50);
  }

  //Return x coordinate of loc
  float getlocx() {
    return locx;
  }

  //Return y coordinate of loc
  float getlocy() {
    return locy;
  }
}
