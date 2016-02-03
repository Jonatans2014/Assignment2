class Level3  extends SnakeObj implements Ressurect
{
   Level3()
  {
    super(width, height*0.6, 10);    
    collour =  color(#A52A2A);
    move = null;
  }
  
  
  void Render()
  {

    fill(collour);
      
      move = null;
    for (int i =1; i <=  100; i ++)
    {  
      levelsquares.add(new PVector(500, 0 +(10 * i)));
      levelsquares.add(new PVector(-10 +(10 * i),400));
    
    }



    for (int i = 0; i <=200; i++)
    {
      rect( levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth);
    }
  }
  void DecreaseLife(Snake snake)
  {
    snake.lives --;
  }
}
