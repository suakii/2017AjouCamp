/*
  Jonghwa Park
  suakii@gmail.com
  2017-08-03
*/
int gridSize = 42;
boolean isBlack = true;//white first
PImage back, black, white;

int[][] board;
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
  
  board = new int[19][19];
  for (int i = 0; i < 19; i++)
    for (int j = 0; j < 19; j++)
      board[i][j] = 0;
}
void draw(){

    for (int i = 0; i < 19; i++) {
      line(20, 20+gridSize*i, 776, 20 + gridSize*i);//row
      line(20+gridSize*i, 20, 20 + gridSize*i, 776);//column
    }
}

void mousePressed(){
  isBlack = !isBlack;
  
  int x = mouseX;
  int y = mouseY;
  int i = x / gridSize;
  int j = y / gridSize;
  
  //x = ;
  //y = ;
  
  if (board[i][j] > 0) {
    println("impossible");
    return;
  }
  if(isBlack)
    board[i][j] = 1; //black is 1
  else
    board[i][j] = 2; //white is 2
  
  
  imageMode(CENTER);

  if (isBlack)//
    image(black, x, y, 32,32);
  else
    image(white, x, y, 32,32);
}