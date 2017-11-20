// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

fullScreen();
orientation(PORTRAIT);
PFont titleFont = createFont("Serif-Bold", 25 * displayDensity);
PFont bodyFont = createFont("Serif", 18 * displayDensity);
PFont footFont = createFont("Serif-Italic", 15 * displayDensity);
String[] lines = loadStrings("borges.txt");
String title = lines[0];
String body = lines[1];
String footer = lines[2];
textFont(titleFont);
textAlign(CENTER, CENTER);
fill(120);
text(title, 10, 10, width - 20, height * 0.1 - 20);
textFont(bodyFont);
text(body, 10, height * 0.1, width - 20, height * 0.8);
textAlign(RIGHT, BOTTOM);     
textFont(footFont);
text(footer, 10, height * 0.9 + 10, width - 20, height * 0.1 - 20);