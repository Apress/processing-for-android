// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(700, 200, P2D);
Table table = loadTable("sensor-data.csv", "header");
background(90);
stroke(247, 47, 47);
strokeWeight(4);
beginShape(LINE_STRIP);  
for (int i = 0; i < table.getRowCount(); i++) {
  TableRow row = table.getRow(i);
  int r = row.getInt("rate");
  float x = map(i, 0, table.getRowCount() - 1, 0, width);
  float y = map(r, 0, 100, height, 0);   
  vertex(x, y);
}
endShape();