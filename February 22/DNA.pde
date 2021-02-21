class DNA {
  int size;
  color colors;
  int foodchain;

  DNA() {
    size = int(random(5, 30));
    if (size < 15 && size >= 5) {
      colors = color(154, 205, 50);
      foodchain = 0;
    }
    if (size < 20 && size >= 15) {
      colors = color(255, 140, 0);
      foodchain = 1;
    }
    if (size < 25 && size >= 20) {
      colors = color(220, 220, 220);
      foodchain = 2;
    }
    if (size <= 30 && size >= 25) {
      colors = color(65, 105, 225);
      foodchain = 3;
    }
  }

  void getSize() {
    strokeWeight(size);
  }

  void getColor() {
    stroke(colors);
  }
}
