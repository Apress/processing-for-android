// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  size(300, 300);  
}

void draw() {
  background(190);
  translate(width/2, height/2);
  float r = width/2;
  beginShape();
  circleVertices(0, 0, r, 0, TWO_PI);  
  makeContour(0, 0, r/4);
  makeContour(-r/2, -r/2, r/4);
  makeContour(+r/2, -r/2, r/4);
  makeContour(-r/2, +r/2, r/4);
  makeContour(+r/2, +r/2, r/4);  
  endShape();
}

void makeContour(float xc, float yc, float r) {
  beginContour();
  circleVertices(xc, yc, r, TWO_PI, 0);
  endContour();
}

void circleVertices(float xc, float yc, float r, float a0, float a1) {
  for (int i = 0; i <= 30; i++) {
    float a = map(i, 0, 30, a0, a1);
    vertex(xc + r * cos(a), yc + r * sin(a));
  }
}