// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape model;
PVector center;

void setup() {
  fullScreen(P3D);
  model = loadShape("Deer.obj");
  center = getShapeCenter(model);  
  float dim = max(model.getWidth(), model.getHeight(), model.getDepth());
  float factor = width/(3 * dim);  
  model.rotateX(PI);  
  model.scale(factor);
  center.mult(factor);
  center.y *= -1;
}

void draw() {
  background(157);
  lights();
  translate(width/2, height/2);
  translate(-center.x, -center.y, -center.z);
  rotateY(millis()/1000.0);
  shape(model);
}

PVector getShapeCenter(PShape sh) {
  PVector bot = new PVector(+10000, +10000, +10000);
  PVector top = new PVector(-10000, -10000, -10000);
  PVector v = new PVector();
  for (int i = 0; i < sh.getChildCount(); i++) {
    PShape child = sh.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++) {
      child.getVertex(j, v);
      bot.x = min(bot.x, v.x); 
      bot.y = min(bot.y, v.y); 
      bot.z = min(bot.z, v.z);
      top.x = max(top.x, v.x); 
      top.y = max(top.y, v.y); 
      top.z = max(top.z, v.z);      
    }
  }  
  return PVector.add(top, bot).mult(0.5);
}