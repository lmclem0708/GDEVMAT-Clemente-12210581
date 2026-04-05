public class Walker
{
  public float r = 255, g = 255, b = 255, a = 255;
  float x = -500;
  float y = 200;
  public PVector position = new PVector(x, y);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector dir = new PVector();
  public float scale = 15;
  public float mass = 1;
  
  public float velocityLimit = 10;
  
  public Walker()
  {
  }
 
  public void render()
  {
    fill(r, g, b, a);
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
 
  }
