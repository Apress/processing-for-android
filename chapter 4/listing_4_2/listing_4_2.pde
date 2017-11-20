// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

int[] types = {POINTS, LINES, TRIANGLES, 
               TRIANGLE_STRIP, TRIANGLE_FAN,
               QUADS, QUAD_STRIP, POLYGON};
int selected = 0;

void setup() {
  size(300, 300);
  strokeWeight(2);
}

void draw() {
  background(150);
  beginShape(types[selected]);
  for (int i = 0; i <= 10; i++) {
    float a = map(i, 0, 10, 0, TWO_PI);
    float x0 = width/2  + 100 * cos(a);
    float y0 = height/2 + 100 * sin(a);
    float x1 = width/2  + 130 * cos(a);
    float y1 = height/2 + 130 * sin(a);      
    vertex(x0, y0);
    vertex(x1, y1);
  }
  endShape();
}

void mousePressed() {
  selected = (selected + 1) % types.length;
  println("Drawing shape", selected);
}