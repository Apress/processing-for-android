// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

color bg = 150;

void setup() {
  size(200, 200);
}

void draw() {
  background(bg);
  ellipse(mouseX, mouseY, 100, 100);
}