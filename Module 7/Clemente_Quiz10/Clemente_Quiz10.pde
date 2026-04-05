Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
PVector wind = new PVector(0.1, 0);
Walker [] walkers = new Walker[10];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posX = 0;
   
   for (int i = 0; i < 10; i++)
   {
     posX = 2 * (Window.windowWidth/10) * (i - 5);
     walkers[i] = new Walker();
     walkers[i].position = new PVector(posX, 300);
     walkers[i].r = random(255);
     walkers[i].g = random(255);
     walkers[i].b = random(255);
     walkers[i].a = random(255);
     walkers[i].mass = random(5, 10);
     walkers[i].scale = walkers[i].mass * 10;
   }
}


void draw()
{
  background(255);
  ocean.render();
  for (Walker w : walkers)
  {
    w.render();
    w.update();
    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.applyForce(wind); // apply wind to walker
    w.applyForce(gravity); // apply gravity to walker 
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    // f = -uNv
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // apply friction to walker
    
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
