// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  noFill();
  colorMode(HSB, 360, 99, 99);
  strokeWeight(2);
  stroke(210);  
  background(0, 0, 99);
}

void draw() {
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    if (random(1) < 0.05) {
      
      PVector dir = new PVector(mouseX - pmouseX, mouseY - pmouseY);
      float a = dir.heading();
      drawSpiral(mouseX, mouseY, a);
    }
    if (random(1) < 0.05) {
      drawFlower(mouseX, mouseY);
    }
  }
}

void keyPressed() {
  background(0, 0, 99);
}