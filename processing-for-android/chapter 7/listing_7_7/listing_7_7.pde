// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

KetaiSensor sensor;
boolean hasAccel = false; 
boolean hasGyro = false;
PVector dataAccel = new PVector();
PVector dataGyro = new PVector();

void setup() {
  fullScreen();  
  sensor = new KetaiSensor(this);
  sensor.start();
  
  if (sensor.isAccelerometerAvailable()) {
    hasAccel = true;
    println("Device has accelerometer");
  }
  if (sensor.isGyroscopeAvailable()) {
    hasGyro = true;
    println("Device has gyroscope");
  }  
  
  noStroke();
}

void draw() {
  background(255);
  float h = height/6;
  float y = 0;
  translate(width/2, 0);
  if (hasAccel) {
    fill(#C63030);
    rect(0, y, map(dataAccel.x, -10, +10, -width/2, +width/2), h);
    y += h;
    rect(0, y, map(dataAccel.y, -10, +10, -width/2, +width/2), h);
    y += h;
    rect(0, y, map(dataAccel.z, -10, +10, -width/2, +width/2), h);
    y += h;
  }
  if (hasGyro) {
    fill(#30C652);
    rect(0, y, map(dataGyro.x, -10, +10, -width/2, +width/2), h);
    y += h;
    rect(0, y, map(dataGyro.y, -10, +10, -width/2, +width/2), h);
    y += h;
    rect(0, y, map(dataGyro.z, -10, +10, -width/2, +width/2), h);
  }  
}

void onAccelerometerEvent(float x, float y, float z) {
  dataAccel.set(x, y, z);
}

void onGyroscopeEvent(float x, float y, float z) {
  dataGyro.set(x, y, z);
}