// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);
  fill(120);
}

void draw() {
  background(157);
  float x = map(cos(millis()/1000.0), -1, +1, 0, width);
  translate(x, height/2);
  box(200);
}