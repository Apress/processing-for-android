// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.os.Looper;
import android.view.MotionEvent;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;

GestureDetector detector;
PVector swipe = new PVector();

void setup() {  
  fullScreen();
  Looper.prepare();
  detector = new GestureDetector(surface.getActivity(), new SwipeListener());
  strokeWeight(20);
}

boolean surfaceTouchEvent(MotionEvent event) {
  detector.onTouchEvent(event);
  return super.surfaceTouchEvent(event);
}

void draw() {
  background(210);
  translate(width/2, height/2);
  drawArrow();
}

void drawArrow() {
  float x = swipe.x; 
  float y = swipe.y;
  line(0, 0, x, y);  
  swipe.rotate(QUARTER_PI/2);
  swipe.mult(0.85);
  line(x, y, swipe.x, swipe.y);
  swipe.rotate(-QUARTER_PI);
  line(x, y, swipe.x, swipe.y);
  swipe.rotate(QUARTER_PI/2);
  swipe.mult(1/0.85);
}

class SwipeListener extends GestureDetector.SimpleOnGestureListener {    
  boolean onFling(MotionEvent event1, MotionEvent event2,
                  float velocityX, float velocityY) {
    swipe.set(velocityX, velocityY);
    swipe.normalize();
    swipe.mult(min(width/2, height/2));
    return true;
  }
}