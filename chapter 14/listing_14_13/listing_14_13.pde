// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PShape cubes;
PShape grid;
PMatrix3D eyeMat = new PMatrix3D();
float tx, tz;
float step = 10;
PVector planeDir = new PVector();

public void setup() {
  fullScreen(STEREO);
  
  grid = createShape();
  grid.beginShape(LINES);
  grid.stroke(255);
  for (int x = -10000; x < +10000; x += 500) {
    grid.vertex(x, +200, +10000);
    grid.vertex(x, +200, -10000);
  }
  for (int z = -10000; z < +10000; z += 500) {
    grid.vertex(+10000, +200, z);
    grid.vertex(-10000, +200, z);      
  }
  grid.endShape();    
  
  cubes = createShape(GROUP);
  float v = 5 * width;
  for (int i = 0; i < 50; i++) {
    float x = random(-v, +v);    
    float z = random(-v, +v);
    float s = random(100, 300);
    float y = +200 - s/2;
    PShape sh = createShape(BOX, s);
    sh.setFill(color(#FFBC6A));
    sh.translate(x, y, z);    
    cubes.addChild(sh);
  }  
}

void calculate() {
  getEyeMatrix(eyeMat);
  if (mousePressed) {
    planeDir.set(eyeMat.m02, 0, eyeMat.m22);
    float d = planeDir.mag();
    if (0 < d) {
      planeDir.mult(1/d);
      tx -= step * planeDir.x;
      tz -= step * planeDir.z;      
    }    
  }
}

public void draw() {
  background(0);
  translate(width/2, height/2);
  pointLight(50, 50, 200, 0, 1000, 0);
  directionalLight(200, 200, 200, 0, +1, -1);
  translate(tx, 0, tz);
  shape(grid);
  shape(cubes);
}