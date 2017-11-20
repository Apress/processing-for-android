// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  strokeCap(ROUND);
  stroke(255);
  noFill();
}

void draw() {
  background(0);  
  if (wearAmbient()) strokeWeight(1);
  else strokeWeight(10);
  float angle = map(millis() % 60000, 0, 60000, 0, TWO_PI);
  arc(width/2, height/2, width/2, width/2, 0, angle); 
}