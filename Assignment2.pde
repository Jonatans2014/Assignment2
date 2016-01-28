// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

void setup ()
{
  size(500, 500);

  snake = new Snake();

  //adding object snake to the arrayList
  SObj.add(snake);
  frameRate(20);
}

Snake snake;

void draw()
{
  background(255);

  // running methods in the arraylist and passing values fromt he arraylis to the superclass
  for (int i = SObj.size() -1; i >=0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    sobj.Render();
    sobj.Update();
  }

  snake.gameover();

  // instance of baseclass
  SnakeObj SnakeFoods = null;

  // creating powerups lives and foodGrowth
  if (frameCount % 24 == 0)
  {
    SnakeFoods =  new FoodGrowth();
    SObj.add(SnakeFoods);
  }

  if (frameCount % 124 == 0)
  {
    SnakeFoods =  new FoodLives(); 
    SObj.add(SnakeFoods);
  }




  checkSPowerUpcolli();
  checkSnakeColli();
}




void checkSnakeColli()
{
  for (int i =  SObj.size()-1; i >= 0; i--)
  {
    SnakeObj sbj = SObj.get(i);
    
    if(sbj instanceof Snake)
    {
      for(int j = 1; j < sbj.SnakeSize; j ++)
      {
        
        
      if(sbj.direction.get(0).dist(sbj.direction.get(j)) < sbj.snakeWidth -10)
      {
        println(sbj.direction.get(0).dist(sbj.direction.get(j)));
        
          snake.gameover();
      }
      }
    }
  }
}
// implementing collisions
void checkSPowerUpcolli()
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
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth + other.snakeWidth)
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