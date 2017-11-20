class Field {
  PVector[][] field;

  Field() {
    field = new PVector[width][height];
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        field[i][j] = new PVector(0, 0);
      }
    }
  }

  void update(int x, int y, float vx, float vy) {
    for (int i = max(0, x - 20); i < min(x + 20, width); i++) {
      for (int j = max(0, y - 20); j < min(y + 20, height); j++) {
        PVector v = field[i][j];
        v.set(vx, vy);
        v.normalize();                  
      }
    }
  }
  
  PVector lookup(int x, int y) {
    return field[x][y];
  }
  
  void display() {
    int resolution = 20;
    int cols = width / resolution;
    int rows = height / resolution;
    for (int i = 1; i < cols; i++) {
      for (int j = 1; j < rows; j++) {
        int x = i * resolution;
        int y = j * resolution;
        PVector v = lookup(x, y);
        pushMatrix();        
        translate(x, y);
        stroke(28, 117, 188);
        strokeWeight(2);
        rotate(v.heading());
        float len = v.mag() * (resolution - 2);
        if (0 < len) {
          float arrowsize = 8;
          line(0, 0, len, 0);
          line(len, 0, len-arrowsize, +arrowsize/2);
          line(len, 0, len-arrowsize, -arrowsize/2);
        }
        popMatrix();     
      }      
    }
  }
}