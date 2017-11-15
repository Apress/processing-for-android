// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

float angle = 0;
PShape cube;

void setup() {
  fullScreen(MONO);
  PImage tex = loadImage("mosaic.jpg");
  cube = createShape(BOX, 400);
  cube.setTexture(tex);
}

void draw() {
  background(#81B771);
  translate(width/2, height/2);
  lights();
  rotateY(angle);
  rotateX(angle*2);
  shape(cube);
  angle += 0.01;
}