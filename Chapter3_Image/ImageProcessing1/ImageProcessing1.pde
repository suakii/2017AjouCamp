PImage img;
void setup() {
  img = loadImage("suwon.jpg");
  size(640, 480);  
}
void draw() {
  background(0);
  image(img, 0, 0);
}