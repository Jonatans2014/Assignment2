void setup ()
{
  size(500, 500);
  background(255);
  snake = new Snake();
  frameRate(14);
}

Snake snake;
void draw()
{
  background(255);
  snake.moveSnake();
  snake.drawSnake();
}