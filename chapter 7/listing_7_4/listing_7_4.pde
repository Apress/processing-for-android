// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
GyroscopeListener listener;
float rx, ry, rz;

void setup() {
  fullScreen();  
  context = getContext();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
  listener = new GyroscopeListener();
  manager.registerListener(listener, sensor, 
                           SensorManager.SENSOR_DELAY_NORMAL);
  
  textFont(createFont("SansSerif", displayDensity * 24));
  textAlign(CENTER, CENTER);
}

void draw() {
  background(157);
  text("X: " + rx + "\n" + "Y: " + ry + "\n" + "Z: " + rz, width/2, height/2);
}

public void resume() {
  if (manager != null) {
    manager.registerListener(listener, sensor, 
                             SensorManager.SENSOR_DELAY_NORMAL);
  }
}

public void pause() {
  if (manager != null) {
    manager.unregisterListener(listener);
  }
}

class GyroscopeListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    rx = event.values[0];
    ry = event.values[1];
    rz = event.values[2];    
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}