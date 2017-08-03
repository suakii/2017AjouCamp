
String[] allwords;  

String delimiters = " ,.?!;:[]";

IntDict concordance;

void setup() {
  size(1000, 640);

  String url = "http://www.gutenberg.org/files/45/45-0.txt";
  String[] rawtext = loadStrings(url);

  String everything = join(rawtext, "" );

  allwords = splitTokens(everything, delimiters);

  // Make a new empty dictionary
  concordance = new IntDict();

  for (int i = 0; i < allwords.length; i++) {
    String s = allwords[i].toLowerCase();
    concordance.increment(s);
  }

  concordance.sortValuesReverse();
}

void draw() {
  background(255);

  int h = 20;
  String[] keys = concordance.keyArray();

  for (int i = 0; i < height/h; i++) {
    String word = keys[i];
    int count = concordance.get(word);

    fill(51);
    rect(0, i*20, count/4, h-4);
    fill(0);
    text(word + ": " + count, 10+count/4, i*h+h/2);
    stroke(0);
  }
}