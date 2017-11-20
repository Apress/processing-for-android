// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.os.Environment;

Context context;
SensorManager manager;
Sensor sensor;
SensorListener listener;

int bpm;
String[] data = { "time,rate" }; 

void setup() {
  fullScreen();
  frameRate(1);
  textFont(createFont("SansSerif", 28 * displayDensity));
  textAlign(CENTER, CENTER);
  requestPermission("android.permission.BODY_SENSORS", "initMonitor");
  requestPermission("android.permission.WRITE_EXTERNAL_STORAGE");
}

void draw() {
  background(0);  
  translate(0, wearInsets().bottom/2);
  text(bpm + " beats/min", 0, 0, width, height);      
}

void mousePressed() {
  background(200, 40, 40);  
  File sd = Environment.getExternalStorageDirectory();
  String path = sd.getAbsolutePath();
  File directory = new File(path, "out");
  File file = new File(directory, "sensor-data.csv");
  saveStrings(file, data);  
}

void initMonitor(boolean granted) {
  if (granted) {
    Context context = getContext();
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
    sensor = manager.getDefaultSensor(Sensor.TYPE_HEART_RATE);  
    listener = new SensorListener();  
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
  }
}

class SensorListener implements SensorEventListener {
  public void onSensorChanged(SensorEvent event) {
    bpm = int(event.values[0]);
    data = (String[]) append(data, millis() + "," + bpm);
  }
  public void onAccuracyChanged(Sensor sensor, int accuracy) { }
}