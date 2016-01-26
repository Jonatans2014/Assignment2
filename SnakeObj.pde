// this is an abstract class that will hold basic functionalities for subclasses
abstract class SnakeObj
{

  float foodW;
  int lives;
  PVector direction;
  PVector backForth;
  float snakeWidth;
  color collour;


  SnakeObj()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f);
  }

    //constructor 
  SnakeObj(float x, float y)
  {
    backForth = new PVector(0, 20);
    direction = new PVector(x, y);
    snakeWidth = 10;
  }


  abstract void Render();
  abstract void Update();
}