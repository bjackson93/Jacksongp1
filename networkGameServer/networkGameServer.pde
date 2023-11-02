Network net;
String serverIP = "10.33.93.175"; //my IP
float x;

void setup() {
  size(800, 400);
  net = new Network(this);
  net.startServer();
  x = width/2;
}

void draw() {
  String s;
  s = net.getNext();
  if (s != null) {
    if (s.equals("a")) {
      x -= 5;
    }
    if (s.equals("d")) {
      x += 5;
    }
    net.broadcast(str(x));
  }
  background(90);
  textSize(160);
  text("Server IP: " + serverIP, 20, 180);
}

void keyPressed() {
}
