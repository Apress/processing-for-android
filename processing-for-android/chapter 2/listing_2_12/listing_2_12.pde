// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

float angle;

void setup() {
  size(400, 400);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(170);
  translate(width/2, height/2);
  rotate(angle);
  rect(0, 0, 100, 100);
  pushMatrix();
  translate(150, 0);  
  rotate(2 * angle);
  scale(0.5);
  rect(0, 0, 100, 100);
  popMatrix();
  translate(0, 180);
  ellipse(0, 0, 30, 30);
  angle += 0.01;
}