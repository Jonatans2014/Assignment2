
//Snake class
class Snake
{
  
  // Field
  PVector direction;
  PVector backForth;
  float snakew;
  Snake()
  {
    this(width *0.5f,height*0.5f);
  }
  
  Snake(float x,float y)
  {
     backForth = new PVector(0,20);
     snakew = 10;
     direction = new PVector(x,y);
  }
  
   void moveSnake()
   {
     if(keyPressed)
     {
       if(key == 'w')
       {
         direction.sub(backForth);
       }
       if(key == 's')
       {
         direction.add(backForth);
        
       }
       
     }
    
   }
   
   
   void drawSnake()
   {
     fill(0);
     stroke(255);
     rect(direction.x,direction.y,snakew,snakew);
     println(direction.x,direction.y);
   }
   
   
}