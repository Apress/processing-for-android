// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape world;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  world = loadShape("World-map.svg");
  world.scale(height/world.getHeight());
  shapeMode(CENTER);
}

void draw() {  
  background(255);
  translate(width/2, height/2);
  shape(world);
}