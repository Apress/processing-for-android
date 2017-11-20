// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

KetaiSensor sensor;
float rotationZ, offsetZ;
PMatrix2D rotMatrix = new PMatrix2D();
PVector forward = new PVector(0, -1);
PVector forwardRot = new PVector();
ArrayList<Asteroid> field;
float speed = 2;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  sensor = new KetaiSensor(this);
  sensor.start();
  ellipseMode(CENTER);
  noStroke();
  field = new ArrayList<Asteroid>();
  for (int i = 0; i < 100; i++) {
    field.add(new Asteroid());
  }
}

void draw() {
  background(0);
  
  boolean hit = false;  
  float angle = rotationZ - offsetZ;
  rotMatrix.reset();
  rotMatrix.rotate(angle);
  rotMatrix.mult(forward, forwardRot);
  forwardRot.mult(speed);
  for (Asteroid a: field) {
    a.update(forwardRot);
    a.display();
    if (a.hit(width/2, height/2)) hit = true;
  }
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  if (hit) {
    fill(252, 103, 43);
  } else {
    fill(67, 125, 222);
  }
  float h = height * 0.2;
  triangle(0, -h/2, h/3, +h/2, -h/3, +h/2);
  popMatrix();
}

void onGyroscopeEvent(float x, float y, float z) {
  rotationZ += 0.1 * z;
}

void mousePressed() {
  offsetZ = rotationZ;
}

class Asteroid {
  float x, y, r;
  color c;
  Asteroid() {
    c = color(random(255), random(255), random(255));
    r = height * random(0.05, 0.1);
    x = random(-2 * width, +2 * width);
    y = random(-2 * height, +2 * height);
  }
  void update(PVector v) {
    x -= v.x;
    y -= v.y;
    if (x < -2 * width || 2 * width < x || 
        y < -2 * height || 2 * height < y) {
      x = random(-2 * width, +2 * width);
      y = random(-2 * height, +2 * height);      
    }
  }
  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
  boolean hit(float sx, float sy) {
    return dist(x, y, sx, sy) < r;
  }
}