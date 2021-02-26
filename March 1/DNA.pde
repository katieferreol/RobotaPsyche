class DNA {
  float size;
  float speed;
  int fishnumber = int(random(4));
  PImage[] fishes;

  DNA() {
    fishes = new PImage[4];
    for (int i = 0; i < 4; i++) {
      fishes[i] = loadImage("fish"+ i +".png");
    }
  }

  PImage getFish() {
    return fishes[fishnumber];
  }

  float getSize() {
    if (fishnumber == 0) {
      size = 0.4;
    } else if (fishnumber == 1) {
      size = 0.6;
    } else if (fishnumber == 2) {
      size = 0.6;
    } else if (fishnumber == 3) {
      size = 0.9;
    }
    return size;
  }

  int getFishNumber() {
    return fishnumber;
  }
}
