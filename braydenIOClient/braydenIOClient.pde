Network net;
String serverIP = "10.33.93.65";
Player players[];
int numPlayers;
int maxPlayers;
int myId;
String lastAction;

void setup() {
  size(1600, 1200);
  net = new Network(this);
  net.startClient(serverIP);
  maxPlayers = 40;
  players = new Player[maxPlayers];
  numPlayers = 0;
  myId = -1;
  net.putString("new");
  lastAction = "";
}

void draw() {
  background(90);
  String s = net.getString();
  if (s != null) {
    Player p = new Player(s);
    if (myId == -1) {
      myId = p.id;
      println("my id is " + myId);
    }
    players[p.id] = p;
  }

  for (Player p : players) {
    if (p != null) {
      p.update();
      p.display();
    }
  }
}

Player getPlayerById(int id) {
  for (Player p : players) {
    if (p == null) {
      return null;
    }
    if (p.id == id) {
      return p;
    }
  }

  return null;
}

void keyPressed() {
  String thisAction = myId + ":down:" + key;
  if (!thisAction.equals(lastAction)) {
    net.putString(thisAction);
    lastAction = thisAction;
  }
}

void keyReleased() {
  String thisAction = myId + ":up:" + key;
  if (!thisAction.equals(lastAction)) {
    net.putString(thisAction);
    lastAction = thisAction;
  }
}
