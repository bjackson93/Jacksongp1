Network net;
String serverIP = "10.33.93.65"; //my IP
Player players[];
int numPlayers;
int maxPlayers;

void setup() {
  size(1600, 400);
  net = new Network(this);
  net.startServer();
  maxPlayers = 40;
  players = new Player[maxPlayers];
  numPlayers = 0;
}

void draw() {
  background(90);
  textSize(160);
  text("Server IP: " + serverIP, 20, 180);
  text("Num players: " + numPlayers, 20, 380);
  for (Player p : players) {
    if (p != null) {
      p.update();
      p.display();
    }
  }
  String s = net.getNext();
  if (s == null) {
    return;
  }
  String parts[] = split(s, ":");
  if (parts.length == 1) {
    if (parts[0].equals("new")) {
      players[numPlayers] = new Player(numPlayers);
      net.broadcast(players[numPlayers].serialize());
      numPlayers++;
    }
  } else if (parts.length == 3) {
    int id = int(parts[0]);
    String type = parts[1];
    char key = parts[2].charAt(0);

    Player p = getPlayerById(id);
    if (p == null) {
      return;
    }
    if (type.equals("down")) {
      println("key pressed");
      p.keyPressed(key);
    }
    if (type.equals("up")) {
      p.keyReleased(key);
    }

    net.broadcast(p.serialize());
  }
}

Player getPlayerById(int id) {
  for (Player p : players) {
    if (p != null) {
      if (p.id == id) {
        println("processing player " + p.id);
        return p;
      }
    }
  }

  return null;
}
