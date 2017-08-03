

void setup() {
  PImage origin = loadImage("colony.jpg");
  PImage img = loadImage("colony.jpg");
  PImage msk = loadImage("mask.jpg");
  background(0);
  size(1050, 350);
  img.mask(msk);
  img.filter(THRESHOLD, 0.69);
  image(origin, 0, 0);
  image(msk, 350, 0);
  image(img, 700, 0);
  
  int white = 0;
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      int loc = i + j*img.width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      if (r == 255 && g == 255 && b == 255)
        white++;
      
    }
  }
  println("white = " + white);
} 