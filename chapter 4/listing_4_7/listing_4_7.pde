// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

WavyLine[] waves;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  colorMode(HSB, 360, 100,100);
  waves = new WavyLine[10];
  for (int i = 0; i < 10; i++) {
    float y = map(i, 0, 9, height * 0.85, height * 0.025);
    color c = color(225, map(i, 0, 10, 30, 100), 90);
    waves[i] = new WavyLine(y, c);
  }
}

void draw() { 
  background(219, 240, 255);  
  for (int i = waves.length - 1; i >= 0; i--) {
    waves[i].display();
  }
}

class WavyLine {
  int numDiv;
  color fillColor;
  PVector[] positions; 
  PVector[] directions;

  WavyLine(float y, color c) {
    numDiv = int(8 * displayDensity);
    positions = new PVector[numDiv]; 
    directions = new PVector[numDiv];    
    
    fillColor = c;
    for (int i = 0; i < numDiv; i++) {
      float x = 0;      
      if (0 < i) {
        if (i == numDiv - 1) x = width;
        else x = random(i/float(numDiv) * width * 1.2, 
                        (i+1)/float(numDiv) * width * 0.8);
      }
      positions[i] = new PVector(x, y + random(-20, 20));
      directions[i] = PVector.fromAngle(random(-0.5 * HALF_PI, 
                                               +0.5 * HALF_PI));
      directions[i].mult(20 * displayDensity);
    }    
  }
    
  void display() {
    noStroke();
    fill(fillColor);
    beginShape();
    for (int i = 0; i < numDiv - 1; i++) {
      vertex(positions[i].x, positions[i].y);
      PVector cp1 = PVector.add(positions[i], directions[i]);
      PVector cp2 = PVector.sub(positions[i+1], directions[i+1]);  
      bezierVertex(cp1.x, cp1.y, cp2.x, cp2.y, 
                   positions[i+1].x, positions[i+1].y);
    }
    vertex(width, height);
    vertex(0, height);    
    endShape();
  }
}