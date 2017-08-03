/*
  Jonghwa Park
  suakii@gmail.com
  2017-08-03
*/
int gridSize = 42;
boolean isClick = false;
PImage back, black, white;
  
void setup(){
  background(255);
  size(800,800);
  
  back = loadImage("wood.png");//300*300
  black = loadImage("black-32x32.png");
  white = loadImage("white-32x32.png");
  
  //added
  for (int i = 0; i < width; i+=300) {
    for (int j = 0; j < height; j+=300) {
      image(back, i, j);
    }
  }
}
void draw(){

    for (int i = 0; i < 19; i++) {
      line(20, 20+gridSize*i, 776, 20 + gridSize*i);//row
      line(20+gridSize*i, 20, 20 + gridSize*i, 776);//column
    }
}

void mousePressed(){
   println("Modify this function");

}