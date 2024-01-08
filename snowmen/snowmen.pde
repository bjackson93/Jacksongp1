SnowMan s1, s2, s3;

void setup() {
  size(800, 600);
  s1 = new SnowMan(520, 320);
  s2 = new SnowMan(220, 120);
  s3 = new SnowMan(120, 420);
  strokeWeight(2);
  stroke(255);
  fill(#742828);
}

void draw() {
  background(80);
  s1.display();
  s2.display();
  s3.display();
}
