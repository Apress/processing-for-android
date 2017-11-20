// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

color bckColor = #EA6411; 

void setup() {
  fullScreen();
  requestPermission("android.permission.READ_EXTERNAL_STORAGE", "handlePermission");
}

void draw() {
  background(bckColor);
}

void handlePermission(boolean granted) {
  if (granted) bckColor = #58EA11; 
}