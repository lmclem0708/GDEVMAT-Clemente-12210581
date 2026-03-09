void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  
  float standardDeviation = 100;
  float mean = 0;
  
  float standardDeviation2 = 50;
  float mean2 = 1;
  
  float x = random(-510, 510) * gaussian + mean; // 510 chosen here because it is half of the width size, allowing it to cover the whole screen 
  float scale = standardDeviation2 * gaussian + mean2;
  noStroke();
  
  fill (255, 10);
  color random = color(random(255), random(255), random(255), random(10, 100));
  fill(random);
  circle(x, random(-360, 360), scale); // 360 chosen here because it is half of the height size
  
  
}
