// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

int bpm;

void setup() {
  fullScreen();
  frameRate(1);
  textFont(createFont("SansSerif", 28 * displayDensity));
  textAlign(CENTER, CENTER);
  thread("generateData");
}

void draw() {
  background(0);  
  translate(0, wearInsets().bottom/2);
  text(bpm + " beats/min", 0, 0, width, height);      
}

void generateData() {
  while (true) {
    bpm = int(random(60, 100));
    delay(2000);
  }
}