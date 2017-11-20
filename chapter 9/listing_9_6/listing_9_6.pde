// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PImage street;
String apiKey = "<your API key>";

void setup () {
  size(512, 512); 
  street = requestImage("http://maps.googleapis.com/maps/api/streetview?location=42.383401,-71.116110&size=512x512&fov=90&pitch=-10&key=" + apiKey);
}

void draw() {
  if (0 < street.width && 0 < street.height) {
    image(street, 0, 0, width, height);
  }
}