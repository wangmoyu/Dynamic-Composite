void changeDynamicRange(PImage r, PImage t){
  PVector rReferenceRange = new PVector(256, -1);
  PVector gReferenceRange = new PVector(256, -1);
  PVector bReferenceRange = new PVector(256, -1);
  r.loadPixels();
  for(int i = 0; i < r.pixels.length; i += 1){
    if(rReferenceRange.x > red(r.pixels[i])){
      rReferenceRange.x = red(r.pixels[i]);
    }
    if(rReferenceRange.y < red(r.pixels[i])){
      rReferenceRange.y = red(r.pixels[i]);
    }
    if(gReferenceRange.x > green(r.pixels[i])){
      gReferenceRange.x = green(r.pixels[i]);
    }
    if(gReferenceRange.y < green(r.pixels[i])){
      gReferenceRange.y = green(r.pixels[i]);
    }
    if(bReferenceRange.x > blue(r.pixels[i])){
      bReferenceRange.x = blue(r.pixels[i]);
    }
    if(bReferenceRange.y < blue(r.pixels[i])){
      bReferenceRange.y = blue(r.pixels[i]);
    }
  }
  PVector rTargetRange = new PVector(256, -1);
  PVector gTargetRange = new PVector(256, -1);
  PVector bTargetRange = new PVector(256, -1);
  t.loadPixels();
  for(int i = 0; i < t.pixels.length; i += 1){
    if(alpha(t.pixels[i]) != 0){
      if(rTargetRange.x > red(t.pixels[i])){
        rTargetRange.x = red(t.pixels[i]);
      }
      if(rTargetRange.y < red(t.pixels[i])){
        rTargetRange.y = red(t.pixels[i]);
      }
      if(gTargetRange.x > green(t.pixels[i])){
        gTargetRange.x = green(t.pixels[i]);
      }
      if(gTargetRange.y < green(t.pixels[i])){
        gTargetRange.y = green(t.pixels[i]);
      }
      if(bTargetRange.x > blue(t.pixels[i])){
        bTargetRange.x = blue(t.pixels[i]);
      }
      if(bTargetRange.y < blue(t.pixels[i])){
        bTargetRange.y = blue(t.pixels[i]);
      }
    }
  }
  for(int i = 0; i < t.pixels.length; i += 1){
    if (alpha(t.pixels[i]) != 0){
      float red = map(red(t.pixels[i]), rTargetRange.x, rTargetRange.y, rReferenceRange.x, rReferenceRange.y);
      float green = map(green(t.pixels[i]), gTargetRange.x, gTargetRange.y, gReferenceRange.x, gReferenceRange.y);
      float blue = map(blue(t.pixels[i]), bTargetRange.x, bTargetRange.y, bReferenceRange.x, bReferenceRange.y);
      t.pixels[i] = color(red, green, blue);
    }
  }
  t.updatePixels();
  
}