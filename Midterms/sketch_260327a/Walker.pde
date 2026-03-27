public class Walker
{
  float gaussian = randomGaussian();
  float standardDeviation = 100;
  float mean = 0;
 
  float scale;
  
  float standardDeviation2 = 50;
  float mean2 = 1;
  
  float x = random(-510, 510) * gaussian + mean; // setting x and y variables for position PVector with gaussian method 
  float y = random(-360, 360) * gaussian + mean;
  
  PVector position = new PVector(x, y);
  
  color random = color(random(255), random(255), random(255), random(60, 100));

  PVector dir = new PVector();
  float speed = 0.03;
  
 
   void resetVariables() // variable to be called upon every reset 
   {
     x = random(-510, 510) * gaussian + mean; 
     y = random(-360, 360) * gaussian + mean;
    position = new PVector(x, y);
   }
  void render() // render method for black hole
  {
     
    noStroke();
    fill(255);
    circle(position.x, position.y, 50);
    
  }
  
  void gaussianRender() // render method for other matter
  {
    noStroke();
    
    fill(random);
    circle(position.x, position.y, scale);
  
  }
  
  void follow() // allows other matter to go to black hole's position 
  {
   position.x += (dir.x * speed);
   position.y += (dir.y * speed);
  }
  
}
