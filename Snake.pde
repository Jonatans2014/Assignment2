
//Snake class
class Snake
{
  
  // Field
  PVector direction;
  float speed;
 
  Snake()
  {
    this(width *0.5f,height*0.5f);
  }
  
  Snake(float x,float y)
  {
     speed = 30;
     direction = new PVector(x,y);
  }
  
   
   
   
   void drawSnake()
   {
     
   }
}