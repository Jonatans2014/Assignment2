// this is an abstract class that will hold basic functionalities for subclasses
abstract class SnakeObj
{

  float foodW;
  int lives;
  ArrayList <PVector> direction;
  ArrayList <PVector> levelsquares;
  int score;
  PVector backForth;
  PVector LeftRight;
  int SnakeSize;
  float snakeWidth;
  color collour;
  String move;
  

  SnakeObj()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f, 10);
  }

  //constructor 
  SnakeObj(float x, float y, float snakeWidth)
  {
    SnakeSize= 1;
    backForth = new PVector(0, 10);
    LeftRight = new PVector(10, 0);
    direction = new  ArrayList<PVector>();
    levelsquares = new  ArrayList<PVector>();
    direction.add(new PVector(x, y));
    levelsquares.add(new PVector(x, y));
    this.snakeWidth = snakeWidth;
    score = 0;
    move = null;
    
     lives = 3;
  }


  abstract void Render();
  void Update()
  {
  }
  
  void Reset()
  {
  }
}

