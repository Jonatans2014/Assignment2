// this is an abstract class that will hold basic functionalities for subclasses
abstract class SnakeObj
{

  float foodW;
  int lives;
  PVector direction;
  PVector backForth;
  float snakeWidth;
  float halfW;
  color collour;


  SnakeObj()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f,10);
  }

    //constructor 
  SnakeObj(float x, float y, float snakeWidth)
  {
    
    backForth = new PVector(0, 20);
    direction = new PVector(x,y);
    this.snakeWidth = snakeWidth;
    this.halfW = snakeWidth *0.5f;
  }


  abstract void Render();
  abstract void Update();
}