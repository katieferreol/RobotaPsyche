//General class

//Calling all classes
ArrayList<Trash> trash = new ArrayList<Trash>();
FlowField f;
Duck d;

//Miscellaneous variables
PImage background;
int trashnumber = 4;

void setup() {
  size (1000, 800);
  background = loadImage("background.jpg");

  //All classes
  f = new FlowField(5);
  d = new Duck();
  for (int i = 0; i < 7; i++) {
    trash.add(new Trash(random(100, 850), random(250, 550)));
  }
}


void draw() {
  background(background);

  //Moving the duck
  d.move();

  //For loop for trash that was called in setup
  for (int i = trash.size()-1; i>=0; i--) {

    Trash t = trash.get(i);

    t.checkBorders();
    t.update();
    t.display();
    t.follow(f);
    t.getDuck();

    //Get the number of eaten trash/bread
    if (t.isDead()) {
      trashnumber = trash.get(i).trashnumber;
      trash.remove(t);
    }

    //Return to normal duck after two seconds
    if ((trashnumber == 0 || trashnumber == 1 || trashnumber == 2) && frameCount % 200 == 0) {
      trashnumber = 4;
    }
    if (trashnumber == 3 && frameCount % 200 == 0) {
      trashnumber = 4;
    }
  }

  //For loop for added trash so it only adds one
  for (int i = 0; i < 1; i++) {

    Trash t2 = trash.get(i);

    t2.checkBorders();
    t2.update();
    t2.display();
    t2.follow(f);
    t2.getDuck();

    //Adds a new trash every two seconds
    if (frameCount % 200 == 0) {
      trash.add(new Trash(random(50, 850), random(300, 550)));
    }

    //Get the number of eaten trash/bread
    if (t2.isDead()) {
      trashnumber = trash.get(i).trashnumber;
      trash.remove(t2);
    }

    //Return to normal duck after two seconds
    if ((trashnumber == 0 || trashnumber == 1 || trashnumber == 2) && frameCount % 200 == 0) {
      trashnumber = 4;
    }
    if (trashnumber == 3 && frameCount % 200 == 0) {
      trashnumber = 4;
    }
  }
  
  //Display the duck correlated to what trash/bread it ate
  d.display(trashnumber);
  
  //duckling following the duck
  d.duckling();
  
  println(trashnumber);
}
