// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;
import android.hardware.SensorManager;

KetaiSensor sensor;
PVector accel = new PVector();
int shakeTime;

color bColor = color(78, 93, 75);

void setup() {
  fullScreen();  
  sensor = new KetaiSensor(this);
  sensor.start();
  textAlign(CENTER, CENTER);
  textSize(displayDensity * 36);
}

void draw() {
  background(bColor);
  text("Accelerometer: \n" +
    "x: " + nfp(accel.x, 1, 3) + "\n" +
    "y: " + nfp(accel.y, 1, 3) + "\n" +
    "z: " + nfp(accel.z, 1, 3), 0, 0, width, height);
}

void onAccelerometerEvent(float x, float y, float z) {
  accel.set(x, y, z);
  int now = millis();
  if (now - shakeTime > 250) {
    if (1.2 * SensorManager.GRAVITY_EARTH < accel.mag()) {
      bColor = color(216, 100, 46);
      shakeTime = now;
    } else { 
      bColor = color(78, 93, 75);
    }    
  }  
}