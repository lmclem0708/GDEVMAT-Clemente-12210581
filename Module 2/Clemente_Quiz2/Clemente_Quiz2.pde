void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); // creates instance of walker 
Walker myWalker2 = new Walker();
void draw()
{
  int rng = int(random(5)); // random value from 0 to 5
  println(rng);
  
  myWalker.render();
  myWalker.randomWalk();
  
  myWalker2.render();
  myWalker2.randomWalkBiased();
} 
