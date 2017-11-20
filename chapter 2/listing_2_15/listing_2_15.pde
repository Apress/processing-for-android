// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  size(600, 160);  
  frameRate(1);
}

void draw() {
  background(180);
  drawFlower(100, 80);
  drawFlower(300, 80);
  drawFlower(500, 80);  
}

void drawFlower(float posx, float posy) {
  pushMatrix();
  translate(posx, posy);
  fill(random(255), random(255), random(255), 200);
  beginShape();
  int n = int(random(4, 10)); 
  for (int i = 0; i < n; i++) {
    float a = map(i, 0, n, 0, TWO_PI);
    float a1 = map(i + 1, 0, n, 0, TWO_PI);    
    float r = random(10, 100);
    float x = r * cos(a);
    float y = r * sin(a);
    float x1 = r * cos(a1);
    float y1 = r * sin(a1);     
    vertex(0, 0);
    bezierVertex(x, y, x1, y1, 0, 0);     
  }
  endShape();
  popMatrix();
}