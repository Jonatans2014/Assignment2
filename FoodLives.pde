class FoodLives extends SnakeObj
{

  FoodLives()
  {
    super(random(50, width-10), random(50, height-10), 10);
    collour= color(#FC0509);
  }

  void Update()
  {
  }

  void Render()
  {
    fill(collour);
    ellipse(direction.x, direction.y, snakeWidth, snakeWidth);
    println(direction.x, direction.y);
  }
}