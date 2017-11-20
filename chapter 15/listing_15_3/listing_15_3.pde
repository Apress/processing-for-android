// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

float angle;

void setup() {
  fullScreen(STEREO);
  textureMode(NORMAL);
  createBase(300, 70, 20);
  createButtons(300, 100, 380, 130);
}

void calculate() {
  if (mousePressed) {
    if (leftButton.selected) angle -= 0.01;
    if (rightButton.selected) angle += 0.01;
  }
  if (mousePressed && !selectingUI()) {
    updateStrokes();
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  directionalLight(200, 200, 200, 0, +1, -1);
  drawBase();
  drawStrokes();
  drawUI();
}

void mouseReleased() {
  if (resetButton.selected) {
    clearDrawing(); 
    angle = 0;
  } else {
    startNewStroke();
  }
}