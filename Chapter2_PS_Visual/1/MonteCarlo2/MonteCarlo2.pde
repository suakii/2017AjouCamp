int insidecount = 0;
int totalCount = 0;
float x, y;
void setup() {
  size(800,800);
  background(0);
}
void draw() {
    translate(width/2, height/2);
    
    x = random(-width, width);
    y = random(height/2);
    stroke(0);
    if (abs(dist(0,0,x, y)) <= width/2) {
      insidecount++;
      fill(255, 0, 0);
    } else {
      fill(0, 0, 255);
  }
    ellipse(x, y, 4, 4); 
    totalCount++;
    
  noFill();
  //fill(255);
  stroke(255, 255, 255);
  arc(0, 0, 800, 800,    0, TWO_PI/2);
  //modify below code
  println(insidecount/totalCount);
}