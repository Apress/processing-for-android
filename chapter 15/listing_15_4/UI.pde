Button leftButton, rightButton, resetButton; 
Toggle flyToggle;

void createButtons(float dx, float hlr, float ht, float s) {
  PImage left = loadImage("left-icon.png");
  leftButton = new Button(-dx, hlr, 0, s, left);  
  PImage right = loadImage("right-icon.png");
  rightButton = new Button(+dx, hlr, 0, s, right);    
  PImage cross = loadImage("cross-icon.png");
  resetButton = new Button(0, +1.0 * ht, +1.1 * dx, s, cross);
  PImage fly = loadImage("fly-icon.png");
  PImage home = loadImage("home-icon.png");
  flyToggle = new Toggle(-ht, s, fly, home); 
}

void drawUI() {
  leftButton.display();
  rightButton.display();
  resetButton.display();
  noLights();
  flyToggle.display();
  if (!flyMode) drawAim();
}

void drawAim() {
  eye();
  pushStyle();
  stroke(220, 180);
  strokeWeight(20);
  point(0, 0, 100);
  popStyle();
}

boolean selectingUI() {
  return leftButton.selected || rightButton.selected || resetButton.selected || flyToggle.selected;
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

class Toggle {
  float h, s;
  boolean selected;
  int state;
  PImage[] imgs;
  color[] colors;
  
  Toggle(float h, float s, PImage img0, PImage img1) {
    this.h = h;
    this.s = s;
    imgs = new PImage[2];    
    imgs[0] = img0;
    imgs[1] = img1;
    colors = new color[2];
    colors[0] = #F2674E;
    colors[1] = #59C5F5;
  }
    
  void display() {
    float l = 0.5 * s;
    pushStyle();
    pushMatrix();
    getEyeMatrix(eyeMat);
    translate(eyeMat.m03 + flyStep.x - width/2, eyeMat.m13 + h + flyStep.y - height/2, eyeMat.m23 + flyStep.z);
    selected = centerSelected(l);
    beginShape(QUAD);
    if (selected) {
      stroke(220, 180);
      strokeWeight(5);
    } else {      
      noStroke();
    } 
    tint(colors[state]);
    texture(imgs[state]);    
    vertex(-l, 0, +l, 0, 0);
    vertex(+l, 0, +l, 1, 0);
    vertex(+l, 0, -l, 1, 1);
    vertex(-l, 0, -l, 0, 1);    
    endShape();
    popMatrix();
    popStyle();
  }  
  
  void toggle() {
    state = (state + 1) % 2;  
  }
}