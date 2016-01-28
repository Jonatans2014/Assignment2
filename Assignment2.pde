// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

void setup ()
{
  size(500, 500);
  frameRate(20);
  
  SnakeObj Snakeadd =  new Snake();
  
  SObj.add(Snakeadd);
 
}

Snake snake;

void draw()
{
  background(255);
  
  GameStart();

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




void GameStart()
{
    // running methods in the arraylist and passing values fromt he arraylis to the superclass
  for (int i = SObj.size() -1; i >=0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    sobj.Render();
    sobj.Update();
  }
  
}

void checkSnakeColli()
{
  

  for (int i =  SObj.size()-1; i >= 0; i--)
  {
    SnakeObj sbj = SObj.get(i);
    
    if (sbj instanceof Snake)
    {
      for (int j = 1; j < sbj.SnakeSize; j ++)
      {
        
        if(sbj.direction.get(0).x <= 0 || sbj.direction.get(0).x > width - sbj.snakeWidth || sbj.direction.get(0).y <0 || sbj.direction.get(0).y > height - sbj.snakeWidth  )
        {
          
                println("game over play again yes or no?");
        }
        
        
        
        // check collision with own snake
        if (sbj.direction.get(0).dist(sbj.direction.get(j)) < sbj.snakeWidth)
        {
          println(sbj.direction.get(0).dist(sbj.direction.get(j)));
           
           text("gameOver",width/2,height/2);
          
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