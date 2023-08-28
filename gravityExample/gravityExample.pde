float xPos;
float yPos;
float xVelo;
float yVelo;
float gravity;
float r;

void setup() {
  size(800, 600);
  xPos = 20;
  yPos = 180;
  xVelo = 2;
  yVelo = 0;
  gravity = 1;
  r = .25;
}

void draw() {
  background(90);
  Head(xPos, yPos, r);
  xPos += xVelo;
  yPos += yVelo;
  yVelo += gravity;
  if (xPos > width) {
    xPos = 0;
  }
  if (yPos > height - 50) {
    yVelo = -yVelo;
  }
}

void Head(float x, float y, float r) {
  push();
  translate(x, y);
  rotate(r);
  fill(#ab993e);
  rect(0, 0, 60, 60, 0);
  fill(#FF0004);
  rect(0, 0, 45, 45, 0);
  fill(0, 0, 255);
  ellipse(0, 0, 30, 30);
  fill(255, 0, 0);
  ellipse(35, 35, 10, 10);
  ellipse(0, 40, 10, 10);
  ellipse(40, 0, 10, 10);
  //do not remove
  popMatrix();
}
void keyPressed() {

  if (key == '1') {
    rotate(r);
    r += 1;
  }
  if (key == '2') {
    rotate(r);
    r += -10;
  }
}
