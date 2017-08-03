PImage mapImage;

int clat = 0;
int clon = 0;
int ww = 1024;
int hh = 512;
int zoom = 1;

void setup() {
  size(1024, 512);
  
  String url = "https://api.mapbox.com/styles/v1/mapbox/dark-v9/static/" +
                clat + "," + clon + "," + zoom + "/" +
                ww + "x" + hh +
                "?access_token=pk.eyJ1Ijoic3Vha2lpIiwiYSI6ImNpenRoMGphNTAxOGwyd285OXF0M2p1YW8ifQ.nk0TliFb6oHu5kUI86KcIA";
  mapImage = loadImage(url, "jpg");
  println(url);
  println(mapImage);
  translate(width/2, height/2);
  imageMode(CENTER);
  image(mapImage, 0, 0);
}