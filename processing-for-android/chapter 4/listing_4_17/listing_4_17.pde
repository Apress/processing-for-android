// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PImage img;
void setup() {
  size(800, 533);
  img = loadImage("paine.jpg");  
}

void draw() {  
  image(img, 0, 0, width/2, height/2);
  tint(255, 0, 0);
  image(img, width/2, 0, width/2, height/2);
  tint(0, 255, 0);
  image(img, 0, height/2, width/2, height/2);
  tint(0, 0, 255);
  image(img, width/2, height/2, width/2, height/2);  
  noTint();
}