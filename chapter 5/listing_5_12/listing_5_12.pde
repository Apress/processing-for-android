// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.os.Looper;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.SimpleOnScaleGestureListener;

ScaleGestureDetector detector;
PImage img;
float scaleFactor = 1;

void setup() {  
  fullScreen();
  img = loadImage("jelly.jpg");
  Looper.prepare();
  detector = new ScaleGestureDetector(surface.getActivity(), new ScaleListener());
  imageMode(CENTER);
}

boolean surfaceTouchEvent(MotionEvent event) {
  detector.onTouchEvent(event);
  return super.surfaceTouchEvent(event);
}

void draw() {
  background(180);
  translate(width/2, height/2);
  scale(scaleFactor);
  image(img, 0, 0);
}

class ScaleListener extends ScaleGestureDetector.SimpleOnScaleGestureListener {
  public boolean onScale(ScaleGestureDetector detector) {
    scaleFactor *= detector.getScaleFactor();
    scaleFactor = constrain(scaleFactor, 0.1, 5);
    return true;   
  } 
}