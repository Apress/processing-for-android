// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen();
  frameRate(25);
  noStroke();  
  fill(#FF03F3);
}

void draw() {
  background(#6268FF);
  float maxRad = 50 * displayDensity;  
  for (int i = 0; i < width/maxRad; i++) {
    float x = map(i, 0, int(width/maxRad) - 1, 0, width);
    for (int j = 0; j < height/maxRad; j++) {
      float y = map(j, 0, int(height/maxRad) - 1, 0, height);
      float t = millis() / 1000.0;
      float r = maxRad * cos(t + 0.1 * PI * i * j);
      ellipse(x, y, r, r);
    }
  }
}