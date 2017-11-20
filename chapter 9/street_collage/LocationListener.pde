void initLocation(boolean granted) {
  if (granted) {
    Context context = getContext();    
    listener = new SimpleListener();
    manager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
    provider = LocationManager.NETWORK_PROVIDER;
    if (manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
      provider = LocationManager.GPS_PROVIDER;
    }
    manager.requestLocationUpdates(provider, 30000, 20, listener);
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
    manager.requestLocationUpdates(provider, 30000, 20, listener);
  }
}

public void pause() {
  if (manager != null) {
    manager.removeUpdates(listener);
  }
}