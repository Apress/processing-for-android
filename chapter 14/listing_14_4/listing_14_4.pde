// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

public void setup() {
  fullScreen(STEREO);
  textFont(createFont("SansSerif", 30));
  textAlign(CENTER, CENTER);
}

public void draw() {
  background(255);
  translate(width/2, height/2);
  lights();
  fill(#EAB240);
  noStroke();
  rotateY(millis()/1000.0);
  box(300);
  drawEye();
}

void drawEye() {
  eye();
  
  float s = 50;
  float d = 200;
  float h = 100;
    
  noFill();
  stroke(0);
  strokeWeight(10);
  beginShape(QUADS);
  vertex(-s, -s, d);
  vertex(+s, -s, d);
  vertex(+s, +s, d);
  vertex(-s, +s, d);
  endShape();
  
  pushMatrix();
  translate(0, 0, d);
  rotateX(millis()/1000.0);  
  rotateY(millis()/2000.0);
  fill(#6AA4FF);
  noStroke();
  box(50);
  popMatrix();
  
  fill(0);
  text("Welcome to VR!", 0, -h * 0.75, d);
}