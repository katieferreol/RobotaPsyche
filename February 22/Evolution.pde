public class Particle {
  PVector location = new PVector(random(width - 1), random(height - 1));
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  PVector prevlocation = location.copy();
  float maxSpeed;
  float maxForce;
  DNA gene;

  Particle(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    maxSpeed = 2;
    maxForce = 0.10;
    gene = new DNA();
  }

  //keeping previous location
  void update() {
    prevlocation.x = location.x; 
    prevlocation.y = location.y; 

    // apply acceleration and velocity
    velocity.add(acceleration); 
    velocity.limit(maxSpeed);
    location.add(velocity); 

    // handle window edges
    if (location.x >= width) location.x = prevlocation.x = 0;
    if (location.x < 0) location.x = prevlocation.x = width - 1;
    if (location.y >= height) location.y = prevlocation.y = 0;
    if (location.y < 0) location.y = prevlocation.y = height - 1;

    // reset acceleration
    acceleration.mult(0);
  }

  //adding force to acceleration
  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }

  //displaying "ants" (lines)
  void show() {
    //stroke(139, 0, 0);
    //strokeWeight(5);
    line(location.x, location.y, prevlocation.x, prevlocation.y);
  }

  //make ants follow a certain force, whether Perlin noise or following mouse
  void follow(FlowField flow) {
    // Look up the vector at that spot in the flow field
    PVector desired = flow.lookup(location);
    desired.mult(maxSpeed);

    // Steering is desired minus velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
 
 void separate (ArrayList<Particle> particles) {
    float desiredseparation = 20; // how close is too close.
    int count = 0;
    PVector sum = new PVector(0, 0);

    for (Particle other : particles) {

      // What is the distance between me and another Particle?
      float d = PVector.dist(location, other.location);

      // If the distance is zero we are looking at ourselves; exclude that
      if ((d > 0) && (d < desiredseparation)) {

        // calculate the location of this vehicle
        PVector diff = PVector.sub(location, other.location); 
        diff.normalize();

        // We'll need the average, so add this location to the sum 
        // of all locations and increment the count.
        sum.add(diff); 
        count++;
      }
    } // end of loop over all particles

    // now calculate the average, 
    // figure out the force
    // and apply the force:
    if (count > 0) { // If zero then no one is too close
      sum.div(count); // sum is now our desired velocity

      // Scale average to maxspeed
      sum.setMag(maxSpeed);

      // Apply Reynolds’s steering formula:
      // error is our current velocty minus our desired velocity
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);

      // Apply the force to the Particle’s
      // acceleration.
      applyForce(steer);
    }
  }

  void getDNA() {
    gene.getSize();
    gene.getColor();
  }
  
  
}
