ArrayList<PVector> currentStroke = new ArrayList<PVector>();
ArrayList[] previousStrokes = new ArrayList[0];

PMatrix3D eyeMat = new PMatrix3D();
PMatrix3D objMat = new PMatrix3D();
PVector pos = new PVector();
PVector pforward = new PVector();
PVector cforward = new PVector();

void updateStrokes() {
  translate(width/2, height/2);
  rotateY(angle);  
  getEyeMatrix(eyeMat);    
  float cameraX = eyeMat.m03;
  float cameraY = eyeMat.m13;
  float cameraZ = eyeMat.m23;
  float forwardX = eyeMat.m02;
  float forwardY = eyeMat.m12;
  float forwardZ = eyeMat.m22;  
  float depth = dist(cameraX, cameraY, cameraZ, width/2, height/2, 0);    
  cforward.x = forwardX;
  cforward.y = forwardY;
  cforward.z = forwardZ;
  if (currentStroke.size() == 0 || 0 < cforward.dist(pforward)) {
    getObjectMatrix(objMat);          
    float x = cameraX + depth * forwardX;
    float y = cameraY + depth * forwardY;
    float z = cameraZ + depth * forwardZ;      
    pos.set(x, y, z);
    PVector tpos = new PVector();
    objMat.mult(pos, tpos); 
    currentStroke.add(tpos);          
  }
  pforward.x = forwardX;
  pforward.y = forwardY;
  pforward.z = forwardZ;    
}

void drawStrokes() {
  pushMatrix();
  rotateY(angle);
  strokeWeight(5);
  stroke(255);
  drawStroke(currentStroke);
  for (ArrayList p: previousStrokes) drawStroke(p);    
  popMatrix();  
}

void drawStroke(ArrayList<PVector> positions) {
  for (int i = 0; i < positions.size() - 1; i++) {
    PVector p = positions.get(i);
    PVector p1 = positions.get(i + 1);
    line(p.x, p.y, p.z, p1.x, p1.y, p1.z);
  }    
}

void startNewStroke() {
  previousStrokes = (ArrayList[]) append(previousStrokes, currentStroke); 
  currentStroke = new ArrayList<PVector>();
}

void clearDrawing() {
  previousStrokes = new ArrayList[0];
  currentStroke.clear();   
}