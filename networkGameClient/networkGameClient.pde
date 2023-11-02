Network net;
String serverIP = "10.33.93.175"; //IP from server
float x;

void setup() {
  size(1800, 400);
  net = new Network(this);
  net.startClient(serverIP);
  x = 400;
}

void draw() {
  String letters = net.getString();
  ellipse(x, 300, 20, 20);
  if (letters != null) {
    background(90);
    textSize(60);
    text(letters, 20, 100);
    x = float (letters);
  }
  if (x >= 1800) {

  }
}

void keyPressed() {
  net.putString(str(key));
}
