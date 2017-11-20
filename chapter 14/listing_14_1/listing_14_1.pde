// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

void setup() {
  fullScreen(STEREO);
  fill(#AD71B7);  
}

void draw() {
  background(#81B771);
  translate(width/2, height/2);
  lights();
  rotateY(millis()/1000.0);
  box(300);
}