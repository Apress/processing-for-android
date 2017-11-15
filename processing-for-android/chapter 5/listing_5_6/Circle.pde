class Circle {
  color c;
  float x, y, r, vx, vy;
  Circle(float x, float y) {
    this.x = x;
    this.y = y;
    r = 70 * displayDensity;
    c = color(random(255), random(255), random(255), 100);
  }
  void grow() {
    r += 0.5 * displayDensity;
  }
  void setPosition(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void setVelocity(float vx, float vy) {
    this.vx = vx;
    this.vy = vy;
  }
  void draw() {
    x += vx;
    y += vy;
    if (x < 0 || x > width) vx = -vx;
    if (y < 0 || y > height) vy = -vy;    
    fill(c);
    ellipse(x, y, r, r);
  }
}