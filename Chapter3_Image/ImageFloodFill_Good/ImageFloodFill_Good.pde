import java.util.Queue;
import java.util.*;
PImage photo;

void setup() {
  size(851,852);
  photo = loadImage("FloodFillTest.png");
  image(photo, 0, 0);
  loadPixels();

}

void draw(){}

color SC;
float offset=2;   
void mousePressed(){
  SC=pixels[mouseY*width+mouseX];
  println(red(SC),green(SC),blue(SC));
  floodFill(mouseX, mouseY, SC, getRandomColor());
  updatePixels();
  println("finished");
}

void floodFill(int x, int y, color orig, color fill) {
  
 Queue<PVector> queue = new LinkedList<PVector>();
 queue.add(new PVector(x, y));

 while (!queue.isEmpty()){
  
 PVector p = queue.remove();
     int position = (int)(p.y)*width+(int)p.x;
     //println(position);
     if (position >= 0 && position < 851*852) {
       if (pixels[(int)(p.y)*width+(int)p.x] == orig){
           pixels[(int)(p.y)*width+(int)p.x] = fill;
           queue.add(new PVector(p.x-1, p.y));
           queue.add(new PVector(p.x+1, p.y));
           queue.add(new PVector(p.x, p.y-1));
           queue.add(new PVector(p.x, p.y+1));
        }
    }
  }
  updatePixels();
   return;
}

color getRandomColor()
{
  return 0xFF000000 | (int) random(0x1000000); // random color (need to set alpha too)
}
