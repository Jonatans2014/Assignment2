class FoodGrowth extends SnakeObj
{
  FoodGrowth()
  {
    super(random(10,width-10), random(10,height-10), 10);
  }


  void Update()
  {
  }

  void Render()
  {
    pushMatrix();
    fill(0);
    rect(direction.x,direction.y, snakeWidth, snakeWidth);
    println(direction.x,direction.y);
    popMatrix();
  }
}