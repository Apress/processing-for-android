int s0;
int m0;

void setup() {
  noStroke();
  strokeWeight(2);
}

void draw() {
  background(0);
  
  int h = hour() % 12;
  int m = minute();
  int s = second();
  
  if (s0 != s) {
    m0 = millis();
    s0 = s;
  }
  float f = (millis() - m0)/1000.0;
  
  float sf = s + f;
  float mf = m + sf/60.0;
  float hf = h + mf/60.0;
  
  float hAngle = map(hf, 0, 12, 0, TWO_PI);
  float mAngle = map(mf, 0, 60, 0, TWO_PI);
  float sAngle = map(sf, 0, 60, 0, TWO_PI);
  
  translate(width/2, height/2 + wearInsets().bottom/2);
  fill(wearAmbient() ? 0 : #F0DB3F);
  ellipse(0, 0, width, width);
  drawLine(hAngle, width/2);

  fill(wearAmbient() ? 0 : #FFB25F);
  ellipse(0, 0, 0.75 * width, 0.75 * width);
  drawLine(mAngle, 0.75 * width/2);
    
  fill(wearAmbient() ? 0 : #ED774D);
  ellipse(0, 0, 0.5 * width, 0.5 * width);
  drawLine(sAngle, 0.5 * width/2);

  fill(0);
  ellipse(0, 0, 0.25 * width, 0.25 * width);     
}

void drawLine(float a, float r) {
  pushStyle();
  stroke(wearAmbient() ? 255 : 0);
  pushMatrix();
  rotate(a);
  line(0, 0, 0, -r);
  popMatrix();
  popStyle();
}