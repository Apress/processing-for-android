// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*; 

KetaiLocation location;
ArrayList<LocationValue> path = new ArrayList<LocationValue>();

float minLat = 90;
float maxLat = -90; 
float minLon = 180;
float maxLon = -180;  

void setup () {
  fullScreen();
  location = new KetaiLocation(this);
}

void draw() {
  background(255);
  stroke(70, 200);
  strokeWeight(displayDensity * 4);
  beginShape(LINE_STRIP);
  for (LocationValue loc: path) {
    float x = map((float)loc.longitude, minLon, maxLon, 0.1 * width, 0.9 * width);
    float y = map((float)loc.latitude, minLat, maxLat, 0.1 * height, 0.9 * height);
    vertex(x, y);
  }
  endShape();
}

void onLocationEvent(double lat, double lon) {
  path.add(new LocationValue(lat, lon));
  minLat = Math.min(minLat, (float)lat);
  maxLat = Math.max(maxLat, (float)lat);
  minLon = Math.min(minLon, (float)lon);
  maxLon = Math.max(maxLon, (float)lon);  
}

class LocationValue {
  double latitude;
  double longitude;  
  LocationValue(double lat, double lon) {
    latitude = lat;
    longitude = lon;    
  }
}