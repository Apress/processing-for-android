// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P2D);
  background(255);  
  noFill();
  rectMode(CENTER);
}

void draw() {  
  float w = 2*(width/2-mouseX);
  rect(width/2, height/2, w, w/width * height);
}