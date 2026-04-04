public class Walker
{
  color random = color(random(255), random(255), random(255));
  
  float x = -500;
  float y = 200;
  public PVector position = new PVector(x, y);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector(0.2, 0);
  public PVector dir = new PVector();
  public float scale = 15;
  public float mass = 1;
  
  public float velocityLimit = 10;
  
  public Walker()
  {
  }
 
  public void render()
  {
    fill(random);
    circle(position.x, position.y, scale);
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f); // force accumulation
  }
  public void update()
  {
    this.velocity.add(this.acceleration); // velocity.accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets accel every frame
  }
  public void bounce()
  {
    if (this.position.y <= Window.bottom)
     {
       this.position.y = Window.bottom; // safeguard position to not overflow
       this.velocity.y *= -1;
     }
     if (this.position.y >= Window.bottom)
     {
       this.velocity.y *= 1;
     }
     
     if (this.position.x <= Window.left)
     {
       this.velocity.x *= 1;
     }
     if (this.position.x >= Window.right)
     {
       this.position.x = Window.right;
       this.velocity.x *= -1;
     }
  }
}
