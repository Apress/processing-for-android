// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300);  
beginShape(QUAD_STRIP);
int numQuads = 10;
for (int i = 0; i <= numQuads; i++) {
  float a = map(i, 0, numQuads, 0, TWO_PI);
  float x0 = width/2 + 100 * cos(a);
  float y0 = height/2 + 100 * sin(a);
  float x1 = width/2 + 130 * cos(a);
  float y1 = height/2 + 130 * sin(a);    
  vertex(x0, y0);
  vertex(x1, y1);
}
endShape();