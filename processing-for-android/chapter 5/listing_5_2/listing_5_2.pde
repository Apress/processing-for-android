// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

boolean drawing = false;
float radius;

void setup() {
  fullScreen();
  noStroke();
  fill(100, 100);
}

void draw() {
  background(255);
  if (drawing) {
    ellipse(mouseX, mouseY, radius, radius);
  }
}

void mousePressed() {
  drawing = true;
  radius = 70 * displayDensity;
}

void mouseReleased() {  
  drawing = false;
}

void mouseDragged() {
  radius += 0.5 * displayDensity;
}