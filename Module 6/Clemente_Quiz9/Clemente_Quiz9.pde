Walker[] walkers = new Walker[8];
PVector wind = new PVector(0.15, 0);
 

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posY = 0;
  
  for (int i = 0; i < 8; i++)
  {
    posY = 2 * (Window.windowHeight/10) * (i - 4);
     walkers[i] = new Walker();
     walkers[i].position = new PVector(-500, posY);
     walkers[i].mass = 8 - i;
     walkers[i].scale = walkers[i].mass * 15;
  }
}

void draw()
{
  background(255);
  line(0, -1280, 0, 1280);
  for (Walker w : walkers)
  {
     
    // Friction = -1 * mew * N * v
    float mew = 0.01f; // coefficient of friction
     float normal = 1;
     float frictionMagnitude = mew * normal;
     PVector friction = w.velocity.copy();
     friction.mult(-1);
     friction.normalize();
     friction.mult(frictionMagnitude);
     
     w.applyForce(friction);
     if (w.position.x >= 0)
     {
       mew = 0.4f;
       frictionMagnitude = mew * normal;
       friction = w.velocity.copy();
       friction.mult(-1);
       friction.normalize();
       friction.mult(frictionMagnitude);
       
       w.applyForce(friction);
     }
     
     //
     PVector gravity = new PVector(0, -0.15 * w.mass);
     w.render();
     w.update();
 
     //walkers[i].applyForce(wind);
     w.applyForce(wind);
     
     w.bounce();
     if (mousePressed)
     {
     
      w.position.x = -500;
      mew = 0.01f;
      w.applyForce(friction);
      w.applyForce(wind);
      
    }
    
  }
  
  }
 
 
