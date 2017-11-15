// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import ketai.sensors.*;

KetaiSensor sensor;

float minSize = 150 * displayDensity;
float maxSize = 300 * displayDensity;
ArrayList<ColorDot> dots;

int stepCount = 0;
int updateTime = 0;
float walkSpeed = 0;

int numNotes = 5;
AudioPlayer [] notes = new AudioPlayer[numNotes];
int lastNote = int(random(1) * 4);

void setup() {
  fullScreen();
  orientation(LANDSCAPE);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();  
  for (int i = 0; i < numNotes; i++) notes[i] = new AudioPlayer(); 
  notes[0].loadFile(this, "5A.wav");
  notes[1].loadFile(this, "4G.wav");
  notes[2].loadFile(this, "4E.wav");
  notes[3].loadFile(this, "4D.wav");
  notes[4].loadFile(this, "4C.wav");  
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
  int note;
  
  ColorDot() {
    posX = int(random(1, width/maxSize)) * maxSize;
    posY = int(random(1, height/maxSize)) * maxSize;
    rad = 0.1;
    float speedf = constrain(walkSpeed, 0, 2)/2.0;
    maxRad = map(speedf, 1, 0, minSize, maxSize);    
    selectNote();
    colorHue = map(note, 0, 4, 0, 360);    
    colorAlpha = 70;
  }
  
  void selectNote() {
    float r = random(1);    
    note = lastNote;
    if (r < 0.4) note--;
    else if (r > 0.6) note++;
    if (note < 0) note = 1;
    if (4 < note) note = 3;
    notes[note].play();
    lastNote = note;    
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
  int t = millis();
  stepCount++;
  if (5000 < t - updateTime) {
    walkSpeed = stepCount/5.0; 
    stepCount = 0;
    updateTime = t;
  }
  dots.add(new ColorDot());
}