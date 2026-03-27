public class Walker
{
 
  
  float x = random(-510, 510);// setting x and y variables for position PVector 
  float y = random(-360, 360);
  public PVector position = new PVector(x, y);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector dir = new PVector();
  public float scale;
  
  public float velocityLimit = 10;
  
  public Walker()
  {
  }
  public void update()
  {
    this.acceleration.add(this.dir);
    this.dir.normalize().mult(0.2);
    this.velocity.add(this.dir);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
  }
  public void render()
  {
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
