// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

int lastPoint = 0;
int maxPoints = 10;
VoronoiPoint[] points = new VoronoiPoint[maxPoints];
boolean updated = false;

void setup () {
  size(512, 512);
}

void draw() {
  if (updated) {
    updateColors();
    drawPoints();
    updated = false;
  }
}

void mousePressed() {
  points[lastPoint] = new VoronoiPoint(mouseX, mouseY, color(random(255), random(255), random(255)));
  lastPoint = (lastPoint + 1) % maxPoints;  
  updated = true;  
}

void updateColors() {
  int idx = 0;
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int closest = findClosestPoint(x, y);
      if (-1 < closest) pixels[idx] = points[closest].getColor();
      idx++;
    }
  }
  updatePixels(); 
}

void drawPoints() {
  strokeWeight(10);
  stroke(0, 50);
  for (int i = 0; i < points.length; i++) {
    VoronoiPoint p = points[i];
    if (p == null) break;    
    point(p.x, p.y);
  }
}

int findClosestPoint(float x, float y) {
  int minIdx = -1;
  float minDist = 1000;  
  for (int i = 0; i < points.length; i++) {
    VoronoiPoint p = points[i];
    if (p == null) break;
    float d = dist(x, y, p.x, p.y);    
    if (d < minDist) { 
      minIdx = i;
      minDist = d;
    }
  }
  return minIdx;
}

class VoronoiPoint {
  float x, y;
  color c;  
  VoronoiPoint(float x, float y, color c){
    this.x = x; 
    this.y = y;
    this.c = c;
  }
  color getColor() {
    return c;
  }  
}