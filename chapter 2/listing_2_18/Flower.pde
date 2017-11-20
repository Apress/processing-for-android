void drawFlower(float xc, float yc) {
  pushMatrix();
  pushStyle();
  noStroke();
  translate(xc, yc);  
  fill(random(60, 79), random(50, 60), 85, 190);
  beginShape();
  int numLobes = int(random(4, 10)); 
  for (int i = 0; i <= numLobes; i++) {
     float a = map(i, 0, numLobes, 0, TWO_PI);
     float a1 = map(i + 1, 0, numLobes, 0, TWO_PI);
     float r = random(10, 50);
     float x = r * cos(a);
     float y = r * sin(a);
     float x1 = r * cos(a1);
     float y1 = r * sin(a1);    
     vertex(0, 0);     
     vertex(0, 0);
     bezierVertex(x, y, x1, y1, 0, 0);     
  }
  endShape();
  popStyle();
  popMatrix();
}