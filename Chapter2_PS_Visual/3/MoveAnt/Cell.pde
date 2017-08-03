class Cell {
  float x,y;   // x,y location
  float w,h;   // width and height
  int value;
  boolean current;
  // Cell Constructor
  Cell(int i, int j) {
    x = j;
    y = i;
    value = 0;
    current = false;
  } 
  
  
  void setGrid(int value) {
    this.value = value; 
  }

  void display() {
    stroke(127);
    fill(value);
    if (current)
      fill(255,0,0);
    rect(x*cellWidth,y*cellHeight,cellWidth-1,cellHeight-1); 
    current = false;
  }
}