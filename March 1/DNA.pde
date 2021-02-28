class DNA {
  int fishnumber;

  DNA (int fno) {
    fishnumber = fno;
  }

  DNA getDNA() {
    DNA dna = new DNA(fishnumber);
    return dna;
  }

  int getFishNumber() {
    return fishnumber;
  }
}
