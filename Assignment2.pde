void setup ()
{
  size(500, 500);

  snake = new Snake();
  food = new FoodGrowth();
  frameRate(8);
}

Snake snake;
FoodGrowth food;
void draw()
{
  background(255);

  //calling method of snake

  snake.Render();
  snake.Update();
  food.Render();
}