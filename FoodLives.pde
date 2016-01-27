class FoodLives extends SnakeObj implements PowerUp
{
    
  
  //constructor
  FoodLives()
  {
    super(random(50, width-10), random(50, height-10), 10);
    collour= color(#FC0509);
  }


  void applyTo(Snake snake)
  {
    snake.life ++;
    
  }
  void Update()
  {
  }

  void Render()
  {
    fill(collour);
    // display life
    fill(#FC0509);
    rect(-direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
    
  }
}