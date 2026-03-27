Walker[] walkers = new Walker[100];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  for (int i = 0; i < 100; i++) // initalize walkers array here 
   { 
     walkers[i] = new Walker();
     walkers[i].scale = random(1, 15);
   }
  //myWalker.acceleration = new PVector(-0.01, 0.1);
}
PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}
 
void draw()
{
  background(80);
   for (int i = 0; i < 100; i++) // initalize walkers array here 
   { 
     PVector direction = PVector.sub(mousePos(), walkers[i].position);
     walkers[i].dir = direction;
     walkers[i].update();
     walkers[i].render();
     walkers[i].checkEdges();
   }
 
}
