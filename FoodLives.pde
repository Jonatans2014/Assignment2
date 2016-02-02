class FoodLives extends SnakeObj implements PowerUp
{
   PImage hearth;
  //constructor
  FoodLives()
  {
    super(random(50, width-10), random(50, height-10), 10);
    collour= color(#FCF10A);
    hearth = loadImage("hearth1.png");
  }

  void applyTo(Snake snake)
  {
    snake.life ++;
    
  }
 
  void Render()
  {
    fill(collour);
    // display life
    image(hearth,direction.get(0).x, direction.get(0).y, 30, 30);
    
  }
}
