// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

ArrayList<Branch> branches = new ArrayList<Branch>();

void setup() {
  size(500, 500); 
  noStroke();
  branches.add(new Branch());
  background(155, 211, 247); 
}

void draw() {
  for (int i = 0; i < branches.size(); i++) {
    Branch branch = branches.get(i);
    branch.update();
    branch.display();    
  }
}

class Branch {
  PVector position;
  PVector velocity;
  float diameter;
  
  Branch() {
    position = new PVector(width/2, height);
    velocity = new PVector(0, -1);
    diameter = width/15.0;
  }
  Branch(Branch parent) {
    position = parent.position.copy();
    velocity = parent.velocity.copy();
    diameter = parent.diameter / 1.4142;
    parent.diameter = diameter;
  }
  void update() {
    if (1 < diameter) {
      position.add(velocity);
      float opening = map(diameter, 1, width/15.0, 1, 0);
      float angle = random(PI - opening * HALF_PI, TWO_PI + opening * HALF_PI);
      PVector shake = PVector.fromAngle(angle);
      shake.mult(0.1);
      velocity.add(shake);
      velocity.normalize();
      if (random(0, 1) < 0.04) branches.add(new Branch(this));      
    }
  }
  void display() {
    if (1 < diameter) {
      fill(175, 108, 44, 50);
      ellipse(position.x, position.y, diameter, diameter);
    }
  }
}