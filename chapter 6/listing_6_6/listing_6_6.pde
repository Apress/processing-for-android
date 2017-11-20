// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.os.Environment;

PImage defImage, currImage;
ArrayList<String> imageNames = new ArrayList<String>();
int lastChange;
int swapInterval = 10;

void setup() {
  fullScreen();
  defImage = loadImage("default.jpg");
  if (!wallpaperPreview()) {
    requestPermission("android.permission.READ_EXTERNAL_STORAGE", "scanForImages");
  }
  loadRandomImage();  
}

void draw() {
  background(0);
  float ratio = float(currImage.width)/float(currImage.height);
  float w = wallpaperHomeCount() * width;  
  float h = w/ratio;
  if (h < height) {
    h = height;
    w = ratio * h;
  }  
  float x = map(wallpaperOffset(), 0, 1, 0, -(wallpaperHomeCount()-1) * width);
  float y = (height - h)/2;
  image(currImage, x, y, w, h);
  int t = millis();
  if (swapInterval * 1000 < t - lastChange) {
    loadRandomImage();
    lastChange = t;
  }
}

void loadRandomImage() {
  if (imageNames.size() == 0) {
    currImage = defImage;
  } else {
    int i = int(random(1) * imageNames.size());
    String fn = imageNames.get(i);
    currImage = loadImage(fn);
  }    
}

void scanForImages(boolean grantedPermission) {
  if (grantedPermission) {
    File dcimDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
    String[] subDirs = dcimDir.list();
    if (subDirs == null) return;
    for (String d: subDirs) {
      if (d.charAt(0) == '.') continue;
      File fullPath = new File (dcimDir, d);  
      File[] listFiles = fullPath.listFiles();
      for (File f: listFiles) {
        String filename = f.getAbsolutePath().toLowerCase();
        if (filename.endsWith(".jpg")) imageNames.add(filename);
      }
    }
  }
}