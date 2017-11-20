// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(300, 300);
int numLobes = 4;
float radAnchor = 50;
float radControl = 150; 
float centerX = width/2;
float centerY = height/2;
beginShape();
for (int i = 0; i < numLobes; i++) {
  float a = map(i, 0, numLobes, 0, TWO_PI);
  float a1 = map(i + 1, 0, numLobes, 0, TWO_PI);
  float cx0 = centerX + radControl * cos(a);
  float cy0 = centerY + radControl * sin(a);
  float cx1 = centerX + radControl * cos(a1);
  float cy1 = centerY + radControl * sin(a1);
  float x0 = centerX + radAnchor * cos(a); 
  float y0 = centerY + radAnchor * sin(a);
  float x1 = centerX + radAnchor * cos(a1); 
  float y1 = centerY + radAnchor * sin(a1);    
  vertex(x0, y0);
  bezierVertex(cx0, cy0, cx1, cy1, x1, y1);
}
endShape();