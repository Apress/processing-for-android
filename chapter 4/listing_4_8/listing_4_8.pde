// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(800, 480);
float x = width/2;
float y = height/2;
stroke(0, 150);
strokeWeight(10);
strokeJoin(ROUND);
strokeCap(ROUND);
beginShape(LINES); 
for (int i = 0; i < 100; i++) {
  float px = x;
  float py = y;
  float nx = x + (random(0, 1) > 0.5? -1: +1) * 50;
  float ny = y + (random(0, 1) > 0.5? -1: +1) * 50;
  if (0 <= nx && nx < width && 0 <= ny && ny < height) {
    vertex(px, py);
    vertex(nx, ny);
    x = nx; 
    y = ny;
  }
}
endShape();  