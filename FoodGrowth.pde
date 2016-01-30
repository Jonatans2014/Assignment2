class FoodGrowth extends SnakeObj 
{
  //fields
  color collour;
  FoodGrowth()
  {
    super(random(10, width-10), random(10, height-10), 10);
    collour= color(#FC0509);
  }

  void applyTo(Snake snake)
  {
    snake.score += 10;
    snake.SnakeSize ++;
  }

  void Render()
  {
    fill(collour);
    ellipse(direction.get(0).x, direction.get(0).y,snakeWidth, snakeWidth);
  
  }
}