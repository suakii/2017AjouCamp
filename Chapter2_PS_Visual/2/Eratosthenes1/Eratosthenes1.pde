int columns;
int rows;
int next;
float fill_trans;

boolean[] numbers;

void setup()
{
  size(800, 800);
  background(255);
  frameRate(2);
  fill_trans = 100;
  columns = 20;
  rows = 20;

  fill(255, 0, 0);
  stroke(0, 0, 255);

  numbers = new boolean[rows*columns+1];
  for (int i = 1; i < numbers.length; i++)
  {
    numbers[i] = true;
  }

  for (int c = 1; c <= columns; c += 1)
  {
    for (int r = 1; r <= rows; r += 1)
    {
      float cf = (c-1) * height/columns;
      float rf = (r-1) * width/rows;

      fill(255);
      noStroke();
      rect(rf, cf, width/rows, height/columns);

      fill(0, 255, 0);
      //text(str(10*(c-1) + r), rf + width/(2*rows), cf + height/(2*columns));
    }
  }
  numbers[1] = false;
  fill(0, 0, 0, fill_trans);
  rect(0, 0, width/rows, height/columns);
  next = 2;
}

void draw()
{
  if (next < rows * columns)
  {
   
    numbers[next] = true;
    int i = 2;
    //make multiples of a prime -> not prime
    while (next * i <= rows * columns)
    {
      numbers[next * i] = false;

      float rf = (next * i) % (rows);

      float cf = int((next * i) / columns);
      if (next * i % rows == 0)
      {
        rf = rf + rows;
        cf = cf - 1;
      }
      rf = rf * width/rows - width/rows;
      cf = cf * height/columns;
      fill(0, 0, 0, fill_trans);
      rect(rf, cf, width/rows, height/columns);
      i += 1;
    }

    int count = next + 1;

    //find the next prime
    while (numbers[count] == false)
    {
      count += 1;
      if (count >= rows * columns)
      {
        break;
      }
    }
    numbers[count] = true;
    next = count;
  }
}

void mouseClicked()
{
  setup();
}