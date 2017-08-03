/*
  Jonghwa Park
  suakii@gmail.com
  2017-08-03
*/
int gridSize = 42;
boolean isClick = false;

void setup(){
  background(255);
  size(800,800);
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