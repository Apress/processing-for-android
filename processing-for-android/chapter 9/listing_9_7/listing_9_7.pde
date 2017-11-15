// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;

LocationManager manager;
SimpleListener listener;
String provider;
LocationQueue queue = new LocationQueue();
ArrayList<LocationValue> path = new ArrayList<LocationValue>();
ArrayList<PImage> street = new ArrayList<PImage>();
String apiKey = "<your API key>";

float minLat = 90;
float maxLat = -90; 
float minLon = 180;
float maxLon = -180; 

void setup () {
  fullScreen();
  requestPermission("android.permission.ACCESS_FINE_LOCATION", "initLocation");  
}

void draw() {
  background(255); 
  while (queue.available()) {
    LocationValue loc = queue.remove();
    minLat = min(minLat, (float)loc.latitude);
    maxLat = max(maxLat, (float)loc.latitude);
    minLon = min(minLon, (float)loc.longitude);
    maxLon = max(maxLon, (float)loc.longitude); 
    if (0 < path.size()) {
      LocationValue last = path.get(path.size() - 1);
      if (last.distanceTo(loc) < loc.accuracy + last.accuracy) continue;
    }    
    path.add(0, loc);
    String url = "http://maps.googleapis.com/maps/api/streetview?location=" + 
                 loc.latitude + "," + loc.longitude + 
                 "&size=512x512&fov=90&pitch=-10&sensor=false&key=" + apiKey;
    street.add(requestImage(url));
  }
  if (0 < street.size()) {
    PImage img = street.get(street.size() - 1);    
    if (0 < img.width && 0 < img.height) {
      image(img, 0, 0, width, height);
    }    
  }  
}

void initLocation(boolean granted) {
  if (granted) {
    Context context = getContext();    
    listener = new SimpleListener();
    manager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
    provider = LocationManager.NETWORK_PROVIDER;
    if (manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
      provider = LocationManager.GPS_PROVIDER;
    }
    manager.requestLocationUpdates(provider, 1000, 1, listener);
  }
}

class SimpleListener implements LocationListener {
  public void onLocationChanged(Location loc) {
    queue.add(new LocationValue(loc.getLatitude(), loc.getLongitude(), loc.getAccuracy()));
  }
  public void onProviderDisabled(String provider) { }
  public void onProviderEnabled(String provider) { }
  public void onStatusChanged(String provider, int status, Bundle extras) { }  
}

public void resume() {
  if (manager != null) {
    manager.requestLocationUpdates(provider, 1000, 1, listener);
  }
}

public void pause() {
  if (manager != null) {
    manager.removeUpdates(listener);
  }
}

class LocationValue {
  double latitude;
  double longitude;
  double accuracy;

  LocationValue(double lat, double lon, double acc) {
    latitude = lat;
    longitude = lon;
    accuracy = acc;
  }
  
  double distanceTo(LocationValue dest) {
    double a1 = radians((float)latitude);
    double a2 = radians((float)longitude);
    double b1 = radians((float)dest.latitude);
    double b2 = radians((float)dest.longitude);

    double t1 = Math.cos(a1) * Math.cos(a2) * Math.cos(b1) * Math.cos(b2);
    double t2 = Math.cos(a1) * Math.sin(a2) * Math.cos(b1) * Math.sin(b2);
    double t3 = Math.sin(a1) * Math.sin(b1);
    double tt = Math.acos(t1 + t2 + t3);

    return 6366000 * tt;
  }
}
  
class LocationQueue {
  LocationValue[] values = new LocationValue[10];
  int offset, count;
    
  synchronized void add(LocationValue val) {
    if (count == values.length) {
      values = (LocationValue[]) expand(values);
    }
    values[count++] = val;
  }
  
  synchronized LocationValue remove() {
    if (offset == count) {
      return null;
    }
    LocationValue outgoing = values[offset++];
    if (offset == count) {
      offset = 0;
      count = 0;
    }
    return outgoing;
  }
  
  synchronized boolean available() {
    return 0 < count;
  }  
}