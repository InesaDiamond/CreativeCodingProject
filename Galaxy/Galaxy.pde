float rotY = 0;
int numNebulaSpheres = 10;  // TODO: Cahange this later - GOD how many TODOs havw I gotttt i don't need this fkn many bro
float nebulaX = 100, nebulaY = 200, nebulaZ = 100;  // half sizes of the nebula in each dimension - maybee change this later to make the nebulas less boxy if needed but it works for now - as in use a radius instead

// store pos, size, and colours for each nebula sphere
PVector[] positions = new PVector[numNebulaSpheres];
float[] sizes = new float[numNebulaSpheres];
color[] colours = new color[numNebulaSpheres];

float overlapFactor = 0.5;  // 0 = no overlap, 1 = can fully overlap  // TODO: Change - againnnnnnnnnnnn - not another changeeeeeee

void setup() {
  size(600, 600, P3D);
  windowMove(1300, 170);  // TODO: Delete later - just so I don't have to keep moving the window to where i want it
  noStroke();
  sphereDetail(30);  // This is the auto detail anyway but might want to decrease if i add lots of spheres
  
  // create random sizes for the spheres
  for (int i = 0; i < numNebulaSpheres; i++) {
    sizes[i] = random(60, 140);  // different nebula sphere sizes
  }

  // place positions with brute force rejection 
  // TODO: consider Poisson-Disc Sampling or Algorithm for Radius Determination  - idk yet tho
  // TODO: also add centre bias later to get rid of any weird gaps in the middle
  for (int i = 0; i < numNebulaSpheres; i++) {
    positions[i] = placeNebulaSphere(i);
  }

    for (int i = 0; i < numNebulaSpheres; i++) {
      colours[i] = color(
        random(120, 200),  // red
        random(80, 150),   // green
        random(180, 255),  // blue
        random(40, 70)     // transparency
        // TODO: Change these later
        // TODO: also I think I saw something about gradients on that processing page - try that later - wait there was other shit too - look at that shit again
      );
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, 0);  // centre of wondow obv

  rotY += 0.01;   // rotation speed
  rotateY(rotY);
  lights();

  // draw all nebula spheres
  for (int i = 0; i < numNebulaSpheres; i++) {
    pushMatrix();
      translate(positions[i].x, positions[i].y, positions[i].z);
      fill(colours[i]);
      sphere(sizes[i]);
    popMatrix();
  }
}




// helper functions

PVector placeNebulaSphere(int i) {
  PVector p;
  int tries = 0;
  while (true) {
    // random point
    p = new PVector(
      random(-nebulaX, nebulaX),  // width
      random(-nebulaY, nebulaY),  // height
      random(-nebulaZ, nebulaZ)   // depth
    );

    boolean ok = true;
    for (int j = 0; j < i; j++) {   // checking all previous spheres that have already been placed
      float minDist = (sizes[i] + sizes[j]) * (1 - overlapFactor);
      if (PVector.dist(p, positions[j]) < minDist) {
        ok = false;
        break;
      }
    }
    
    tries++;
    if (ok || tries > 200) break;  // jussttt in case - just accept after way too fkn many tries - maybe 200 is too much? probably - I'll see how slow it is later - I don't wanna add ANOTHER TODO - well ig i just did ughhhhh why is this comment so long fml 
    // also I haven't f'ed this up - if the spheres are too big or the space where the point is generated is too small there has to be some overlap, it would be impossible to have none - that's also why thats there
  }
  return p;
}
