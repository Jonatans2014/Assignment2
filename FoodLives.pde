class FoodLives extends SnakeObj implements PowerUp
{
   
  //constructor
  FoodLives()
  {
    super(random(50, width-10), random(50, height-10), 10);
    collour= color(#FCF10A);
  }

  void applyTo(Snake snake)
  {
    snake.life ++;
    
  }
 
  void Render()
  {
    fill(collour);
    // display life
    rect(direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
    
  }
}