// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

int x = 0;

void setup() {
  size(600, 200); 
  strokeWeight(2);
  stroke(255);  
}

void draw() {
  background(50);
  line(x, 0, x, height);
  x = (x + 1) % width; 
}

void keyPressed() {
  if (looping) { 
    noLoop();
  } else { 
    loop();
  }
}