class VoronoiPoint {
  float x, y;
  PImage img;
  
  VoronoiPoint(float x, float y, PImage img){
    this.x = x; 
    this.y = y;
    this.img = img;
    img.loadPixels();
  }
  
  color getColor(int idx) {
    return img.pixels[idx];
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