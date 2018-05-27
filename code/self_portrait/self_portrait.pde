// Sources:
// https://www.youtube.com/watch?v=NbX3RnlAyGU&index=7&list=PLRqwX-V7Uu6YB9x6f23CBftiyx0u_5sO9
// http://learningprocessing.com/examples/chp15/example-15-12-PixelNeighborEdge
// http://learningprocessing.com/examples/chp15/example-15-14-Pointillism


PImage img, img2, jostein, brian;
int pointillize = 16;

void setup() {
  jostein = loadImage("jostein.jpg");
  brian = loadImage("brian.jpg");
  
  // Determine image sizes for subsequent combination
  // jostein.jpg => (4752, 3168)
  // brian.jpg => (287, 303)
  // Need to reduce img size to that of img2
  print(jostein.width, jostein.height, brian.width, brian.height);
  
  jostein.resize(287, 303);
  //brian.resize(800, 600);
  
  // Source:
  // https://forum.processing.org/one/topic/combine-two-pimages-into-one.html
  PGraphics output = createGraphics(287 * 2, 303, JAVA2D);
  output.beginDraw();
  output.image(jostein, 0, 0);
  output.image(brian, 287, 0);
  output.endDraw();
  
  // Make sure graphic is an image
  img = output;
  
  // Change size of window
  surface.setSize(img.width, img.height);
  background(255);
  smooth();
}

void draw() {
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Back to shapes! Instead of setting a pixel, we use the color 
  // from a pixel to draw a circle.
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize); 
}

void keyPressed() {
  if (pointillize == 16) {
    pointillize = int(random(32));
  } else {
    pointillize = 16;
  }
}
