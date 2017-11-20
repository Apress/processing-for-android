// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

int lastPoint = 0;
int maxPoints = 10;
VoronoiPoint[] points = new VoronoiPoint[maxPoints];
boolean updated = false;
PGraphics canvas;

void setup () {
  fullScreen();
  canvas = createGraphics(512, 512);
}

void draw() {
  if (updated) {
    updateColors();
    drawPoints();
    updated = false;
  }
  image(canvas, 0, 0, width, height);
}

void mousePressed() {
  float x = map(mouseX, 0, width, 0, canvas.width);
  float y = map(mouseY, 0, height, 0, canvas.height);
  points[lastPoint] = new VoronoiPoint(x, y, lastPoint);
  lastPoint = (lastPoint + 1) % maxPoints;  
  updated = true;  
}

void updateColors() {
  int idx = 0;
  canvas.beginDraw();
  canvas.loadPixels();
  for (int y = 0; y < canvas.height; y++) {
    for (int x = 0; x < canvas.width; x++) {
      int closest = findClosestPoint(x, y);
      if (-1 < closest) canvas.pixels[idx] = points[closest].getColor(idx);
      idx++;
    }
  }
  canvas.updatePixels();
  canvas.endDraw();
}

void drawPoints() {
  canvas.beginDraw();
  canvas.strokeWeight(10);
  canvas.stroke(0, 50);
  for (int i = 0; i < points.length; i++) {
    VoronoiPoint p = points[i];
    if (p == null) break;    
    canvas.point(p.x, p.y);
  }
  canvas.endDraw();
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
  PImage img;  
  VoronoiPoint(float x, float y, int i) {
    this.x = x; 
    this.y = y;
    img = loadImage("streetview" + i + ".jpg");
    img.loadPixels();
  }  
  color getColor(int idx) {
    return img.pixels[idx];
  }  
}