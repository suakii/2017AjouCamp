PImage img;

void setup() {
  size(300, 350);
  loadData();
}

void draw() {
  background(255);

  // Display all the stuff we want to display
  image(img, 10, 10, 164, 250);
  fill(0);
}

// Grab the data from IMDB
void loadData() {
  String url = "http://www.ajou.ac.kr/kr/index.jsp";
  String[] lines = loadStrings(url);

  // Turn array into one long String
  String html = join(lines, ""); 


  // Searching for poster image
  String start = "href=\"http://www.ajou.ac.kr/\" ><img src=\"";
  String end = "\" ";
  String imgUrl = giveMeTextBetween(html, start, end);
  println("http://www.ajou.ac.kr/"+imgUrl);
  img = loadImage("http://www.ajou.ac.kr/"+imgUrl);
}

// A function that returns a substring between two substrings
String giveMeTextBetween(String s, String before, String after) {
  String found = "";
  int start = s.indexOf(before);     
  if (start == -1) {
    return "";   
  }    
  start += before.length();         
  int end = s.indexOf(after, start); 
  if (end == -1) {
    return "";          
  }
  return s.substring(start, end);    
}