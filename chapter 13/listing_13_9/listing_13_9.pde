// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  fullScreen(P3D);  
}

void draw() {
  background(157);
  
  translate(width/2, height/2);
  
  pushMatrix();
  translate(-width/3, -height/4);
  rotateY(millis()/2000.0);  
  ellipse(0, 0, 200, 200);
  popMatrix();
  
  pushMatrix();
  translate(0, -height/4);
  rotateY(millis()/2000.0);
  triangle(0, +150, -150, -150, +150, -150);  
  popMatrix();

  pushMatrix();
  translate(+width/3, -height/4);
  rotateY(millis()/2000.0);  
  rect(-100, -100, 200, 200, 20);
  popMatrix();  

  pushMatrix();
  translate(-width/3, +height/4);
  rotateY(millis()/2000.0);  
  quad(-40, -100, 120, -80, 120, 150, -80, 150);
  popMatrix();  
  
  pushMatrix();
  translate(0, +height/4);
  rotateY(millis()/2000.0);  
  box(200);
  popMatrix();    
  
  pushMatrix();
  translate(+width/3, +height/4);
  rotateY(millis()/2000.0);  
  sphere(150);
  popMatrix();  
}