Walker target = new Walker();
Walker[] walkers = new Walker[100];
void setup()
{
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
  background (0);
  
  for (int i = 0; i < 100; i++) // initalize walkers array here 
   {
     
     walkers[i] = new Walker();
     walkers[i].scale = random(1, 40); // set scale here so it stays static 
 
   }
   
}

void draw()
{
  background (0);
   
  for (int i = 0; i < 100; i++)
   {
     PVector direction =  PVector.sub(target.position, walkers[i].position);
     walkers[i].dir = direction;
     walkers[i].gaussianRender();
     walkers[i].follow();
   }
   target.render();
    
  if (frameCount % 200 == 0) // reset after 200 frames pass 
   {
     background (0);
     target.resetVariables();
     target.render();
     for (int i = 0; i < 100; i++)
     {
       walkers[i].resetVariables();
       PVector direction =  PVector.sub(target.position, walkers[i].position);
       walkers[i].dir = direction;
       walkers[i].gaussianRender();
       walkers[i].follow();
     }
   }
}
