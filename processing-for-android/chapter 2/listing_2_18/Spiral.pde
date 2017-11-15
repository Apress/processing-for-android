void drawSpiral(float xc, float yc, float a) {
  pushMatrix();
  pushStyle();
  translate(xc, yc);   
  rotate(PI + a);
  noFill();
  beginShape();
  float maxt = random(5, 10);
  float maxr = random(20, 70);
  float sign = (random(1) < 0.5) ? -1 : +1;  
  float x0 = maxr * cos(sign);
  float y0 = maxr * sin(sign);
  for (float t = 1; t < maxt; t += 0.5) {
    float r = maxr/t;
    float x = r  * cos(sign * t) - x0;
    float y = r  * sin(sign * t) - y0;
    vertex(x, y);
  }
  endShape();
  noStroke();
  fill(random(310, 360), 80, 80);
  float x1 = (maxr/maxt) * cos(sign * maxt) - x0;
  float y1 = (maxr/maxt) * sin(sign * maxt) - y0;
  float r = random(5, 10);
  ellipse(x1, y1, r, r);
  popStyle();
  popMatrix();
}