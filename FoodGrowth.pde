class FoodGrowth extends SnakeObj 
{
  //fields
  color collour;
  PImage apple;
  FoodGrowth()
  {
    super(random(10, width-10), random(10, height-10), 10);
    collour= color(#FC0509);
    apple = loadImage("apple1.png");
  }

  void applyTo(Snake snake)
  {
    snake.score += 10;
    snake.SnakeSize ++;
  }

  void Render()
  {
    fill(collour);
    image(apple,direction.get(0).x, direction.get(0).y,30, 30);
  
  }
}
