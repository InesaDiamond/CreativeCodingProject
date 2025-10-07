float rotY = 0;
int numNebulaSpheres = 10;  // TODO: Cahange this later - GOD how many TODOs havw I gotttt

// store pos, size, and colours for each nebula sphere
PVector[] positions = new PVector[numNebulaSpheres];
float[] sizes = new float[numNebulaSpheres];
color[] colours = new color[numNebulaSpheres];

void setup() {
  size(600, 600, P3D);
  windowMove(1300, 170);  // TODO: Delete later - just so I don't have to keep moving the window to where i want it
  noStroke();
  
  // create random positions, sizes, and colours ONCE
  for (int i = 0; i < numNebulaSpheres; i++) {
    positions[i] = new PVector(
      random(-100, 100),  // width
      random(-200, 200),  // height
      random(-100, 100)   // depth
      // TODO: Change these later  - ughhhhh why doesn't it highlight stupid processing
    );

    sizes[i] = random(60, 140);  // different blob sizes

    colours[i] = color(
      random(120, 200),  // red
      random(80, 150),   // green
      random(180, 255),  // blue
      random(40, 100)    // transparency
      // TODO: Change these later
      // TODO: also I think I saw something about gradients on that processing page - try that later
    );
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);  // centre of wondow obv
  lights();

  rotY += 0.01;   // rotation speed
  rotateY(rotY);

  // draw all nebula spheres
  for (int i = 0; i < numNebulaSpheres; i++) {
    pushMatrix();
      translate(positions[i].x, positions[i].y, positions[i].z);
      fill(colours[i]);
      sphere(sizes[i]);
    popMatrix();
  }
}
