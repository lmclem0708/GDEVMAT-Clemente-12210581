public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  public float scale;
  public float tScale = 0;
  
  public float g, b;
  public float tg = 0;
  public float tb = 10;
  
  void render()
  {
    scale = map(noise(tScale), 0, 1, 5, 100);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    color randomColor = color(255, g, b);
    
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    fill(randomColor);
    circle(x, y, scale);
    
   
  }
  
  void perlinWalk()
  {
    
    
    tx += 0.01f;
    ty += 0.01f;
    
    tScale += 0.01f;
    tg += 0.1f;
    tb += 0.1f;
    
  }
}
