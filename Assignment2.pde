// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();



void setup ()
{
  size(500, 500);

  snake = new Snake();

  //adding object snake to the arrayList
  SObj.add(snake);
  frameRate(8);
}

Snake snake;

void draw()
{
  background(255);

  // running methods in the arraylist and passing values fromt he arraylis to the superclass
  for (int i = SObj.size() -1; i >=0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    sobj.Update();
    sobj.Render();
  }
  snake.gameover();


  if (frameCount % 24 == 0)
  {
    // create objcs randomly
    SnakeObj SnakeFoods = null;
    int i = (int) random(0, 2);
    switch(i)
    {
    case 0:
      SnakeFoods =  new FoodGrowth();
      break;

    case 1:
      SnakeFoods = new FoodLives();
      break;
    }

    SObj.add(SnakeFoods);
  }


  checkCollisions();
}

void checkCollisions()
{
  for (int i= SObj.size() -1; i >= 0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    if (sobj instanceof Snake)
    {
      for (int j = SObj.size() -1; j >=0; j--)
      {
        SnakeObj other =  SObj.get(j);
        if (other instanceof FoodLives || other instanceof FoodGrowth )
        {
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth + other.snakeWidth )
          {

            if (other instanceof FoodLives)
            {
              ((FoodLives) other).applyTo((Snake)sobj);
              SObj.remove(other);
            } else if (other instanceof FoodGrowth)
            {
              ((FoodGrowth) other).applyTo((Snake)sobj);
              SObj.remove(other);
            }
          }
        }
      }
    }
  }
}