// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(480, 480);

PVector[] points = new PVector[11];
for (int i = 0; i <= 10; i++) {
  if (i < 10) {
    float a = map(i, 0, 10, 0, TWO_PI);
    float r = random(100, 200);
    points[i] = new PVector(r * cos(a), r * sin(a));
  } else {
    points[10] = points[0].copy();
  }
}  

translate(width/2, height/2);
fill(255);
beginShape();
for (int i = 0; i <= 10; i++) {
  if (i == 0 || i == 10) curveVertex(points[i].x, points[i].y);    
  curveVertex(points[i].x, points[i].y);
}
endShape();

fill(0);
for (int i = 0; i <= 10; i++) {
  ellipse(points[i].x, points[i].y, 10, 10);
}