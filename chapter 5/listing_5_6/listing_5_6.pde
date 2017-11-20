// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

ArrayList<Circle> circles;
Circle newCircle;
float buttonHeight = 200 * displayDensity;

void setup() {
  fullScreen();
  circles = new ArrayList<Circle>();
  noStroke();
  textFont(createFont("SansSerif", 23 * displayDensity));
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  for (Circle c: circles) {
    c.draw();
  }
  if (newCircle != null) newCircle.draw();
  fill(100, 180);
  rect(0, height - buttonHeight, width, buttonHeight);
  fill(80);
  text("Touch this area to clear", 0, height - buttonHeight, width, buttonHeight);
}

void mousePressed() {
  newCircle = new Circle(mouseX, mouseY);
}

void mouseReleased() {  
  newCircle.setVelocity(mouseX - pmouseX, mouseY - pmouseY);
  circles.add(newCircle);
  newCircle = null;
  if (height - buttonHeight < mouseY) circles.clear(); 
}

void mouseDragged() {
  newCircle.setPosition(mouseX, mouseY);
  newCircle.grow();
}