class DNA {
  int fishnumber;

  DNA () {
    fishnumber = int(random(0,4));
  }

  DNA getDNA() {
    DNA dna = new DNA();
    return dna;
  }

  int getFishNumber() {
    return fishnumber;
  }
}
