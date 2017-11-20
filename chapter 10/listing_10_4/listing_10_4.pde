// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  if (wearSquare()) rectMode(CENTER);
}

void draw() {
  background(0);
  if (wearAmbient()) {
    stroke(255);
    noFill();   
  } else {
    noStroke();
    fill(255); 
  }
  float scale = map(second(), 0, 59, 0, 1);
  if (wearRound()) {
    ellipse(width/2, height/2, scale * width, scale * width);
  } else {
    rect(width/2, height/2, scale * width, scale * height);
  }
}