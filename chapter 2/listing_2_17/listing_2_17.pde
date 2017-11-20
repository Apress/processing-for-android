// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  size(600, 160);  
  frameRate(1);
}

void draw() {
  background(180);
  drawSpiral(100, 80, 0);
  drawSpiral(300, 80, QUARTER_PI);
  drawSpiral(500, 80, PI);
}

void drawSpiral(float posx, float posy, float angle) {
  pushMatrix();
  translate(posx, posy);  
  rotate(angle + PI);
  noFill();
  beginShape();
  float maxt = random(5, 20);
  float maxr = random(50, 70);
  float x0 = maxr * cos(1);
  float y0 = maxr * sin(1);
  for (float t = 1; t < maxt; t += 0.1) {
    float r = maxr/t;
    float x = r  * cos(t) - x0;
    float y = r  * sin(t) - y0;
    vertex(x, y);
  }
  endShape();
  popMatrix();
}