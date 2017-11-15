class Field {
  PImage flowImage;
  
  synchronized void update(String fn) {
    flowImage = loadImage(fn);
    flowImage.loadPixels();
  }
  
  synchronized PVector lookupVector(PVector v) {
    if (flowImage == null) return PVector.random2D();
    color c = flowImage.pixels[getPixelIndex(v.x, v.y)];
    float theta = map(brightness(c), 0, 255, 0, TWO_PI);
    return PVector.fromAngle(theta);
  }  
  
  synchronized color lookupColor(PVector v) {
    if (flowImage == null) return color(0, 0, 100, 0);
    color c = flowImage.pixels[getPixelIndex(v.x, v.y)];
    float h = hue(c);
    float s = saturation(c);
    float b = 50;
    return color(h, s, b, 70);
  }
  
  int getPixelIndex(float x, float y) {
    int ix = int(map(x, 0, width, 0, flowImage.width - 1));
    int iy = int(map(y, 0, height, 0, flowImage.height - 1));
    return constrain(ix + iy * flowImage.width, 0, flowImage.pixels.length - 1);    
  }  
}