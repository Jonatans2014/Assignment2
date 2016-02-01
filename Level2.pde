class Level2 extends SnakeObj
{
  // constructor
  Level2()
  {
    super(width, height*0.6, 10);    
    collour =  color(#A52A2A);
  }


  void Render()
  {

    fill(collour);

    for (int i =1; i <=42; i ++)
    {  
      levelsquares.add(new PVector(0, 500 +(10 * i)));
      levelsquares.add(new PVector(0, -50+(10 * i)));
      levelsquares.add(new PVector(990, -50+(10 * i)));
      levelsquares.add(new PVector((0  +(10 *i)), 790));
      levelsquares.add(new PVector(990, 500+(10*i)));
      levelsquares.add(new PVector((990  -(10 *i)), 790));
      levelsquares.add(new PVector((0+(10 *i)), 0));
      levelsquares.add(new PVector((-10+(10 *i)), 450));
      levelsquares.add(new PVector((990-(10 *i)), 0));
      levelsquares.add(new PVector((1000-(10 *i)), 450));
    }



    for (int i = 0; i <=420; i++)
    {
      rect( levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth);
    }
  }
}

