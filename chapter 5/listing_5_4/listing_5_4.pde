// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  background(180);
  strokeWeight(10 * displayDensity);
  stroke(100, 100);
}

void draw() {  
  if (mousePressed) line(pmouseX, pmouseY, mouseX, mouseY);
}

  