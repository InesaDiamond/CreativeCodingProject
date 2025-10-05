float rotY = 0;

void setup() {
  size(600, 600, P3D);
  windowMove(1300, 170);  // Delete later - just so I don't have to keep moving the window to where i want it
  noStroke();
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);  // centre of wondow obv
  lights();

  rotY += 0.01;   // rotation speed
  rotateY(rotY);

  fill(180, 120, 255, 120);  // last num is transparency
  sphere(120);
  
  translate(260, 0, 0);
  sphere(50);
}
