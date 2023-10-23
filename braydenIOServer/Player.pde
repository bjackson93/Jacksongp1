class Player {
  float x;
  float y;
  float xVelo;
  float yVelo;
  int id;
  int c;

  Player(int id) {
    x = random(0, width);
    y = random(0, height);
    xVelo = 0;
    yVelo = 0;
    c = color(random(0, 255), random(0, 255), random(0, 255));
    this.id = id;
  }

  Player(String newPlayer) {
    String parts[] = split(newPlayer, ":");
    if (parts.length != 5) {
      return;
    }

    id = int(parts[0]);
    x = float(parts[1]);
    y = float(parts[2]);
    xVelo = float(parts[3]);
    yVelo = float(parts[4]);
  }

  String serialize() {
    return
      id + ":" +
      x + ":" +
      y + ":" +
      xVelo + ":" +
      yVelo;
  }

  void update() {
    x += xVelo;
    y += yVelo;
  }

  void display() {
    ellipse(x, y, 20, 20);
  }

  void keyPressed(char key) {
    switch(key) {
    case 'w':
      yVelo = -5;
      break;
    case 's':
      yVelo = 5;
      break;
    case 'a':
      xVelo = -5;
      break;
    case 'd':
      xVelo = 5;
      break;
    }
  }

  void keyReleased(char key) {
    switch(key) {
    case 'w':
      yVelo = 0;
      break;
    case 's':
      yVelo = 0;
      break;
    case 'a':
      xVelo = 0;
      break;
    case 'd':
      xVelo = 0;
      break;
    }
  }
}
