// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

KetaiSensor sensor;

float minSize = 150 * displayDensity;
float maxSize = 300 * displayDensity;
ArrayList<ColorDot> dots;

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();  
  dots = new ArrayList<ColorDot>();  
  sensor = new KetaiSensor(this);
  sensor.start();  
}

void draw() {
  background(0, 0, 0);    
  for (int i = dots.size() - 1; i >= 0 ; i--) {
    ColorDot d = dots.get(i);
    d.update();
    d.display(); 
    if (d.colorAlpha < 1) {
      dots.remove(i);
    }
  }  
}

class ColorDot {
  float posX, posY;
  float rad, maxRad;
  float colorHue, colorAlpha;
  
  ColorDot() {
    posX = int(random(1, width/maxSize)) * maxSize;
    posY = int(random(1, height/maxSize)) * maxSize;
    rad = 0.1;
    maxRad = random(minSize, maxSize);    
    colorHue = random(0, 360);    
    colorAlpha = 70;
  }
  
  void update() {
    if (rad < maxRad) {
      rad *= 1.5; 
    } else {
      colorAlpha -= 0.1;
    }
  }
  
  void display() {
    fill(colorHue, 100, 100, colorAlpha);
    ellipse(posX, posY, rad, rad);
  }
}

void onStepDetectorEvent() {
  dots.add(new ColorDot());
}