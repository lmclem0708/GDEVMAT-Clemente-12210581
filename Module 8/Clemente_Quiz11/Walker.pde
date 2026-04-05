public class Walker
{
  color random = color(random(255), random(255), random(255), random(255));
  
  float x = -500;
  float y = 200;
  public PVector position = new PVector(x, y);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector(0, 0);
  public PVector dir = new PVector();
  public float scale = 15;
  public float mass = 1;
  public float gc = 1;
  public float velocityLimit = 10;
  
  public Walker()
  {
  }
 
  public void render()
  {
    noStroke();
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
 
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // direction 
    float distance = force.mag();
    force.normalize(); // normalize to accurately get direction 
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gc * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
  
}
