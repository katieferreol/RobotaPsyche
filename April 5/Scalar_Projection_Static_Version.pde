size(500, 500);

//initializing PVectors
PVector p1, p2, p3, v;
p1 = new PVector(0, 0);
p2 = new PVector(0, 450);
p3 = new PVector (450, 0);
v = new PVector(p3.x/2, p2.y/2);

PVector B = PVector.sub(p2, p1);
B.normalize();
PVector vm = B.mult(v.dot(B));

//getting the degree of angle from origin
float d = v.dot(B);
float theta = degrees(acos(d/(v.mag() * B.mag())));
println(theta, vm);
