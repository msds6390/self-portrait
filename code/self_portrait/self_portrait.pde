// Sources:
// https://www.youtube.com/watch?v=NbX3RnlAyGU&index=7&list=PLRqwX-V7Uu6YB9x6f23CBftiyx0u_5sO9
// http://learningprocessing.com/examples/chp15/example-15-12-PixelNeighborEdge
// http://learningprocessing.com/examples/chp15/example-15-14-Pointillism


PImage img, img2, jostein, brian;
int pointillize = 32;

void setup() {
  jostein = loadImage("jostein.jpg");
  brian = loadImage("brian.jpg");
  
  // Determine image sizes for subsequent combination
  // jostein.jpg => (4752, 3168)
  // brian.jpg => (287, 303)
  // Need to reduce img size to that of img2
  //print(jostein.width, jostein.height, brian.width, brian.height);
  
  jostein.resize(896, 943);
  
  // Source:
  // https://forum.processing.org/one/topic/combine-two-pimages-into-one.html
  //PGraphics output = createGraphics(287 * 2, 303, JAVA2D);
  //output.beginDraw();
  //output.image(jostein, 0, 0);
  //output.image(brian, 287, 0);
  //output.endDraw();
  
  // Make sure graphic is an image
  //img = output;
  
  // Change size of window
  int windowWidth = 896 * 2;
  //size(896, 943);
  surface.setSize(windowWidth, 943);
  background(255);
  smooth();
}

void draw() {
  //image(brian, 0, 0);
  //background(166, 233, 166);  // pastel green

  fill(166, 233, 166);
  rect(0, 0, 896, 943); 
 
  // left ear
  //drawLeftEar(int x, int y, int wid, int ht)
  fill(255, 218, 185);    // light peach
  drawLeftEar(115, 470, 50, 100);
  fill(255, 170, 150);    // darker peach
  drawLeftEar(115, 470, 30, 60);

  // right ear
  //drawRightEar(int x, int y, int wid, int ht)
  fill(255, 218, 185);
  drawRightEar(745, 220, 45, 130);
  fill(255, 170, 150);
  drawRightEar(745, 220, 30, 70);

  // face
  fill(255, 218, 185);    // light peach
  stroke(255, 170, 150);
  strokeWeight(3);
  beginShape();
  vertex(222, 264);
  vertex(279, 212);
  vertex(306, 177);
  vertex(331, 163);
  vertex(424, 160);
  vertex(503, 138);
  vertex(569, 151);
  vertex(672, 254);
  vertex(631, 536);
  vertex(514, 625);
  vertex(470, 638);
  vertex(411, 636);
  vertex(254, 550);
  endShape(CLOSE);

  // hair
  fill(70);
  stroke(0);
  strokeWeight(7);
  beginShape();
  vertex(222, 264);  // left btm anchor then going CCW
  vertex(279, 212);
  vertex(306, 177);  // streak 7 & 8 start XY (btm of hair)
  vertex(331, 163);  // streak 6 start XY (btm of hair)
  vertex(424, 160);  // streak 3 & 4 start XY (btm of hair)
  vertex(503, 138);  // streak 2 start XY (btm of hair)
  vertex(569, 151);  // streak 1 start XY (btm of hair)
  vertex(672, 254);  // btm right anchor
  vertex(677, 160);  // top right anchor
  vertex(617, 90);   // streak 2 end XY (top of hair)
  vertex(558, 45);   // streak 3 end XY (top of hair)
  vertex(467, 13);   // streak 4 end XY (top of hair)
  vertex(387, 19);   // streak 5 end XY (top of hair)
  vertex(280, 91);   // streak 7 end XY (top of hair)
  vertex(236, 167);  // streak 8 end XY (top of hair)
  endShape(CLOSE);

  // hair streak
  noFill();
  strokeWeight(10);
  // curve(beginning anchor of curve - intensity, start XYs, end XYs, end anchor of curve - intensity)
  curve(1000, 151, 569, 151, 650, 129, 1000, 500);  // streak 1 (right streak)
  curve(800, 400, 503, 138, 617, 90, 1000, 400);    // streak 2
  curve(800, 400, 424, 160, 558, 45, 1000, 400);    // streak 3
  curve(800, 400, 424, 160, 467, 13, 500, 100);     // streak 4
  curve(800, 400, 373, 160, 387, 19, 500, 50);    // streak 5
  curve(400, 400, 331, 163, 295, 82, 250, 50);    // streak 6
  curve(250, 100, 306, 177, 280, 91, 50, 50);    // streak 7
  curve(500, 500, 306, 177, 236, 167, 300, 200);    // streak 8
  endShape(CLOSE);

  // small mouth
  stroke(205, 115, 115);
  strokeWeight(10);
  beginShape();
  // line(x1, x2, x3, x4)
  line(384, 531, 410, 535);
  endShape(CLOSE);

  // smile
  if (mouseX > 384 && mouseX < 500)
  {
    if (mouseY > 500 && mouseY < 550)
    {
      strokeWeight(10);
      stroke(255, 218, 185);
      line(384, 531, 410, 535);
      strokeWeight(15);
      stroke(205, 115, 115);
      bezier(384, 531, 400, 540, 450, 531, 514, 500);
    }
  }

  //eyes open
  noStroke();
  fill(255);
  ellipse(358, 359, 65, 40);  // left eye
  ellipse(525, 353, 65, 40);  // right eye
  fill(43, 30, 24);    // dark brown
  ellipse(358, 359, 30, 30);
  ellipse(525, 353, 30, 30);
  noStroke();
  fill(0);
  ellipse(358, 359, 20, 20);
  ellipse(525, 353, 20, 20);
  endShape(CLOSE);

  // left eye closed
  if (mouseX > 330 && mouseX < 380)
  {
    if (mouseY > 325 && mouseY < 370)
    {
      noStroke();
      fill(255, 218, 185);
      ellipse(358, 359, 70, 61);
      strokeWeight(10);
      stroke(0);
      noFill();
      bezier(325, 345, 325, 375, 395, 375, 395, 345);
    }
  }

  // right eye closed
  if (mouseX > 500 && mouseX < 550)
  {
    if (mouseY > 325 && mouseY < 370)
    {
      noStroke();
      fill(255, 218, 185);
      ellipse(525, 353, 70, 61);
      strokeWeight(10);
      stroke(0);
      noFill();
      bezier(500, 345, 500, 375, 575, 375, 575, 345);
    }
  }

  // left eyebrow
  noFill();
  stroke(0);
  strokeWeight(10);
  // line(x1, y1, x2, y2)
  line(301, 324, 381, 301);
  beginShape();
  endShape(CLOSE);

  // right eyebrow
  noFill();
  stroke(0);
  strokeWeight(10);
  beginShape();
  line(496, 292, 590, 323);
  endShape(CLOSE);

  // eyebrow raised
  if (mouseX > 280 && mouseX < 525)
  {
    if (mouseY > 275 && mouseY < 325)
    {
      strokeWeight(11);
      stroke(255, 218, 185);
      line(301, 324, 381, 301);
      line(496, 292, 590, 323);
      strokeWeight(10);
      stroke(0);
      line(301, 300, 381, 275);
      line(496, 267, 590, 300);
    }
  }

  // nose
  stroke(255, 170, 150);
  noFill();
  bezier(450, 440, 440, 455, 430, 430, 440, 400);
  endShape(CLOSE);

  textSize(100);
  fill(0, 0, 255);
  text("BY", 20, 900);
  
  // *****
  // Jostein Section
  // *****
  // Pick a random point
  //image(jostein, 896, 0);

  int x = int(random(jostein.width));
  //int x = int(random(896, 896 * 2));
  int y = int(random(jostein.height));
  int loc = x + y*jostein.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  // 845350
  float r = red(jostein.pixels[loc]);
  float g = green(jostein.pixels[loc]);
  float b = blue(jostein.pixels[loc]);
  noStroke();
  
  // Back to shapes! Instead of setting a pixel, we use the color 
  // from a pixel to draw a circle.
  fill(r,g,b,100);
  ellipse(x + 896, y, pointillize, pointillize); 
}

// Sources:
// https://processing.org/reference/random_.html
// https://processing.org/reference/keyPressed.html
void keyPressed() {
  if (pointillize == 16) {
    pointillize = int(random(32));
  } else {
    pointillize = 16;
  }
}
