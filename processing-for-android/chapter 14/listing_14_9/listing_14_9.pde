// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import processing.vr.*;

PMatrix3D eyeMat = new PMatrix3D();
PMatrix3D objMat = new PMatrix3D();
PVector cam = new PVector();
PVector dir = new PVector(); 
PVector front = new PVector(); 
PVector objCam = new PVector(); 
PVector objFront = new PVector();
PVector objDir = new PVector();
float boxSize = 140;
PVector boxMin = new PVector(-boxSize/2, -boxSize/2, -boxSize/2);
PVector boxMax = new PVector(+boxSize/2, +boxSize/2, +boxSize/2);
PVector hit = new PVector();

void setup() {
  fullScreen(PVR.STEREO);
}

void draw() {
  getEyeMatrix(eyeMat);
  cam.set(eyeMat.m03, eyeMat.m13, eyeMat.m23);
  dir.set(eyeMat.m02, eyeMat.m12, eyeMat.m22);
  PVector.add(cam, dir, front);  
  background(120);
  translate(width/2, height/2);
  lights();
  drawGrid();
  drawAim();
}

void drawGrid() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      float x = map(i, 0, 3, -350, +350);
      float y = map(j, 0, 3, -350, +350);
      pushMatrix();
      translate(x, y);
      rotateY(millis()/1000.0);
      getObjectMatrix(objMat);
      objMat.mult(cam, objCam);
      objMat.mult(front, objFront);
      PVector.sub(objFront, objCam, objDir);
      boolean res = intersectsLine(objCam, objDir, boxMin, boxMax, 0, 1000, hit);
      if (res) {
        strokeWeight(5);
        stroke(#2FB1EA);
        if (mousePressed) {
          fill(#2FB1EA);
        } else {
          fill(#E3993E);
        }
      } else {
        noStroke();
        fill(#E3993E);
      }
      box(boxSize);
      popMatrix();
    }
  }
}

void drawAim() {
  eye();
  stroke(47, 177, 234, 150);
  strokeWeight(50);
  point(0, 0, 100);
}

boolean intersectsLine(PVector orig, PVector dir, 
  PVector minPos, PVector maxPos, float minDist, float maxDist, PVector hit) {
  PVector bbox;
  PVector invDir = new PVector(1/dir.x, 1/dir.y, 1/dir.z);

  boolean signDirX = invDir.x < 0;
  boolean signDirY = invDir.y < 0;
  boolean signDirZ = invDir.z < 0;

  bbox = signDirX ? maxPos : minPos;
  float txmin = (bbox.x - orig.x) * invDir.x;
  bbox = signDirX ? minPos : maxPos;
  float txmax = (bbox.x - orig.x) * invDir.x;
  bbox = signDirY ? maxPos : minPos;
  float tymin = (bbox.y - orig.y) * invDir.y;
  bbox = signDirY ? minPos : maxPos;
  float tymax = (bbox.y - orig.y) * invDir.y;

  if ((txmin > tymax) || (tymin > txmax)) {
    return false;
  }
  if (tymin > txmin) {
    txmin = tymin;
  }
  if (tymax < txmax) {
    txmax = tymax;
  }

  bbox = signDirZ ? maxPos : minPos;
  float tzmin = (bbox.z - orig.z) * invDir.z;
  bbox = signDirZ ? minPos : maxPos;
  float tzmax = (bbox.z - orig.z) * invDir.z;

  if ((txmin > tzmax) || (tzmin > txmax)) {
    return false;
  }
  if (tzmin > txmin) {
    txmin = tzmin;
  }
  if (tzmax < txmax) {
    txmax = tzmax;
  }
  if ((txmin < maxDist) && (txmax > minDist)) {
    hit.x = orig.x + txmin * dir.x;
    hit.y = orig.y + txmin * dir.y;
    hit.z = orig.z + txmin * dir.z;
    return true;
  }
  return false;
}