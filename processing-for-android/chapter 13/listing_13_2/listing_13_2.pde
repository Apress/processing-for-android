// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);
  fill(#AD71B7);
}

void draw() {
  background(#81B771);
  float t = millis()/1000.0;
  float ex = width/2 + 500 * cos(t); 
  float ey = height/2 + 500 * sin(t); 
  float ez = 1000 + 100 * cos(millis()/1000.0);  
  camera(ex, ey, ez, width/2, height/2, 0, 0, 1, 0);
  lights();
  translate(width/2, height/2);
  box(300);
}