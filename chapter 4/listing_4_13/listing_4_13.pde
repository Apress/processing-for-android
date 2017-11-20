// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PShape grid, sel;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  grid = createShape(GROUP);
  for (int j = 0; j < 4; j++) {
    float y0 = map(j, 0, 4, 0, height) + 10;
    float y1 = map(j+1, 0, 4, 0, height) - 10;        
    for (int i = 0; i < 8; i++) {
      float x0 = map(i, 0, 8, 0, width) + 10;
      float x1 = map(i+1, 0, 8, 0, width) - 10;
      PShape sh = createShape(RECT, x0, y0, x1 - x0, y1 - y0, 30);
      grid.addChild(sh);
    }
  }
}

void draw() {
  background(180);
  shape(grid); 
}

void mousePressed() {
  int i = int(float(mouseX) / width * 8);
  int j = int(float(mouseY) / height * 4);
  int idx = j * 8 + i;
  sel = grid.getChild(idx);
  sel.setFill(color(#FA2D45));
}

void mouseReleased() {
  sel.setFill(color(#C252FF));
}