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

void setup () {
  fullScreen();
  textFont(createFont("SansSerif", displayDensity * 24));
  textAlign(CENTER, CENTER); 
  requestPermission("android.permission.ACCESS_FINE_LOCATION", "initLocation");  
}

void draw() {
  background(0);   
  while (queue.available()) {
    LocationValue loc = queue.remove();
    path.add(0, loc);      
  }
  String info = "";
  for (LocationValue loc: path) {
    info += loc.latitude + ", " + loc.longitude + "\n";
  }
  text(info, 0, 0, width, height);
}

void initLocation(boolean granted) {
  if (granted) {
    Context context = getContext();    
    listener = new SimpleListener();
    manager = (LocationManager) 
              context.getSystemService(Context.LOCATION_SERVICE);
    provider = LocationManager.NETWORK_PROVIDER;
    if (manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
      provider = LocationManager.GPS_PROVIDER;
    }
    manager.requestLocationUpdates(provider, 1000, 1, listener);
  }
}

class SimpleListener implements LocationListener {
  public void onLocationChanged(Location loc) {
    queue.add(new LocationValue(loc.getLatitude(), loc.getLongitude()));
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
  LocationValue(double lat, double lon) {
    latitude = lat;
    longitude = lon;    
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