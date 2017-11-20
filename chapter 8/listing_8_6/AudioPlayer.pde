import android.media.MediaPlayer;
import android.content.res.AssetFileDescriptor;
import android.media.AudioManager;

class AudioPlayer extends MediaPlayer {
  boolean loadFile(PApplet app, String fileName) {
    AssetFileDescriptor desc;
    try {
      desc = app.getActivity().getAssets().openFd(fileName);
    } catch (IOException e) {
      println("Error loading " + fileName);
      println(e.getMessage());
      return false;
    }
    
    if (desc == null) {
      println("Cannot find " + fileName);
      return false;
    }
    
    try {
      setDataSource(desc.getFileDescriptor(), desc.getStartOffset(), desc.getLength());
      setAudioStreamType(AudioManager.STREAM_MUSIC);
      prepare();
      return true;
    } catch (IOException e) {
      println(e.getMessage());
      return false;
    }
  }

  void play() {
    if (isPlaying()) seekTo(0);
    start();
  }
}