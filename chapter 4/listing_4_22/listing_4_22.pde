// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(900, 300);
PFont titleFont = createFont("Serif", 32);
PFont textFont = createFont("Serif", 28);
textFont(titleFont);
textAlign(CENTER);
fill(120);
text("On Exactitude in Science", width/2, 60);
textFont(textFont);
textAlign(RIGHT);
textLeading(60);
text("...In that Empire, the Art of Cartography attained such Perfection " + 
     "that the map of a single Province occupied the entirety of a City, " +
     "and the map of the Empire, the entirety of a Province.", 
     20, 100, width - 40, height - 20);