// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PShape base;

void setup() {
  fullScreen(STEREO);
  createBase(300, 70, 20);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  directionalLight(200, 200, 200, 0, +1, -1);
  drawBase();
  drawBox();
}

void drawBase() {
  pushMatrix();
  translate(0, +300, 0);
  shape(base);
  popMatrix();
}  

void drawBox() {
  pushMatrix();
  translate(0, +100, 0);
  noStroke();
  box(120);
  popMatrix();  
}

void createBase(float r, float h, int ndiv) {
  base = createShape(GROUP);
  PShape side = createShape();
  side.beginShape(QUAD_STRIP);
  side.noStroke();
  side.fill(#59C5F5);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    side.vertex(x, +h/2, z);
    side.vertex(x, -h/2, z);    
  }
  side.endShape();
  PShape top = createShape();
  top.beginShape(TRIANGLE_FAN);
  top.noStroke();
  top.fill(#59C5F5);
  top.vertex(0, 0, 0);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    top.vertex(x, -h/2, z); 
  }  
  top.endShape();  
  base.addChild(side);
  base.addChild(top);
}