class Cell {
  float x, y;
  float w, h;
  color c;
  Cell(float tx, float ty, float tw, float th, color tc) {
    x=tx;
    y=ty;
    w=tw;
    h=th;
    c=tc;
  }
  void setGrid(color sc) {
    c=sc;
  }
  void display() {
    stroke(255);
    fill(c);
    rect(x, y, w, h);
  }
}