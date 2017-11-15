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
  float f = map(cos(millis()/1000.0), -1, +1, 0.1, 5);
  scale(f);  
  box(200);
}