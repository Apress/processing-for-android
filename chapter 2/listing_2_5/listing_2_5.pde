// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(800, 800);
stroke(0);
fill(180);  
background(97);
line(width/2, 0, width/2, height);
line(0, height/2, width, height/2);  
rect(0, 0, 200, 200);
rect(width - 200, 0, 199, 200);
rect(width - 200, height - 200, 199, 199);
rect(0, height - 200, 199, 199);  
rect(200, 200, width - 400, height - 400);