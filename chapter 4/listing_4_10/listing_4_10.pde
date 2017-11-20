// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

Circle[] circles = new Circle[100];

void setup() {
  size(800, 800);
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  translate(width/2, height/2);
  rotate(frameCount * 0.01);
  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
  }  
}

class Circle {
  float x, y, r, w;
  color fc, sc;
  Circle() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);
    r = random(10, 100);
    w = random(2, 10);
    fc = color(random(255), random(255), random(255));
    sc = color(random(255), random(255), random(255));
  }
  void display() {
    pushStyle();
    stroke(sc);
    strokeWeight(w);
    fill(fc);
    ellipse(x, y, r, r);
    popStyle();
  }
}