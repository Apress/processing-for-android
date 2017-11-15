// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.os.Environment;
import java.io.FileOutputStream;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

int maxParticles = 200;
int swapInterval = 10;
Field field;
ArrayList<Particle> particles;
ArrayList<String> imageNames = new ArrayList<String>();
int lastChange;

void setup() {
  fullScreen(P2D);
  frameRate(25);  
  field = new Field();
  if (!wallpaperPreview()) {
    requestPermission("android.permission.READ_EXTERNAL_STORAGE", "scanForImages");
  }  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < maxParticles; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
  loadRandomImage();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
}

void draw() {
  for (Particle b: particles) {
    b.update(field);
    b.display();
  }
  int t = millis();
  if (swapInterval * 1000 < t - lastChange) {
    thread("loadRandomImage");
    lastChange = t;
  }
}

void loadRandomImage() {
  if (imageNames.size() == 0) {
    field.update("default.jpg");
  } else {
    int i = int(random(1) * imageNames.size());
    String sourceFn = imageNames.get(i);
    try {
      File destFile = sketchFile("cropped.jpg");
      Bitmap bitmap = croppedBitmap(sourceFn);      
      OutputStream fout = new FileOutputStream(destFile);
      bitmap.compress(Bitmap.CompressFormat.JPEG, 85, fout);
      field.update("cropped.jpg");
    } catch (Exception ex) {
      println("An error while cropping has occurred");
      field.update("default.jpg");
    }
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

Bitmap croppedBitmap(String sourceFile) {
  BitmapFactory.Options options = new BitmapFactory.Options();
  options.inJustDecodeBounds = false;
  options.inSampleSize = 4;  
  Bitmap src = BitmapFactory.decodeFile(sourceFile, options);  
  int srcW = options.outWidth;
  int srcH = options.outHeight;
  float ratio = float(width)/float(height);
  float srcRatio = float(srcW)/float(srcH);
  int cropX, cropY, cropW, cropH;
  if (ratio < srcRatio) { 
    cropH = srcH;
    cropW = int(ratio * cropH);    
  } else {
    cropW = srcW;
    cropH = int(cropW / ratio);
  }
  cropX = (srcW - cropW)/2;
  cropY = (srcH - cropH)/2;
  return Bitmap.createBitmap(src, cropX, cropY, cropW, cropH);
}