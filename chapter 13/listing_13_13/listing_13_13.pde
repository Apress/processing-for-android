// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

PVector[] coords; 
PShape group;

void setup() {
  fullScreen(P3D);
  textFont(createFont("SansSerif", 20 * displayDensity));
  sphereDetail(10);
  group = createShape(GROUP);
  String[] lines = loadStrings("points.txt");  
  coords = new PVector[lines.length];
  for (int i = 0; i < lines.length; i++) {
    String line = lines[i];
    String[] valores = line.split(" ");
    float x = float(valores[0]);
    float y = float(valores[1]);
    float z = float(valores[2]);
    coords[i] = new PVector(x, y, z);   
    PShape sh;
    if (random(1) < 0.5) {
      sh = createShape(SPHERE, 20);
      sh.setFill(#E8A92A);
    } else {
      sh = createShape(BOX, 20);
      sh.setFill(#4876B2);
    }
    sh.translate(x, y, z);    
    sh.setStroke(false);
    group.addChild(sh);
  }  
  noStroke();  
}

void draw() {
  background(255);  
  fill(0);
  text(frameRate, 50, 50);  
  fill(255, 0, 0);
  lights();
  translate(width/2, height/2, 0);
  rotateY(map(mouseX, 0, width, 0, TWO_PI));
  shape(group);
}