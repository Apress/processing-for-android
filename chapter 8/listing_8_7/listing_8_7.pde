// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;
import android.hardware.GeomagneticField;

KetaiSensor sensor;
float expMag, obsMag;

void setup() {
  fullScreen(); 
  sensor = new KetaiSensor(this);
  sensor.start();  
  GeomagneticField geoField = new GeomagneticField(14.0093, 120.996147, 300, System.currentTimeMillis());
  expMag = geoField.getFieldStrength()/1000;
}

void draw() {
  println(obsMag, expMag);
  if (obsMag < 0.7 * expMag || 1.3 * expMag < obsMag) {
    background(255);
  } else {
    background(0);
  }  
}

void onMagneticFieldEvent(float x, float y, float z) {
  obsMag = sqrt(sq(x) + sq(y) + sq(z));
}