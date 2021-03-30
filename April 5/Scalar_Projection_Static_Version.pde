PVector p1 = new PVector(50, 20);
PVector p2 = new PVector(50, 450);
PVector p3 = new PVector (450, 20);
PVector v = new PVector(mouseX, mouseY);

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
