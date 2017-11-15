// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;
import android.hardware.SensorManager;

KetaiSensor sensor;

float[] gravity = new float[3];
float[] geomagnetic = new float[3];
float[] I = new float[16];
float[] R = new float[16];
float orientation[] = new float[3]; 

float easing = 0.05;
float azimuth;

void setup() {
  fullScreen(P2D);
  orientation(PORTRAIT);  
  sensor = new KetaiSensor(this);
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

void onAccelerometerEvent(float x, float y, float z) {
  gravity[0] = x; gravity[1] = y; gravity[2] = z;
  calculateOrientation();
}

void onMagneticFieldEvent(float x, float y, float z) {
  geomagnetic[0] = x; geomagnetic[1] = y; geomagnetic[2] = z;
  calculateOrientation();
}

void calculateOrientation() {
  if (SensorManager.getRotationMatrix(R, I, gravity, geomagnetic)) {
    SensorManager.getOrientation(R, orientation);
    azimuth += easing * (orientation[0] - azimuth);
  }   
}