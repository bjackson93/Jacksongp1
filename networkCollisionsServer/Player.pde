class Player {
  float x;
  float y;
  float xVelo;
  float yVelo;
  int id;
  float radius;
  boolean eaten;
  boolean isLeader;
  String playerName;

  Player(int id, String playerName) {
    x = random(0, width);
    y = random(0, height);
    xVelo = 0;
    yVelo = 0;
    this.id = id;
    radius = random(10, 15);
    eaten = false;
    isLeader = false;
    this.playerName = playerName;
  }

  Player(String newPlayer) {
    String parts[] = split(newPlayer, ":");
    if (parts.length != 9) {
      return;
    }

    id = int(parts[0]);
    x = float(parts[1]);
    y = float(parts[2]);
    xVelo = float(parts[3]);
    yVelo = float(parts[4]);
    radius = float(parts[5]);
    eaten = boolean(parts[6]);
    isLeader = boolean(parts[7]);
    playerName = (parts[8]);
  }

  String serialize() {
    return
      id + ":" +
      x + ":" +
      y + ":" +
      xVelo + ":" +
      yVelo + ":" +
      radius + ":" +
      eaten + ":" +
      isLeader + ":" +
      playerName;
  }

  void update() {
    if (!eaten) {
      x += xVelo;
      y += yVelo;
    }
  }

  void display() {
    if (eaten) {
      fill(#ff0000);
    } else {
      fill(#002288);
    }
    ellipse(x, y, radius * 2, radius * 2);
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

  boolean collision(Player q) {
    return dist(this.x, this.y, q.x, q.y) < this.radius + q.radius;
  }
}
