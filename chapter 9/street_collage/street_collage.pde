// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

LocationManager manager;
SimpleListener listener;
String provider;
LocationQueue queue = new LocationQueue();
ArrayList<LocationValue> path = new ArrayList<LocationValue>();
int lastPoint = 0;
int maxPoints = 10;
VoronoiPoint[] points = new VoronoiPoint[maxPoints];
PGraphics canvas;
String apiKey = "<your API key>";
PImage defImage;

void setup () {
  fullScreen();
  orientation(PORTRAIT);    
  canvas = createGraphics(512, 512);
  imageMode(CENTER);
  if (wallpaperPreview()) {
    defImage = loadImage("default.png");
  } else { 
    requestPermission("android.permission.ACCESS_FINE_LOCATION", "initLocation");
  }
}

void draw() {
  background(0);
  float h = max(width, height);
  if (wallpaperPreview()) {    
    image(defImage, width/2, height/2, h, h);    
  } else {
    updatePositions();
    image(canvas, width/2, height/2, h, h);
  }
}

void updatePositions() {
  while (queue.available()) {
    LocationValue loc = queue.remove();
    if (0 < path.size()) {
      LocationValue last = path.get(path.size() - 1);
      if (last.distanceTo(loc) < 20) continue;
    }      
    String url = "http://maps.googleapis.com/maps/api/streetview?location=" + 
                 loc.latitude + "," + loc.longitude + 
                 "&size=512x512&fov=90&pitch=-10&sensor=false&key=" + apiKey;
    loc.setStreetView(requestImage(url));
    path.add(loc);
  }

  boolean newImage = false;
  for (int i = path.size() - 1; i >= 0; i--) {
    LocationValue loc = path.get(i);
    PImage img = loc.getStreetView();
    if (img.width == -1 || img.height == -1) {
      path.remove(i);
    } else if (img.width == 512 && img.height == 512) {
      float x = random(0, canvas.width);
      float y = random(0, canvas.height);      
      points[lastPoint] = new VoronoiPoint(x, y, img);
      lastPoint = (lastPoint + 1) % maxPoints;
      newImage = true;
      path.remove(i);
    }
  }  
  if (newImage) updateColors();
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