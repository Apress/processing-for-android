// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  strokeWeight(20);  
  fill(#3B91FF);
}

void draw() {
  background(#FFD53B);
  stroke(#3B91FF);
  line(0, 0, mouseX, mouseY);
  line(width, 0, mouseX, mouseY);
  line(width, height, mouseX, mouseY);
  line(0, height, mouseX, mouseY);
  noStroke();
  ellipse(mouseX, mouseY, 200, 200);
}