// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(480, 480);

PVector[] points = new PVector[11];
PVector[] directions = new PVector[11];
for (int i = 0; i <= 10; i++) {
  if (i < 10) {
    float a = map(i, 0, 10, 0, TWO_PI);
    float r = random(100, 200);
    points[i] = new PVector(r * cos(a), r * sin(a));
    directions[i] = PVector.fromAngle(points[i].heading() + 
                                      random(0, QUARTER_PI));
    directions[i].mult(60);
  } else {
    points[10] = points[0].copy();
    directions[10] = directions[0].copy();
  }
}  

translate(width/2, height/2);
strokeWeight(2);
fill(255);
beginShape();
for (int i = 0; i < 10; i++) {
  vertex(points[i].x, points[i].y);
  PVector CP1 = PVector.add(points[i], directions[i]);
  PVector CP2 = PVector.sub(points[i+1], directions[i+1]);  
  bezierVertex(CP1.x, CP1.y, CP2.x, CP2.y, points[i+1].x, points[i+1].y);  
}
endShape();

strokeWeight(1);
for (int i = 0; i <= 10; i++) {
  PVector prevCP = PVector.sub(points[i], directions[i]);
  PVector nextCP = PVector.add(points[i], directions[i]);
  stroke(0);
  line(prevCP.x, prevCP.y, nextCP.x, nextCP.y);
  noStroke();
  fill(190, 30, 45);
  ellipse(points[i].x, points[i].y, 10, 10);  
  fill(28, 117, 188);
  ellipse(prevCP.x, prevCP.y, 7, 7);
  ellipse(nextCP.x, nextCP.y, 7, 7);
}