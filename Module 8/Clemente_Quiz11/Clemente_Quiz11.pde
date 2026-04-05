Walker[] bm = new Walker[5];
Walker[] sm = new Walker[5];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posX = 0;
  for (int i = 0; i < 5; i++)
  {
      posX = 2 * (Window.windowWidth/10) * (i - 2);
      bm[i] = new Walker();
      bm[i].position = new PVector(posX, random(-100, 200));
      bm[i]. mass = random(10, 20);
      bm[i].scale = bm[i].mass * 10;
      
      sm[i] = new Walker();
      sm[i].position = new PVector(posX,random(-100, 200));
      sm[i].mass = random(5, 10);
      sm[i].scale = sm[i].mass * 10;
  }
}

void draw()
{
  background(255);
  for (Walker big : bm)
  {
    
    
    for (Walker small : sm)
    {
      big.update();
      big.render();
      small.update();
      small.render();
      
     
      big.applyForce(small.calculateAttraction(big));
      small.applyForce(big.calculateAttraction(small));
  
    }
  }
  
  
  
  
  
}
