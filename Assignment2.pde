


void setup ()
{
  size(500, 500);

  SObj = new ArrayList<SnakeObj>();
  snake = new Snake();
  food = new FoodGrowth();
  life = new FoodLives();
  frameRate(8);
}

// arraylist with the obj type
ArrayList<SnakeObj> SObj;

Snake snake;
FoodGrowth food;
FoodLives life;


void draw()
{
  background(255);

  //calling method of snake
  snake.Render();
  snake.Update();
  food.Render();
  life.Render();
}