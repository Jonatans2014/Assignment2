class FoodGrowth extends SnakeObj 
{
  //fields
  color collour;
  FoodGrowth()
  {
    super(random(10, width-10), random(10, height-10), 10);
    collour= color(#FCFC05);
  }

    
    
  
  void applyTo(Snake snake)
  {
    snake.score += 10;
    snake.SnakeSize ++;
  }
 
  void Update()
  {
    
  }

  void Render()
  {
    fill(collour);
    rect(direction.get(0).x, direction.get(0).y,snakeWidth, snakeWidth);
  
  }
}