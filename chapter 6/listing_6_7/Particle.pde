class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  int life;
  float maxAccel;
  float maxSpeed;
  int maxLife;

  Particle(float x, float y) {
    position = new PVector(x, y);
    size = random(15, 25);
    velocity = new PVector(0, 0);    
    acceleration = new PVector(0, 0);    
    maxSpeed = random(2, 5);
    maxAccel = random(0.1, 0.5);
    maxLife = int(random(100, 200));
  }

  boolean dead() {
    return maxLife < life;
  }

  public void setPosition(float x, float y) {
    position.set(x, y);
  }

  void update(Field flow) {
    PVector desired = flow.lookup(int(position.x), int(position.y));
    acceleration.x = maxSpeed * desired.x - velocity.x;
    acceleration.y = maxSpeed * desired.y - velocity.y;
    acceleration.limit(maxAccel);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    life++;
  }

  void display() {
    noStroke();
    fill(180, 150);    
    ellipse(position.x, position.y, size, size);    
  }
}