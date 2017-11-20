// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

int seli = -1;
int selj = -1;
int startSel, selTime;

void setup() {
  fullScreen(STEREO);
}

void draw() {
  background(120);  
  translate(width/2, height/2);
  lights();
  drawGrid();
  drawAim();  
}

void drawGrid() {
  boolean sel = false;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      beginShape(QUAD);
      float x = map(i, 0, 3, -315, +315);
      float y = map(j, 0, 3, -315, +315);
      float sx = screenX(x, y, 0);
      float sy = screenY(x, y, 0);
      if (abs(sx - 0.5 * width) < 50 && abs(sy - 0.5 * height) < 50) {
        strokeWeight(5);
        stroke(#2FB1EA);
        if (seli == i && selj == j) {
          selTime = millis() - startSel;
        } else {
          startSel = millis();
          selTime = 0;
        }
        seli = i;
        selj = j; 
        sel = true;
        if (2000 < selTime) {
          fill(#2FB1EA);
        } else {
          fill(#E3993E);
        }
      } else {
        noStroke();
        fill(#E3993E);
      }
      vertex(x - 100, y - 100);
      vertex(x + 100, y - 100);
      vertex(x + 100, y + 100);
      vertex(x - 100, y + 100);
      endShape(QUAD);
    }
  }
  if (!sel) {
    seli = -1;
    selj = -1;
    selTime = 0;
  }
}

void drawAim() {
  eye();
  stroke(47, 177, 234, 150);
  strokeWeight(50);
  point(0, 0, 100);  
}