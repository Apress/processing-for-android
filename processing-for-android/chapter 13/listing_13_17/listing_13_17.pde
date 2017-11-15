// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape earth;
PImage texmap;

void setup() {
  fullScreen(P3D);  
  texmap = loadImage("earthmap1k.jpg");
  earth = createShape(SPHERE, 300);
  earth.setStroke(false);
  earth.setTexture(texmap);
}

void draw() {
  background(255);
  translate(width/2, height/2);  
  rotateY(0.01 * frameCount);
  shape(earth);
}