// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300);
noFill();
translate(width/2, height/2);
beginShape();
float maxt = 10;
float maxr = 150;
for (float t = 1; t < maxt; t += 0.1) {
  float r = maxr/t;
  float x = r  * cos(t);
  float y = r  * sin(t);
  vertex(x, y);
}
endShape();