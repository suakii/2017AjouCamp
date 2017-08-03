
PImage img;
boolean stop = false;

void setup() {
  img = loadImage("suwon.jpg");
  //size(img.width, img.height);
  size(640, 480);
  image(img, 0, 0);
  loadPixels();
  frameRate(10);
}

void draw() {
  if (!stop) {
    for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
        int newx = int(random(x-1, x+2));
        int newy = int(random(y-1, y+2));
        newx = constrain(newx, 0, width-1);
        newy = constrain(newy, 0, height-1);
        pixels[y*width+x] = pixels[newy*width+newx];
      }
    }
    updatePixels();
  }
}

void mousePressed() {
  stop = !stop;
}