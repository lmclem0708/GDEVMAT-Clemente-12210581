class Walker
{
  float x;
  float y;
  
  void render()
  {
 
    color random = color(random(255), random(255), random(255), random(255));
    fill(random);
    circle(x, y, 30);
    alpha (int(random(50, 100)));
    
    
  }
  
  void randomWalkBiased()
  {
     float chance = random(1);
     
     if (chance < 0.40)
     {
       x+=10;
     }
     else if (chance < 0.60)
    {
       x-=10;
    }
    else if (chance < 0.80)
    {
      y +=10;
    }
    else if (chance < 1)
     {
       y -=10;
     }
  }
  
  void randomWalk()
  {
    int rng = int(random(8)); 
    
    switch(rng){
      case 0:
        y+=10;
        break;
        
       case 1:
         y-=10;
         break;
         
        case 2:
          x+=10;
          break;
          
        case 3:
          x-=10;
          break;
           
          // corner movement starts here
        case 4:
          y+=10;
          x+=10;
          break;
            
        case 5:
          y-=10;
          x-=10;
          break;
        case 6:
          y+=10;
          x-=10;
          break;
          
         case 7:
           y-=10;
           x+=10;
           break;
          
   }
    
  }
}
