public class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 7);
  
  void render()
  {
 
    noStroke();
    circle(position.x, position.y, 50);
    
  }
  
 
  void moveAndBounce()
  {
    int rng = int(random(8)); 
    
    position.add(speed);
    
    // conditions for bouncing
    if ((position.x > Window.right) || (position.x < Window.left))
    {
      color random = color(random(255), random(255), random(255)); // change color on bounce
      fill(random);
      speed.x *= -1;
    }
    
    if ((position.y > Window.top) || (position.y < Window.bottom))
    {
      color random = color(random(255), random(255), random(255));
      fill(random);
      speed.y *= -1;
    }
 
    switch(rng){
      case 0:
        position.y+=speed.y;
        break;
        
       case 1:
         position.y-=speed.y;
         break;
         
        case 2:
          position.x+=speed.x;
          break;
          
        case 3:
          position.x-=speed.x;
          break;
           
          // corner movement starts here
        case 4:
          position.y+=speed.y;
          position.x+=speed.x;
          break;
            
        case 5:
          position.y-=speed.y;
          position.x-=speed.x;
          break;
        case 6:
          position.y+=speed.y;
          position.x-=speed.x;
          break;
          
         case 7:
           position.y-=speed.y;
           position.x+=speed.x;
           break;
          
   }
    
  }
}
