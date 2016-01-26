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
    pushMatrix();
    translate(direction.x, direction.y);
    rect(halfW, halfW, snakeWidth, snakeWidth);
    popMatrix();
  }
}