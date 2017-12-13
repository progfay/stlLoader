import java.util.Iterator;

final int T = 50;

ArrayList<Triangle> triangles = new ArrayList<Triangle>();

SlideBar barX, barY, barZ;

float rotateX = 0;
float rotateY = 0;
float rotateZ = 0;


void settings() {
  size(800, 800, P3D);
}


void setup() {
  triangles = loadSTL("low_bunny.stl");
  setTrianglesGravity(triangles);
  setColorByCluster(triangles, 16);
  barX = new SlideBar(0.10, 680, 780, 600);
  barY = new SlideBar(0.04, 680, 780, 630);
  barZ = new SlideBar(0.07, 680, 780, 660);
}


void draw() {
  background(0);
  barX.draw();
  barY.draw();
  barZ.draw();
  translate(width/2, height/3*2, -2000);
  rotateX(radians(rotateX += barX.getValue(0, 5)));
  rotateY(radians(rotateY += barY.getValue(0, 5)));
  rotateZ(radians(rotateZ += barZ.getValue(0, 5)));
  beginShape(TRIANGLES);
  stroke(250);
  strokeWeight(2);
  for (Iterator i = triangles.iterator(); i.hasNext(); ) {
    ((Triangle)(i.next())).draw();
  }
  endShape();
}

void mousePressed() {
  barX.mousePressed();
  barY.mousePressed();
  barZ.mousePressed();
}

void mouseDragged() {
  barX.mouseDragged();
  barY.mouseDragged();
  barZ.mouseDragged();
}

void mouseReleased() {
  barX.mouseReleased();
  barY.mouseReleased();
  barZ.mouseReleased();
}