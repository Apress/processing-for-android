// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300); 
int numTriangles = 10;
beginShape(TRIANGLE_FAN);
vertex(width/2, height/2);
for (int i = 0; i <= numTriangles; i++) {
  float a = map(i, 0, numTriangles, 0, TWO_PI);
  float x = width/2 + 100 * cos(a);
  float y = height/2 + 100 * sin(a);
  vertex(x, y);
}
endShape();