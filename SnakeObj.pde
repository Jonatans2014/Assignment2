// this is an abstract class that will hold basic functionalities for subclasses
abstract class SnakeObj
{

  float foodW;
  int lives;
  ArrayList <PVector> direction;
  PVector backForth;
  PVector LeftRight;
  int SnakeSize;
  float snakeWidth;
  
  color collour;


  SnakeObj()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f,10);
  }

    //constructor 
  SnakeObj(float x, float y, float snakeWidth)
  {
    SnakeSize= 1;
    backForth = new PVector(0, 10);
    LeftRight = new PVector(10,0);
    direction = new  ArrayList<PVector>();
    direction.add(new PVector(x,y));
    this.snakeWidth = snakeWidth;
    
  }


  abstract void Render();
  abstract void Update();
 
  
}