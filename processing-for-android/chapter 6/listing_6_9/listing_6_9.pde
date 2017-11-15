// Processing for Android: 
// Create Mobile, Sensor-Aware, and VR Applications Using Processing
// Andres Colubri
// http://p5android-book.andrescolubri.net/

import android.os.Environment;
import java.io.FileOutputStream;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

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
    String sourceFn = imageNames.get(i);
    try {
      File destFile = sketchFile("cropped.jpg");
      Bitmap bitmap = croppedBitmap(sourceFn);      
      OutputStream fout = new FileOutputStream(destFile);
      bitmap.compress(Bitmap.CompressFormat.JPEG, 85, fout);
      currImage = loadImage("cropped.jpg");
    } catch (Exception ex) {
      println("An error while cropping has occurred");
      currImage = defImage;
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