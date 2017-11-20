// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

float angle = 0;

void setup() {
  fullScreen(P3D);
  fill(#AD71B7);
  noStroke();
}

void draw() {
  background(#81B771);
  float fov = radians(map(cos(millis()/1000.0), -1, +1, 10, 80));
  float ratio = float(width)/height; 
  perspective(fov, ratio, 1, 2000);  
  lights();
  translate(width/2, height/2);
  rotateY(angle);
  rotateX(angle*2);
  box(300);
  angle += 0.01;
}