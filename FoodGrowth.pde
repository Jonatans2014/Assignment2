class FoodGrowth extends SnakeObj
{
  //fields
  color collour;
  FoodGrowth()
  {
    super(random(10, width-10), random(10, height-10), 10);
    collour= color(#FCFC05);
  }


  void Update()
  {
  }

  void Render()
  {
    fill(collour);
    rect(direction.x, direction.y, snakeWidth, snakeWidth);
    println(direction.x, direction.y);
  }
}