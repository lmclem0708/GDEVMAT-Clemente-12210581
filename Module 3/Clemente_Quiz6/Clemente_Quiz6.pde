void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}

// function to get x and y for the second line in order to make the lightsaber look flipped
PVector reverseMousePos()
{
  float x = -(mouseX - Window.widthPx / 2);
  float y = mouseY - Window.heightPx / 2;
  
  return new PVector(x, y);
}


void draw()
{
  background(130);
  
  // set up red glow
  PVector side = mousePos();
  PVector side2 = reverseMousePos();
  
  side.normalize().mult(200);
  side2.normalize().mult(200);
  
  
  // set up white glow 
  PVector glow = mousePos();
  PVector glow2 = reverseMousePos();
  
  glow.normalize().mult(199);
  glow2.normalize().mult(199);
  
  // set up black handle 
  PVector handle = mousePos();
  PVector handle2 = reverseMousePos();
  
  handle.normalize().mult(55);
  handle2.normalize().mult(55);
  
  // change stroke weight and color before every lightsaber part
  strokeWeight(12);
  stroke(255, 0, 0);
  line(0, 0, side.x, side.y);
  line(0, 0, side2.x, side2.y);
  
  strokeWeight(6);
  stroke(255, 255, 255);
  line(0, 0, glow.x, glow.y);
  line(0, 0, glow2.x, glow2.y);
  
  strokeWeight(9);
  stroke(0, 0, 0);
  line (0, 0, handle.x, handle.y);
  line (0, 0, handle2.x, handle2.y);
  
   
}
