Button leftButton, rightButton, resetButton; 

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

boolean selectingUI() {
return leftButton.selected || rightButton.selected || resetButton.selected;
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