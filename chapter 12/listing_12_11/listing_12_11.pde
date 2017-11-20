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
int psteps, steps;
float stepInc = 0;
int stepGoal = 10000;
float stepScale = stepGoal / 300.0;

ArrayList<Branch> branches = new ArrayList<Branch>();
PGraphics canvas;

void setup() {
  fullScreen();
  noStroke();
  branches.add(new Branch());
  initCanvas();
  initCounter();
}

void draw() {
  background(0);   
  if (wearInteractive()) growTree();
  image(canvas, 0, 0);
}

synchronized void growTree() {
  if (1 <= stepInc) {
    canvas.beginDraw();
    for (int i = 0; i < branches.size(); i++) {
      Branch branch = branches.get(i);
      branch.update();
      branch.display();
    }
    canvas.endDraw();
    stepInc--;
  }
}

synchronized void updateSteps(int value) {
  if (offset == -1) offset = value;    
  steps = value - offset;
  stepInc += (steps - psteps) / stepScale;
  psteps = steps;    
}

void initCanvas() {
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(155, 211, 247);  
  canvas.noStroke();
  canvas.endDraw();  
}

class Branch {
  PVector position;
  PVector velocity;
  float diameter;
  
  Branch() {
    position = new PVector(width/2, height);
    velocity = new PVector(0, -1);
    diameter = width/15.0;
  }
  Branch(Branch parent) {
    position = parent.position.copy();
    velocity = parent.velocity.copy();
    diameter = parent.diameter / 1.4142;
    parent.diameter = diameter;
  }
  void update() {
    if (1 < diameter) {
      position.add(velocity);
      float opening = map(diameter, 1, width/15.0, 1, 0);
      float angle = random(PI - opening * HALF_PI, TWO_PI + opening * HALF_PI);
      PVector shake = PVector.fromAngle(angle);
      shake.mult(0.1);
      velocity.add(shake);
      velocity.normalize();
      if (random(0, 1) < 0.04) branches.add(new Branch(this));
    }
  }
  void display() {
    if (1 < diameter) {
      canvas.fill(175, 108, 44, 50);
      canvas.ellipse(position.x, position.y, diameter, diameter);
    }
  }
}

void initCounter() {
  Context context = getContext();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER);  
  listener = new SensorListener();  
  manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
}

class SensorListener implements SensorEventListener {
  synchronized void onSensorChanged(SensorEvent event) {
    updateSteps(int(event.values[0]));
  }
  void onAccuracyChanged(Sensor sensor, int accuracy) { }
}