// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

ArrayList<Circle> circles;
Circle newCircle;

void setup() {
  fullScreen();
  circles = new ArrayList<Circle>();
  noStroke();
}

void draw() {
  background(255);
  for (Circle c: circles) {
    c.draw();
  }
  if (newCircle != null) newCircle.draw();
}

void mousePressed() {
  newCircle = new Circle(mouseX, mouseY);
}

void mouseReleased() {  
  newCircle.setVelocity(mouseX - pmouseX, mouseY - pmouseY);
  circles.add(newCircle);
  newCircle = null;
}

void mouseDragged() {
  newCircle.setPosition(mouseX, mouseY);
  newCircle.grow();
}