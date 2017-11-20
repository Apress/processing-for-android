// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PShape frame;
PShape track;

public void setup() {
  fullScreen(STEREO);
  
  frame = loadShape("dodecahedron.obj");  
  prepare(frame, 500);
    
  track = createShape();
  track.beginShape(QUAD_STRIP);
  track.fill(#2D8B47);
  for (int i = 0; i <= 40; i++) {
    float a = map(i, 0, 40, 0, TWO_PI);
    float x0 = 1000 * cos(a);
    float z0 = 1000 * sin(a);
    float x1 = 1400 * cos(a);
    float z1 = 1400 * sin(a);  
    track.vertex(x0, 0, z0);
    track.vertex(x1, 0, z1);
  }  
  track.endShape();
}

public void draw() {
  background(255);
  translate(width/2, height/2);
  
  directionalLight(200, 200, 200, 0, +1, -1);
  
  translate(1200, +300, 500);
  rotateY(millis()/10000.0);
  shape(track);
  
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