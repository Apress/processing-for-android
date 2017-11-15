// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PImage pic;
float ratio;

void setup() {
  fullScreen();
  pic = loadImage("paine.jpg");
  ratio = float(pic.width)/float(pic.height);
}

void draw() {
  background(0);
  float w = wallpaperHomeCount() * width;
  float h = w/ratio;
  float x = map(wallpaperOffset(), 0, 1, 0, -(wallpaperHomeCount()-1) * width);
  image(pic, x, 0, w, h);
}