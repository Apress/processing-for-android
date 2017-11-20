// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import java.util.*;

HashMap<Integer, Brush> brushes;

void setup() {
  fullScreen();
  brushes = new HashMap<Integer, Brush>(); 
  noStroke();  
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
}

void draw() {  
  for (Brush b: brushes.values()) b.draw();
}

void touchStarted() {
  for (int i = 0; i < touches.length; i++) {
    if (!brushes.containsKey(touches[i].id)) {
      brushes.put(touches[i].id, new Brush(i));
    }
  }
}

void touchEnded() {
  Set<Integer> ids = new HashSet<Integer>(brushes.keySet()); 
  for (int id: ids) {
    boolean found = false;
    for (int i = 0; i < touches.length; i++) {
      if (touches[i].id == id) found = true;
    }
    if (!found) brushes.remove(id);
  }
}

void touchMoved() {
  for (int i = 0; i < touches.length; i++) {
    Brush b = brushes.get(touches[i].id);
    b.update(touches[i].x, touches[i].y, touches[i].area);
  }
}

class Brush {
  color c;
  float x, y, s;
  Brush(int index) {
    c = color(map(index, 0, 10, 0, 360), 60, 75, 100);
  }
  void update(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = map(s, 0, 1, 50, 500);
  }
  void draw() {
    fill(c);
    ellipse(x, y, s, s);
  }
}