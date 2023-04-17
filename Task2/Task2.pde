/** 
 * Two Bouncing Ball with Vectors and Object
 * 
 *                    2021041776 JaeHyun Cho
 */
Ball b1, b2;  //define 2 balls

void setup() {
  size(640, 360);
  b1 = new Ball(100, 100, 1.5, 2.1, 0.2, 48);   //ball1 properties
  b2 = new Ball(50, 50, 3.0, 4.2, 0.1, 70);     //ball2 properties
}

void draw() {
  background(0);
  fill(127);
  b1.display();
  fill(150, 200, 0);
  b2.display(); 
}

//Ball Object
class Ball {
  int radius;
  PVector location;
  PVector velocity;
  PVector gravity;

  Ball(int inx, int iny, float flx, float fly, float grv, int inrad) {
    location = new PVector(inx, iny);
    velocity = new PVector(flx, fly);
    gravity = new PVector(0, grv);
    radius = inrad;
  }

  void display() {
    location.add(velocity);
    velocity.add(gravity);

    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }

    if (location.y > height) {
      velocity.y = velocity.y * -0.95;
      location.y = height;
    }

    stroke(255);
    strokeWeight(2);
    ellipse(location.x, location.y, radius, radius);
  }
}
