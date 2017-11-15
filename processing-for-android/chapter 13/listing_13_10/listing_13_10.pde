// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);
}

void draw() {
  background(150);  
  lights();
  translate(width/2, height/2);
  rotateX(QUARTER_PI);
  beginShape(QUADS);
  float t = 0.0001 * millis();
  for (int i = 0; i < 50; i++) {
    for (int j = 0; j < 50; j++) {
      float x0 = map(i, 0, 50, -width/2, width/2);
      float y0 = map(j, 0, 50, -height/2, height/2);
      float x1 = x0 + width/50.0;
      float y1 = y0 + height/50.0; 
      float z1 = 200 * noise(0.1 * i, 0.1 * j, t);
      float z2 = 200 * noise(0.1 * (i + 1), 0.1 * j, t);
      float z3 = 200 * noise(0.1 * (i + 1), 0.1 * (j + 1), t);
      float z4 = 200 * noise(0.1 * i, 0.1 * (j + 1), t);
      vertex(x0, y0, z1);
      vertex(x1, y0, z2);
      vertex(x1, y1, z3);
      vertex(x0, y1, z4);
    }
  }
  endShape();
}