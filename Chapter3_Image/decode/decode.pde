// Decodes an encoded image, assuming information stored in least significant 4 bits

PImage img; 

int clearMask = 0xF0F0F0;  // & with color to remove leftmost 4 bits from all R/G/B channels

void setup() {
  img = loadImage("encoded.png");   // Load the encoded picture
  size(577, 577);      // Size the sketch to be the same size as the picture

  img.loadPixels();  
  for (int i=0; i<img.pixels.length; i++) {
    color ip = img.pixels[i];
    // Strip off the most significant 4 bits of R, G, and B colors
    //modify
    ip;//
    // left shift and move the least significant 4 bits into the leftmost position.
    //modify
    ip;//
    // Replace the decoded pixel back into the picture
    img.pixels[i] = ip;
  }

  img.updatePixels();
  image(img, 0, 0);
} // end setup()
