import processing.video.*;

String movieFilename = "aliens-01-720p.mp4";
String chromakeyDataFile = "chromakey1.json";

String backgroundMovieFilename = "running-720p.mp4";
//String backgroundMovieFilename = "motocross-720p.mp4";

float closeColourDistance = 0.0;
Boolean blur = false;

Movie vfx, bgReel;
Boolean playing = true;
color [] keyColours;
PImage reference;
boolean colorCorrecting = false;
boolean dynamicRange = false;
void setup() {
  size(1280, 720);
  
  loadChromaData(chromakeyDataFile);
  
  vfx = new Movie(this, movieFilename);
  vfx.loop();
  
  bgReel = new Movie(this, backgroundMovieFilename);
  bgReel.loop();
}


void draw() {
  if (frameCount%3==0){
  if (bgReel.available() && vfx.available()) {
    bgReel.read();
    vfx.read();
    image(bgReel, 0, 0);
    reference = bgReel.get(440, 380, 640, 360);

    PImage keyedFrame = chromakey(vfx, keyColours);
    if (blur) {
      keyedFrame.filter(BLUR, 1);
    } 
    if(dynamicRange){
      changeDynamicRange(reference, keyedFrame);
    }
    if(colorCorrecting){
      applyScalingsFromTo(reference, keyedFrame);
    }
    image(keyedFrame, 440, 380, 640, 360);
  }
  println(vfx.frameRate, bgReel.frameRate, frameRate/3 );
}
}