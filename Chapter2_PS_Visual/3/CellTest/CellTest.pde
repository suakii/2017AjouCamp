
int cols = 5;
int rows =7;
int cellWidth, cellHeight;

int n = 22;
Cell[][]  grid = new Cell[rows][cols];
void setup() {

  size(600, 600);
  cellWidth = width/cols;
  cellHeight = height/rows;
  
  for (int i = 0; i < rows; i++) 
    for (int j = 0; j < cols; j++) 
      grid[i][j] = new Cell(i, j);
  background(0);
  
  for (int i = 0; i < rows; i++) 
      for (int j = 0; j < cols; j++) 
        grid[i][j].display();

}