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
SensorListener listener;

int offset = -1;
int steps;

void setup() {
  fullScreen();
  frameRate(1);
  Context context = (Context) surface.getComponent();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER);  
  listener = new SensorListener();  
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);  
  textFont(createFont("SansSerif", 40 * displayDensity));
  textAlign(CENTER, CENTER);
  fill(255);  
}

void draw() {
  background(0);
  if (wearInteractive()) {
    String str = steps + " steps";
    float w = textWidth(str);
    text(str, width/2, height/2);     
  }
}

void resume() {
if (manager != null) 
  manager.registerListener(listener, sensor,  
                           SensorManager.SENSOR_DELAY_NORMAL);
}

void pause() {
  if (manager != null) manager.unregisterListener(listener);
}

class SensorListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    if (offset == -1) offset = (int)event.values[0]; 
    steps = (int)event.values[0] - offset;
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) { }
}