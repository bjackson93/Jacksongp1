class SnowMan  {
  float x;
  float y;
  
  SnowMan(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    ellipse(x, y-30, 60, 60);
    ellipse(x, y+30, 60, 60);
  }
}
