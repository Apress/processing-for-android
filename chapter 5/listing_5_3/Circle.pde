class Circle {
  color c;
  float x, y, r;
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
  void draw() {
    fill(c);
    ellipse(x, y, r, r);
  }
}