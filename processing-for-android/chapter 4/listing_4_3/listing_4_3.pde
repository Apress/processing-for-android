// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

size(480, 480);
translate(width/2, height/2);
int numPoints = 100;
int degree = 5;
beginShape();  
float[] coeffs = new float[degree];
for (int d = 0; d < degree; d++) {
  coeffs[d] = random(0, 1);
}
float phase = random(0, TWO_PI);
for (int i = 0; i <= numPoints; i++) {
  float theta = map(i, 0, numPoints, 0, TWO_PI);
  float rho = 5;
  for (int d = 1; d <= degree; d++) {
    rho += coeffs[d - 1] * sin(d*theta+phase);
  }
  float x = 30 * rho * cos(theta);
  float y = 30 * rho * sin(theta);
  vertex(x, y);
}
endShape();