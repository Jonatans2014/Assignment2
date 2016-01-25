// this is an abstract class that will hold basic functionalities for subclasses
abstract class SnakeFood
{
  
  float foodW;
  float x;
  float y;
  
  SnakeFood()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f);
  }

  // constructor 
  SnakeFood(float x, float y)
  {
    this.x = x;
    this.y = y;
   
  }
  
  
  abstract void update();
  abstract void render();
  
}