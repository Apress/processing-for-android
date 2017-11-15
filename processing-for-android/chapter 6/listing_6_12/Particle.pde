class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size;
  color colour;
  int life;  
  float maxAccel;
  float maxSpeed;    
  int maxLife;

  Particle(float x, float y) {
    position = new PVector(x, y);
    size = random(2, 4) * displayDensity;
    velocity = new PVector(0, 0);    
    acceleration = new PVector(0, 0);
    maxSpeed = random(2, 5);
    maxAccel = random(0.1, 0.5);    
    maxLife = int(random(5, 20));
  }

  void update(Field flow) {
    if (life == 0) {
      colour = flow.lookupColor(position);
    } else if (life > frameRate * maxLife) {
      position.x = random(width);
      position.y = random(height);
      life = 0;
      colour = flow.lookupColor(position);
    }
    
    PVector desired = flow.lookupVector(position);
    acceleration.x = maxSpeed * desired.x - velocity.x;
    acceleration.y = maxSpeed * desired.y - velocity.y;
    acceleration.limit(maxAccel);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    
    if (position.x < -size) position.x = width + size;
    if (position.y < -size) position.y = height + size;
    if (position.x > width + size) position.x = -size;
    if (position.y > height + size) position.y = -size;
    
    life++;
  }

  void display() {
    float theta = velocity.heading();
    noStroke();
    pushMatrix();
    translate(position.x,position.y);
    rotate(theta);
    fill(colour);
    beginShape(QUADS);    
    vertex(-2*size, -size);
    vertex(+2*size, -size);
    vertex(+2*size, +size);
    vertex(-2*size, +size);
    endShape();
    popMatrix();
  }
}