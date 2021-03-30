void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  
  //initializing PVectors
  PVector p1 = new PVector(50,20);
  PVector p2 = new PVector(50,450);
  PVector p3 = new PVector (450, 20);
  PVector v = new PVector(mouseX,mouseY);
  
  //drawing lines
  stroke(0);
  strokeWeight(2);
  line(p1.x,p1.y,p2.x,p2.y);
  line(p1.x,p1.y,p3.x,p3.y);
  line(p1.x,p1.y,v.x,v.y);
  fill(0);
  ellipse(p3.x, p3.y, 8, 8);
  ellipse(p1.x,p1.y,8,8);
  ellipse(p2.x,p2.y,8,8);
  ellipse(v.x,v.y,8,8);
  
  //calling function
  PVector vm = scalarProjection(v,p1,p2);
  strokeWeight(4);
  stroke(255, 0, 0);
  fill(255,0,0);
  line(p1.x, p1.y, vm.x, vm.y);
  ellipse(vm.x, vm.y,16,16);
}


PVector scalarProjection(PVector v, PVector p1, PVector p2) {

  PVector p1v = PVector.sub(v, p1);
  PVector p1p2 = PVector.sub(p2, p1);
  p1p2.normalize(); // Normalize the line
  p1p2.mult(p1v.dot(p1p2));
  
  //getting the degree of angle from origin
  float d = p1v.dot(p2);
  float theta = degrees(acos(d/(p1v.mag() * p2.mag())));
  println(theta);
 
  //return projection
  PVector vm = PVector.add(p1, p1p2);
  return vm;
}
