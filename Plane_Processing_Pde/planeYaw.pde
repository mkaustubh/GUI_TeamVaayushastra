PImage img;

int x, y, w, h;
int angle;

void setup() {
  size(300, 300);
  img = loadImage("..//data//Yaw.png");
  x = 150;
  y = 150;
  w = img.width;
  h = img.height;
  angle =0;
}

void draw() {
  background(0);
  ellipse(150, 150, 250, 250);
  stroke(0);
  line(0, y, width, y);
  line(x, 0, x, height);
  // Change the image mode so now we specify the image
  // position using the image center rather than top-left
  // corner
  imageMode(CENTER);
  // Draw the image centred about [x, y]
  //image(img, x, y);
  // Now we want to rotate the image 'in position'
  pushMatrix(); // remember current drawing matrix)
  translate(x, y);
  rotate(radians(angle)); // rotate 45 degrees
  image(img, 0, 0);
  popMatrix(); // restore previous graphics matrix
  // Restore image mode back to default (optional)
  //imageMode(CORNER);
  angle = angle +1;
}
