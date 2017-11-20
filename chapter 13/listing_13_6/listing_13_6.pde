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
  translate(width/2, height/2);
  rotateY(millis()/1000.0);
  box(200);
}