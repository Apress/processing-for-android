// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);
  noStroke();
}

void draw() {
  background(20);    
  translate(width/2, height/2);
  
  float pointX = map(mouseX, 0, width, -width/2, +width/2);
  float dirZ = map(mouseY, 0, height, 0, -1);
  pointLight(200, 200, 200, pointX, 0, 600);
  directionalLight(100, 220, 100, 0, 1, dirZ);
  
  rotateY(QUARTER_PI);
  
  fill(255, 250, 200); 
  box(320);
  
  translate(-400, 0);  
  fill(200, 200, 250);
  sphere(160);
  
  translate(0, +110, 360);  
  fill(255, 200, 200);  
  box(100);
}