// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

void setup() {
  fullScreen(STEREO); 
  strokeWeight(2);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  lights();
  drawAxis();
  drawGrid();
}

void drawAxis() {
  line(0, 0, 0, 200, 0, 0);
  drawBox(200, 0, 0, 50, #E33E3E);  
  line(0, 0, 0, 0, -200, 0);
  drawBox(0, -200, 0, 50, #3E76E3);
  line(0, 0, 0, 0, 0, 200);
  drawBox(0, 0, 200, 50, #3EE379);  
}

void drawGrid() {
  beginShape(LINES);
  stroke(255);
  for (int x = -10000; x < +10000; x += 500) {
    vertex(x, +500, +10000);
    vertex(x, +500, -10000);
  }
  for (int z = -10000; z < +10000; z += 500) {
    vertex(+10000, +500, z);
    vertex(-10000, +500, z);      
  }
  endShape();    
}

void drawBox(float x, float y, float z, float s, color c) {
  pushStyle();
  pushMatrix();  
  translate(x, y, z);
  noStroke();
  fill(c);
  box(s);
  popMatrix();
  popStyle();
}