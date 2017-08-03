
Cell [][] grid;
int row=10, col=10, count=0;
int [] dx = {1, 0, -1, 0};
int [] dy = {0, 1, 0, -1};
int [][] map = {
              {0, 0, 1, 0, 0, 0, 0, 0, 0, 0},
              {0, 1, 1, 0, 1, 0, 1, 0, 0, 0},
              {1, 1, 1, 0, 1, 0, 1, 0, 0, 0},
              {0, 0, 0, 0, 1, 1, 1, 0, 0, 0},
              {0, 1, 0, 0, 0, 0, 0, 0, 0, 0},
              {0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
              {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
              {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
              {0, 1, 1, 1, 0, 0, 0, 0, 0, 0},
              {0, 1, 1, 1, 0, 0, 0, 0, 0, 0}
            };

void setup() {
  size(200, 200);
  grid = new Cell[row][col];
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      grid[i][j]=new Cell(j*20, i*20, 20, 20, 0);
  mapReadArray();
  noLoop();
}

void mapReadArray() {
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      if(map[i][j]==0) grid[i][j].setGrid(color(205, 204, 255));
      else grid[i][j].setGrid(0);
}

void draw() {
  background(255);
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      grid[i][j].display();
}

void mousePressed() {
  solve();
}

void solve() {
  for(int i=0;i<row;i++)
    for(int j=0;j<col;j++)
      if(grid[i][j].c==0) {
        dfs(i, j, color(0, 128, 255));
        count++;
      }
  
  loop();
  println(count);
}

void dfs(int x, int y, color c) {
  grid[x][y].setGrid(c);
  for(int i=0;i<4;i++){
    int nx=x+dx[i], ny=y+dy[i];
    if(safe(nx, ny))
      if(grid[nx][ny].c==0) dfs(nx, ny, c);
  }
}

boolean safe(int x, int y) {
  return (x>=0 && x<10) && (y>=0 && y<10);
}