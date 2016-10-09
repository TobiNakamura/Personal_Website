Charector satellite;

void setup() {
  size(window.innerWidth, window.innerHeight);
  //size(1000, 1000);
  satellite = new Charector(350, 650, window.innerWidth/2, window.innerHeight/2);
  //satellite = new Charector(350, 650, 250, 250);
}


void draw() {
  background(#060300);
  satellite.move();
}

class Charector {
  PVector pos = new PVector();
  PVector vel = new PVector(0, 0);
  PVector center = new PVector();
  float G = 0.01;
  PImage rosetta;
  Charector(float x, float y, float cx, float cy){
    pos.x = x;
    pos.y = y;
    center.x = cx;
    center.y = cy;
    rosetta = loadImage("Rosetta.png");
  }
  
  void move(){
    PVector mPos = new PVector(mouseX, mouseY);
    float mag = G / PVector.dist(pos, mPos);
    PVector a = PVector.sub(mPos, pos);
    a.mult(mag);
    vel.add(a);
    
    mag = G / PVector.dist(pos, center);
    a = PVector.sub(center, pos);
    a.mult(mag);
    vel.add(a);
    
    pos.add(vel);
    
    noStroke();
    imageMode(CENTER);
    image(rosetta, pos.x, pos.y, 640, 306);  // Draw image using CENTER mode
  }
}
