// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape world;

void setup() {
  size(950, 620, P2D);
  world = loadShape("World-map.svg");
  for (PShape child: world.getChildren()) {
    if (child.getName().equals("algeria")) child.setFill(color(255, 0, 0));    
  }
}

void draw() {
  background(255);
  shape(world);
}