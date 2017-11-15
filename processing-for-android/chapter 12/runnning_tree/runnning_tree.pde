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
int tsteps, psteps, steps, phour;
float stepInc = 0;
int stepGoal = 10000;
float stepScale = stepGoal / 300.0;

ArrayList<Branch> branches = new ArrayList<Branch>();
PGraphics canvas;
color bloomColor = color(230, 80, 120, 120);

void setup() {
  fullScreen();
  noStroke();
  textFont(createFont("SansSerif-Bold", 28 * displayDensity));
  branches.add(new Branch());
  initCanvas();
  initCounter();
}

void draw() {
  background(0);
  String str = hour() + ":" + nfs(minute(), 2) + ":" + nfs(second(), 2) + "\n" +
               tsteps + " steps";  
  if (wearInteractive()) {
    growTree();
    if (stepGoal <= steps) clearTree();
    image(canvas, 0, 0);
    textAlign(CENTER, BOTTOM);
    textSize(20 * displayDensity);
    fill(0, 80);
  } else {    
    textAlign(CENTER, CENTER);
    textSize(28 * displayDensity);    
    fill(200, 255);
    translate(0, wearInsets().bottom/2);
  }
  text(str, 0, 0, width, height);
}

synchronized void growTree() {
  if (1 <= stepInc) {
    canvas.beginDraw();
    for (int i = 0; i < branches.size(); i++) {
      Branch branch = branches.get(i);
      branch.update();
      branch.display();
      branch.bloom();
    }
    canvas.endDraw();
    stepInc--;
  }
}

synchronized void updateSteps(int value) {
  if (hour() < phour) tsteps = steps;
  if (offset == -1) offset = value;    
  steps = value - offset;  
  tsteps += steps - psteps;
  stepInc += (steps - psteps) / stepScale;
  psteps = steps;
  phour = hour();
}

synchronized void clearTree() {
  canvas.beginDraw();
  canvas.background(155, 211, 247);  
  canvas.endDraw();
  branches.clear();
  branches.add(new Branch());
  offset = -1;
  steps = psteps = 0;
  bloomColor = color(random(255), random(255), random(255), 120);
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
  void bloom() {
    if (0.85 * stepGoal < steps && random(0, 1) < 0.001) {
      float x = position.x + random(-10, +10); 
      float y = position.y + random(-10, +10);
      float r = random(5, 20);
      canvas.fill(bloomColor);
      canvas.ellipse(x, y, r, r);
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
  void onSensorChanged(SensorEvent event) {
    updateSteps(int(event.values[0]));
  }
  void onAccuracyChanged(Sensor sensor, int accuracy) { }
}