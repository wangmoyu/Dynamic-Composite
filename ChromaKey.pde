PImage chromakey(Movie m, color [] keyColours) {
  PImage frame = createImage(m.width, m.height, ARGB);

  frame.set(0, 0, m);
  frame.loadPixels();

  for (int i = 0; i < frame.pixels.length; i += 2) {
    for (int j = 0; j < keyColours.length; j += 1) {
      if (similar(frame.pixels[i], keyColours[j])) {
        frame.pixels[i] = color(0, 0, 0, 0);
        frame.pixels[i + 1] = color(0, 0, 0, 0);
        break;
      }
    }
  }
  frame.updatePixels();
  return frame;
}

boolean similar(color c1, color c2) {
  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2)) <= closeColourDistance;
}