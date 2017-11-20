// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import java.util.Arrays;
import java.util.List;
List<Integer> corners = Arrays.asList(1, 2, 5, 6, 7, 12, 25, 
                                      30, 31, 32, 35, 36);

void setup() {
  textFont(createFont("Monospaced", 15 * displayDensity));
  textAlign(CENTER, CENTER);
  noStroke();
}

void draw() {
  background(0);
  int h = hour();
  int m = minute();
  float cellW = 0.9 * width/6.0;
  float cellH = 0.9 * height/6.0;
  translate(0.05 * cellW, 0.05 * cellH + wearInsets().bottom/2);
  int n = 0;  
  for (int n0 = 0; n0 < 36; n0++) {
    if (corners.contains(n0 + 1)) continue; 
    
    int i = n0 % 6;
    int j = n0 / 6;
    float x = map(i, 0, 6, 0, width);       
    float y = map(j, 0, 6, 0, height);
    float cw = n == h ? map(m, 0, 60, 0, cellW) : cellW;      
    
    if (!wearAmbient()) {
      fill(#578CB7);
      rect(x, y, cellW, cellH);    
    }
    
    fill(255);
    text(str(n), x, y, cellW, cellH);     
            
    if (n <= h) {        
      fill(0, 170);
      rect(x, y, cw, cellH);
    }
    n++;    
  }
}