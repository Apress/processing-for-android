// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape world, country;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  world = loadShape("World-map.svg");
  world.scale(width / world.width);
}

void draw() {
  background(255);
  if (mousePressed) {
    if (country != null) country.setFill(color(0));
    for (PShape child: world.getChildren()) {
      if (child.getVertexCount() == 0) continue;
      PShape tess = child.getTessellation();
      boolean inside = false;
      for (int i = 0; i < tess.getVertexCount(); i += 3) {
        PVector v0 = tess.getVertex(i);
        PVector v1 = tess.getVertex(i + 1);
        PVector v2 = tess.getVertex(i + 2);
        if (insideTriangle(new PVector(mouseX, mouseY), v0, v1, v2)) {
          inside = true;
          country = child;
          break;
        }      
      }
      if (inside) {
        country.setFill(color(255, 0, 0));
        break;
      }      
    }
  }  
  shape(world);
}

boolean insideTriangle(PVector pt, PVector v1, PVector v2, PVector v3) {
  boolean b1, b2, b3;
  b1 = sign(pt, v1, v2) < 0.0f;
  b2 = sign(pt, v2, v3) < 0.0f;
  b3 = sign(pt, v3, v1) < 0.0f;
  return ((b1 == b2) && (b2 == b3));
}

float sign (PVector p1, PVector p2, PVector p3) {
  return (p1.x - p3.x) * (p2.y - p3.y) - (p2.x - p3.x) * (p1.y - p3.y);
}