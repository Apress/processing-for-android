// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(600, 300);  

beginShape(QUADS);
vertex(5, 250);
vertex(590, 250);
vertex(590, 290);
vertex(5, 290);
endShape();
  
beginShape();
vertex(30, 25);
vertex(90, 90);
vertex(210, 10);
vertex(160, 120);  
vertex(210, 270);  
vertex(110, 180);
vertex(10, 270);
vertex(60, 150);
endShape(CLOSE);  

beginShape(TRIANGLES);
vertex(50, 30);
vertex(90, 75);
vertex(110, 30);
endShape(); 
  
ellipse(470, 80, 70, 70);