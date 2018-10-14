void keyPressed() {
  switch (key) {
  case ' ':
    playing = !playing;
    if (playing) {
      vfx.loop();
    } else {
      vfx.pause();
    }
    break;

  case 'b':
    blur = ! blur;
    break;
    
  case ',':
    closeColourDistance = closeColourDistance - 1;
    break;
    
  case '.':
    closeColourDistance = closeColourDistance + 1;
    break;
    
  case '/':
    dynamicRange =! dynamicRange;
  }
}

void mousePressed() {
  colorCorrecting =! colorCorrecting;
}
