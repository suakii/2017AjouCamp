
// recursion source
PImage photo;
void setup() {
  size(640,480);
  photo = loadImage("FloodFillTest.png");
  image(photo, 0, 0);
  loadPixels();
}
void draw(){}
color SC;
float offset=5;   
void mousePressed(){
  SC=pixels[mouseY*width+mouseX];
  println(red(SC),green(SC),blue(SC));
  dfs(mouseX, mouseY);
  updatePixels();
  println("finished");
}
int count = 0;
void dfs(int x, int y){
  if (x<0 || x>=width || y<0 || y>=height) return ;
  println(count++);
  boolean ok=false;
  if ( abs( red(SC) - red(pixels[y*width+x]) ) < offset )  ok = true; 
  if ( abs( green(SC) - green(pixels[y*width+x]) ) < offset )  ok = true;
  if ( abs( blue(SC) - blue(pixels[y*width+x]) ) < offset )   ok = true; 
  
  if ( ok ){       
    pixels[y*width+x]=#FFFFFF;
    dfs(x-1,y);
    dfs(x+1,y);
    dfs(x,y-1);
    dfs(x,y+1);
  } 
  return ;
}