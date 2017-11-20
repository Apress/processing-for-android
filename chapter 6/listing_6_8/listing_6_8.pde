// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PImage img;

void setup() {
  fullScreen();
  img = loadImage("jupiter.jpg");
  img.loadPixels();
}

void draw() {
  image(img, 0, 0, width, height);
  int resolution = 30;
  int cols = width / resolution;
  int rows = height / resolution;
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      int ix = int(map(x, 0, width, 0, img.width - 1));
      int iy = int(map(y, 0, height, 0, img.height - 1));
      int idx = ix + iy * img.width;
      int c = img.pixels[idx];
      float theta = map(brightness(c), 0, 255, 0, TWO_PI);
      PVector v = PVector.fromAngle(theta);
      drawArrow(x, y, v, resolution-2);        
    }      
  }
}

void drawArrow(float x, float y, PVector v, float l) {
  pushMatrix();
  float arrowsize = 8;
  translate(x, y);
  strokeWeight(2);
  stroke(28, 117, 188);
  rotate(v.heading());
  float len = v.mag() * l;
  line(0, 0, len, 0);
  line(len, 0, len-arrowsize, +arrowsize/2);
  line(len, 0, len-arrowsize, -arrowsize/2);
  popMatrix();  
}