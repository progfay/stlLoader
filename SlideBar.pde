class SlideBar {
  float amt;
  float x1, x2;
  float y;
  
  private boolean isPressed = false;
  
  SlideBar(float _x1, float _x2, float _y) {
    this.x1 = _x1;
    this.x2 = _x2;
    this.y  = _y;
  }
  
  float getValue(float low, float high) {
    return lerp(low, high, this.amt);
  }
  
  void draw() {
    strokeWeight(3);
    stroke(-1);
    fill(0);
    line(this.x1, this.y, this.x2, this.y);
    ellipse(lerp(this.x1, this.x2, this.amt), this.y, 20, 20);
  }
  
  void mousePressed() {
    if(dist(mouseX, mouseY, lerp(this.x1, this.x2, this.amt), this.y) <= 20) this.isPressed = true;
  }
  
  void mouseDragged() {
    if(this.isPressed) this.amt = constrain(norm(mouseX, this.x1, this.x2), 0, 1);
  }
  
  void mouseReleased() {
    this.isPressed = false;
  }
}