//initializing PVectors
  PVector p1, p2, p3, v;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  
  p1 = new PVector(0,0);
  p2 = new PVector(0,450);
  p3 = new PVector (450, 0);
  v = new PVector (p3.x/2, p2.y/2);
  
  //drawing lines
  translate(20,20);
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
  PVector vm = scalarProjection();
  strokeWeight(4);
  stroke(255, 0, 0);
  fill(255,0,0);
  line(p1.x, p1.y, vm.x, vm.y);
  ellipse(vm.x, vm.y,16,16);
}


PVector scalarProjection() {

  PVector B = PVector.sub(p2, p1);
  B.normalize();
  PVector vm = B.mult(v.dot(B));
  
  //getting the degree of angle from origin
  float d = v.dot(B);
  float theta = degrees(acos(d/(v.mag() * B.mag())));
  println(theta);
 
  //return projection
  return vm;
}
