// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300, P2D);
colorMode(HSB, 360, 100, 100);
background(0, 0, 100);
translate(width/2, height/2);
noStroke();
beginShape(TRIANGLE_FAN);
fill(TWO_PI, 0, 100);
vertex(0, 0);
for (int i = 0; i <= 10; i++) {
  float a = map(i, 0, 10, 0, 360);
  float x = 150 * cos(radians(a));
  float y = 150 * sin(radians(a));
  fill(a, 100, 100);
  vertex(x, y);
}
endShape();