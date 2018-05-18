PGraphics pixelationOf(PImage image, int scale) {
  PGraphics pg = createGraphics(scale * image.width, scale * image.height);
  pg.beginDraw();
  pg.loadPixels();
  image.loadPixels();
  for(int i = 0; i < pg.height; i++)
    for (int j = 0; j < pg.width; j++) {
      int p = i * pg.width + j;
      int iprime = i / scale;
      int jprime = j / scale;
      int pprime = iprime * image.width + jprime;
      pg.pixels[p] = image.pixels[pprime];
  }
  pg.updatePixels();
  pg.endDraw();
  return pg;
}