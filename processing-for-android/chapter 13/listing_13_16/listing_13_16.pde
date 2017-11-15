// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  
  directionalLight(255, 255, 255, 0, 0, -1);
  
  pushMatrix();
  translate(-width/3, 0);
  fill(250, 100, 50);  
  specular(200, 250, 200);
  emissive(0, 0, 0);
  shininess(10.0);
  sphere(200);
  popMatrix();
  
  pushMatrix();
  fill(250, 100, 50);
  specular(255);
  shininess(1.0);
  emissive(0, 20, 0);
  sphere(200);
  popMatrix();
  
  pushMatrix();
  translate(+width/3, 0);
  fill(250, 100, 50);
  specular(255);
  shininess(2.0);
  emissive(50, 10, 100);
  sphere(200);
  popMatrix(); 
}