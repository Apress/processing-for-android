// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PShape frame;

void setup() {
  fullScreen(STEREO);
  frame = loadShape("dodecahedron.obj");  
  prepare(frame, 500);
}

void draw() {
  background(180);    
  lights();
  translate(width/2, height/2);
  eye();
  shape(frame);
}

void prepare(PShape sh, float s) {
  PVector min = new PVector(+10000, +10000, +10000);
  PVector max = new PVector(-10000, -10000, -10000);  
  PVector v = new PVector();
  for (int i = 0; i < sh.getChildCount(); i++) {
    PShape child = sh.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++) {
      child.getVertex(j, v);
      min.x = min(min.x, v.x); 
      min.y = min(min.y, v.y); 
      min.z = min(min.z, v.z);
      max.x = max(max.x, v.x); 
      max.y = max(max.y, v.y); 
      max.z = max(max.z, v.z);
    }
  }
  PVector center = PVector.add(max, min).mult(0.5f);
  sh.translate(-center.x, -center.y, -center.z);  
  float maxSize = max(sh.getWidth(), sh.getHeight(), sh.getDepth());
  float factor = s/maxSize;
  sh.scale(factor);  
}