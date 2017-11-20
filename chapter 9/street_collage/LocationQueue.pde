class LocationValue {
  double latitude;
  double longitude;
  PImage streetView;
  
  LocationValue(double lat, double lon) {
    latitude = lat;
    longitude = lon;
  }
  
  void setStreetView(PImage img) {
    streetView = img;
  }
  
  PImage getStreetView() {
    return streetView;
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