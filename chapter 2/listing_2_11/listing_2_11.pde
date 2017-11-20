// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300);
colorMode(HSB, TWO_PI, 1, 1);
float centerX = width/2;
float centerY = height/2;
float maxRad = width/2;
strokeWeight(2);
stroke(0, 0, 1);
for (int i = 0; i < 6; i++) {
  float r0 = map(i, 0, 6, 0, 1);
  float r1 = map(i + 1, 0, 6, 0, 1);
  beginShape(QUADS);
  for (int j = 0; j <= 10; j++) {
    float a0 = map(j, 0, 10, 0, TWO_PI);
    float a1 = map(j + 1, 0, 10, 0, TWO_PI);  
    float x0 = centerX + maxRad * r0 * cos(a0);
    float y0 = centerY + maxRad * r0 * sin(a0);
    float x1 = centerX + maxRad * r1 * cos(a0);
    float y1 = centerY + maxRad * r1 * sin(a0);  
    float x2 = centerX + maxRad * r1 * cos(a1);
    float y2 = centerY + maxRad * r1 * sin(a1);
    float x3 = centerX + maxRad * r0 * cos(a1);
    float y3 = centerY + maxRad * r0 * sin(a1);
    fill(a0, r0, 1);
    vertex(x0, y0);
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
  }
  endShape();
}