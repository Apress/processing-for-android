// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

KetaiSensor sensor;
color bColor = color(78, 93, 75);
int stepTime = 0;
int stepCount = 0;

void setup() {
  fullScreen();
  orientation(PORTRAIT);
  sensor = new KetaiSensor(this);
  sensor.start();
  textAlign(CENTER, CENTER);
  textSize(displayDensity * 24);
}

void draw() {
  if (millis() - stepTime > 500) {
    bColor = color(78, 93, 75);
  }
  background(bColor);
  text("Number of steps = " + stepCount, 0, 0, width, height);
}

void onStepDetectorEvent() {
  bColor = color(216, 100, 46);
  stepTime = millis();  
  stepCount++;
}