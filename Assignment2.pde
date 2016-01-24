void setup ()
{
  size(500, 500);

  snake = new Snake();
  frameRate(8);
}

  Snake snake;
void draw()
{
  background(255);

  //calling method of snake
  snake.moveSnake();
  snake.drawSnake();
  snake.gameover();
}