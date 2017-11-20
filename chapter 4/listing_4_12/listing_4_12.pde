// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(650, 200, P2D);
PShape circle = createShape(ELLIPSE, 100, 100, 100, 100);
PShape poly = createShape();
poly.beginShape(QUADS);
poly.vertex(200, 50);
poly.vertex(300, 50);
poly.vertex(300, 150);
poly.vertex(200, 150);
poly.endShape();
PShape group = createShape(GROUP);
group.addChild(circle);
group.addChild(poly);
shape(circle);
shape(poly);
translate(300, 0);
shape(group);