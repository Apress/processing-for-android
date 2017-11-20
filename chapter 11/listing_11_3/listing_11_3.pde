// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

void setup() {
  textFont(createFont("Monospaced", 15 * displayDensity));
  textAlign(CENTER, CENTER);
  noStroke();
}

void draw() {
  background(0);
  int h = hour();
  int m = minute();
  float cellW = 0.9 * width/4.0;
  float cellH = 0.9 * height/6.0;
  translate(0.05 * cellW, 0.05 * cellH + wearInsets().bottom/2);
  for (int n = 0; n < 24; n++) {
    int i = n % 4;
    int j = n / 4;
    float x = map(i, 0, 4, 0, width);       
    float y = map(j, 0, 6, 0, height);
    float w = n == h ? map(m, 0, 60, 0, cellW) : cellW;

    if (!wearAmbient()) {
      fill(#578CB7);
      rect(x, y, cellW, cellH);    
    }
    
    fill(255);
    text(str(n), x, y, cellW, cellH);     
            
    if (n <= h) {        
      fill(0, 170);
      rect(x, y, w, cellH);
    }
  }
}