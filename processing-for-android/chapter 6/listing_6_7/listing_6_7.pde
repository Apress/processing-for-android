// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

ArrayList<Particle> particles;
Field field;

void setup() {
  size(1200, 600);
  field = new Field();
  particles = new ArrayList<Particle>();
}

void draw() {
  background(255);
  field.display();
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update(field);
    p.display();
    if (p.dead()) particles.remove(i);
  }
    
}

void mouseDragged() {
  field.update(mouseX, mouseY, mouseX - pmouseX, mouseY - pmouseY);  
  particles.add(new Particle(mouseX, mouseY));
}