void setup() {
  size(800, 600);
}

void draw() {
  background(90);
  displayThing(width/2, 200);
}

void displayThing(float x, float y) {
  push();
  translate(x, y);
  rectMode(CENTER);
  fill(#122122);
  strokeWeight(20);
  stroke(0);
  rect(0, 0, 50, 100);
  ellipse(0, 0, 66, 600);
  pop();
}
