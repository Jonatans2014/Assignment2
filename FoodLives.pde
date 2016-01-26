class FoodLives extends SnakeObj implements PowerUp
{

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
    pushMatrix();
    translate(direction.x, direction.y);
    // display life
    fill(#FC0509);
    ellipse(halfW, halfW, snakeWidth, snakeWidth);
    popMatrix();
  }
}