PImage mapImage;

int clat = 0;
int clon = 0;
int ww = 1024;
int hh = 512;
int zoom = 1;

//
String[] earthquakes;


float mercX(float lon) {
  lon = radians(lon);
  float a = (256 / PI) * pow(2, zoom);
  float b = lon + PI;
  return a * b;
}

float mercY(float lat) {
  lat = radians(lat);
  float a = (256 / PI) * pow(2, zoom);
  float b = tan(PI / 4 + lat / 2);
  float c = PI - log(b);
  return a * c;
}


void setup() {
  size(1024, 512);
  
  String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
                clat + "," + clon + "," + zoom + "/" +
                ww + "x" + hh +
                "?access_token=pk.eyJ1Ijoic3Vha2lpIiwiYSI6ImNpenRoMGphNTAxOGwyd285OXF0M2p1YW8ifQ.nk0TliFb6oHu5kUI86KcIA";
  mapImage = loadImage(url, "jpg");
  //println(url);
  //println(mapImage);
  
  translate(width/2, height/2);
  imageMode(CENTER);
  image(mapImage, 0, 0);

  earthquakes = loadStrings("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.csv");
  //println(earthquakes);
  
  float cx = mercX(clon);
  float cy = mercY(clat);
  //println("cx" + cx);
  //println("cy" + cy);
  //ellipse(mercX(126)-cx, mercY(37)-cy, 10,10);//seoul
  
  
  for (int i = 1; i < earthquakes.length; i++) {
    String[] data = earthquakes[i].split(",");
    //println(data);
    float lat = float(data[1]);
    float lon = float(data[2]);
    float mag = float(data[4]);
    float x = mercX(lon) - cx;
    float y = mercY(lat) - cy;
    mag = sqrt(pow(10, mag));
    float magmax = sqrt(pow(10,10));
    float d = map(mag, 0, magmax, 0, 180);
    stroke(255, 0, 255);
    fill(255, 0, 255, 200);
    ellipse(x, y, d, d);
  }
  
}