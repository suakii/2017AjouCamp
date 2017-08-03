int[] data;
void setup() { 
  size(640, 360);
  String[] stuff = loadStrings("data.txt");
  data = int(split(stuff[0], ',' ));
}
void draw() {
  background(255);
  stroke(0);
  for (int i = 0; i < data.length; i ++ ) {
    fill(data[i]); 
    rect(i*64, 0, 20, data[i]);
  }
}