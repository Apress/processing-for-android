// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

float[] r1, r2;

void setup() {
  fullScreen(P3D); 
  noStroke();
  r1 = new float[100]; 
  r2 = new float[100];
  for (int i = 0; i < 100; i++) {
    r1[i] = random(0, 1);
    r2[i] = random(0, 1);
  }
}

void draw() {
  background(157);
  lights();
  translate(width/2, height/2);
  scale(4);
  for (int i = 0; i < 100; i++) {
    float tx = 0, ty = 0, tz = 0; 
    float sx = 1, sy = 1, sz = 1; 
    if (r1[i] < 1.0/3.0) {
      rotateX(millis()/1000.0);     
      tz = sz = 10;
    } else if (1.0/3.0 < r1[i] && r1[i] < 2.0/3.0) {
      rotateY(millis()/1000.0);
      tz = sz = 10;
    } else {
      rotateZ(millis()/1000.0);
      if (r2[i] < 0.5) {
        tx = sx = 10;        
      } else {
        ty = sy = 10;        
      }
    }    
    translate(tx/2, ty/2, tz/2);
    pushMatrix();
    scale(sx, sy, sz);
    box(1);    
    popMatrix();
    translate(tx/2, ty/2, tz/2);
  }
}