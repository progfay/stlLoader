class Triangle {
  public  PVector[] vertex  = new PVector [3];
  public  PVector   gravity = new PVector();
  
  private float amt = random(1);
  private int   d   = random(1) < 0.5 ? 1 : -1;
  
  private color fillColor = color(255);

  Triangle(String str) {
    String[] v = str.split(" vertex ");
    for (int i = 1; i < 4; i++) {
      String[] c = v[i].split(" ");
      this.vertex[i-1] = new PVector(float(c[0]), float(c[1]), float(c[2]));
    }
    this.gravity = this.gravity();
  }

  PVector gravity() {
    return PVector.add(this.vertex[0], this.vertex[1]).add(this.vertex[2]).div(3);
  }
  
  void setColor(color c) {
    this.fillColor = c;
  }
  
  void translate(PVector vector) {
    for(int i = 0; i < 3; i++) {
      this.vertex[i].add(vector);
    }
    this.gravity = this.gravity();
  }

  // with beginShape(TRIANGLES)/endShape()
  void draw() {
    this.amt += this.d * random(0.05);
    if(amt <= 0 || 1 <= amt) {
      this.amt = constrain(amt, 0, 1);
      this.d *= -1;
    }
    for (int i = 0; i < 3; i++) {
      fill(this.fillColor);
      vertex(PVector.lerp(this.gravity, this.vertex[i], amt));
    }
  }
}


void vertex(PVector vector) {
  vertex(vector.x, vector.y, vector.z);
}