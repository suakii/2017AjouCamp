

// An Array of Bubble objects
Bubble[] bubbles;
// A Table object
Table table;

void setup() {
  size(640, 360);
  loadData();
}

void draw() {
  background(255);
  // Display all bubbles
  for (int i = 0; i < bubbles.length; i++) {
    bubbles[i].display();
    bubbles[i].rollover(mouseX, mouseY);
  }

  textAlign(LEFT);
  fill(0);
}

void loadData() {
  // Load CSV file into a Table object
  // "header" option indicates the file has a header row
  table = loadTable("data.csv", "header");

  // The size of the array of Bubble objects is determined by the total number of rows in the CSV
  bubbles = new Bubble[table.getRowCount()]; 

  // You can access iterate over all the rows in a table
  for (int i = 0; i < table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    // You can access the fields via their column name (or index)
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    float d = row.getFloat("diameter");
    String n = row.getString("name");
    // Make a Bubble object out of the data read
    bubbles[i] = new Bubble(x, y, d, n);
  }
}