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

int bpm;

void setup() {
  fullScreen();
  noStroke();
  textFont(createFont("SansSerif", 28 * displayDensity));
  textAlign(CENTER, CENTER);
  requestPermission("android.permission.BODY_SENSORS", "initMonitor");
}

void draw() {
  background(0);  
  translate(0, wearInsets().bottom/2);  
  if (wearAmbient()) {
    fill(255);
    text(bpm + " bpm", 0, 0, width, height);     
  } else {
    int duration = 750;
    if (0 < bpm) duration = 60000 / bpm;
    float x = millis() % duration;
    float k = 1/(0.25 * duration);
    float a = impulse(k, x);
    float r = map(a, 0, 1, 0.75, 0.9) * width;    
    translate(width/2, height/2);
    fill(247, 47, 47);
    ellipse(0, 0, r, r);
  }  
}

float impulse(float k, float x) {
  float h = k * x;
  return h * exp(1.0 - h);
}

void initMonitor(boolean granted) {
  if (!granted) return;
  Context context = getContext();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_HEART_RATE);  
  listener = new SensorListener();  
  manager.registerListener(listener, sensor, 
                           SensorManager.SENSOR_DELAY_NORMAL);
}

class SensorListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    bpm = int(event.values[0]); 
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) { }
}