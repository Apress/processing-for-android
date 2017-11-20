// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

float orientation[] = new float[3];
float easing = 0.05;
float azimuth;

KetaiSensor sensor;

void setup() {
  fullScreen(P2D);
  orientation(PORTRAIT);  
  sensor = new KetaiSensor(this);
  sensor.enableAccelerometer();
  sensor.enableMagenticField();
  sensor.start();
}

void draw() {
  background(255);
  
  float cx = width * 0.5;
  float cy = height * 0.4;
  float radius = 0.8 * cx;
  
  translate(cx, cy);
  
  noFill();
  stroke(0);
  strokeWeight(2);
  ellipse(0, 0, radius*2, radius*2);
  line(0, -cy, 0, -radius);

  sensor.getOrientation(orientation);
  azimuth += easing * (orientation[0] - azimuth);
  
  fill(192, 0, 0);
  noStroke();    
  rotate(-azimuth);
  beginShape();
  vertex(-30, 40);
  vertex(0, 0);
  vertex(30, 40);
  vertex(0, -radius);
  endShape();  
}