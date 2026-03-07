float time = 0;
float amplitude = 50f;
float frequency = 0.5f;
void setup()
{
  size (1280, 720, P3D);
  camera (0, 0, -(height/2.0) /  tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  //circle (0, 0, 15);
  
  //strokeWeight(2);
  //color white = color(255, 255, 255);
  //fill (white);
  //stroke (white);
  //line (-75, -75, 75, 75);
   
   drawCartesianPlane();
   drawLinearFunction();
   drawQuadraticFunction();
   drawCircle();
   drawSineWave();
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line (300, 0, -300, 0);
  line (0, -300, -0, 300);
  
  for (int i = -300; i <= 300; i+= 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  /*
    f(x) = x + 2 
    Let x be 4, then y = 6 (4, 6);
    Let x be -5, then y = -3 (-5. -3);
  */
  color purple = color(180, 0, 255);
  fill(purple);
  noStroke();
  
  /* -5x + 30 */
  for (int x = -60; x<= 60; x++)
  {
    circle(x, (-5 * x) + 30, 5);
  }
  
}

void drawQuadraticFunction()
{
    /*
      f(x) = x^2 + 2x - 5;
      Let x be 2, then y = 3
      Let x be -1, then y = -6
    */
    color yellow = color(255, 255, 0);
    fill(yellow);
    stroke(yellow);
    /* f(x) = x^2 - 15x - 3 */
   for (float x = -300; x <= 300; x += 0.1f)
   {
     circle(x * 10, ((float)Math.pow(x, 2) - (x * 15) - 3), 5);
   }
  
}

void drawCircle()
{
  color blue = color (0, 0, 255);
  fill(blue);
  stroke(blue);
  
  float radius = 50;
  
  for (int x = 0; x<= 360; x++)
   {
     circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
   }
}

void drawSineWave()
{
  color blue = color (0, 255, 255);
  fill(blue);
  stroke(blue);
  
  float diameter = 6;
  
  for (int i = -50; i < diameter + 50; i++)
  {
  circle(i * diameter, amplitude*sin(frequency * (time + i)), diameter);
  
  }
  
  time += 0.5f;
}

void keyPressed()
{
  if (keyCode == UP)
  {
    amplitude += 10f;
    frequency += 5f;
  }
  else if (keyCode == DOWN)
   {
     amplitude -= 10f;
     frequency -= 5f;
   }
}
