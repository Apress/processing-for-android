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
AccelerometerListener listener;

void setup() {
  fullScreen();  
  context = getActivity();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
  listener = new AccelerometerListener();
  manager.registerListener(listener, sensor, 
                           SensorManager.SENSOR_DELAY_NORMAL);
}

void draw() {
}

class AccelerometerListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) {
  }
}