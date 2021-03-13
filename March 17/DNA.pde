//DNA Class

public class DNA {
  int trashnumber;

  //Random kinds of trash
  DNA () {
    trashnumber = int(random(0, 4));
  }

  DNA getDNA() {
    DNA dna = new DNA();
    return dna;
  }
  
  //Trashnumber to be used in Trash class
  int getTrashNumber() {
    return trashnumber;
  }
}
