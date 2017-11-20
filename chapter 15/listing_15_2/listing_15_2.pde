// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PShape base;
float angle;
Button leftButton, rightButton, resetButton; 

void setup() {
  fullScreen(STEREO);
  textureMode(NORMAL);
  createBase(300, 70, 20);
  createButtons(300, 100, 380, 130);
}

void calculate () {
  if (mousePressed) {
    if (leftButton.selected) angle -= 0.01;
    if (rightButton.selected) angle += 0.01;
    if (resetButton.selected) angle = 0;
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  directionalLight(200, 200, 200, 0, +1, -1);
  drawBase();
  drawBox();
  drawUI();
}

void drawBase() {
  pushMatrix();
  translate(0, +300, 0);
  rotateY(angle);
  shape(base);
  popMatrix();
}  

void drawBox() {
  pushMatrix();
  translate(0, +100, 0);
  rotateY(angle);
  noStroke();
  box(120);
  popMatrix();  
}

void createBase(float r, float h, int ndiv) {
  base = createShape(GROUP);
  PShape side = createShape();
  side.beginShape(QUAD_STRIP);
  side.noStroke();
  side.fill(#59C5F5);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    side.vertex(x, +h/2, z);
    side.vertex(x, -h/2, z);    
  }
  side.endShape();
  PShape top = createShape();
  top.beginShape(TRIANGLE_FAN);
  top.noStroke();
  top.fill(#59C5F5);
  top.vertex(0, 0, 0);
  for (int i = 0; i <= ndiv; i++) {
    float a = map(i, 0, ndiv, 0, TWO_PI);
    float x = r * cos(a); 
    float z = r * sin(a);
    top.vertex(x, -h/2, z);
  }  
  top.endShape();  
  base.addChild(side);
  base.addChild(top);
}

void createButtons(float dx, float hlr, float ht, float s) {
  PImage left = loadImage("left-icon.png");
  leftButton = new Button(-dx, hlr, 0, s, left);  
  PImage right = loadImage("right-icon.png");
  rightButton = new Button(+dx, hlr, 0, s, right);    
  PImage cross = loadImage("cross-icon.png");
  resetButton = new Button(0, +1.0 * ht, +1.1 * dx, s, cross);    
}

void drawUI() {
  leftButton.display();
  rightButton.display();
  resetButton.display();
  drawAim();
}

void drawAim() {
  eye();
  pushStyle();
  stroke(220, 180);
  strokeWeight(20);
  point(0, 0, 100);
  popStyle();
}

boolean centerSelected(float d) {
  float sx = screenX(0, 0, 0);
  float sy = screenY(0, 0, 0);
  return abs(sx - 0.5 * width) < d && abs(sy - 0.5 * height) < d;  
}

class Button {
  float x, y, z, s;
  boolean selected;  
  PImage img;
  
  Button(float x, float y, float z, float s, PImage img) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.s = s;   
    this.img = img;
  }
  
  void display() {
    float l = 0.5 * s;
    pushStyle();
    pushMatrix();
    translate(x, y, z);
    selected = centerSelected(l);
    beginShape(QUAD);
    if (selected) {
      stroke(220, 180);
      strokeWeight(5);
    } else {      
      noStroke();
    } 
    tint(#59C5F5);
    texture(img);
    vertex(-l, +l, 0, 1);
    vertex(-l, -l, 0, 0);
    vertex(+l, -l, 1, 0);
    vertex(+l, +l, 1, 1);
    endShape();
    popMatrix();
    popStyle();
  }
}