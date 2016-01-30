// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

// globa boolean
boolean gameT = true;
PImage bg;

void setup ()
{
  
   
  size(1000,800);
  frameRate(20);
  background(255);
  SnakeObj Snakeadd =  new Snake();
  SnakeObj SnakeLevel1 =  new Level1();
  SObj.add(Snakeadd);
  SObj.add( SnakeLevel1);
  
  //load image
  bg = loadImage("snakeB1.jpg");
}


void draw()
{
 background(255);
   println(mouseX,mouseY);
  Gameover game = new Gameover();
  //stop or starting the game
  if (gameT == true )
  {
    GameStart();
  } else
  {
    game.Display();
  }
  // instance of baseclass
  SnakeObj SnakeFoods = null;

  // creating powerups lives and foodGrowth
  if (frameCount % 60 == 0)
  {
    SnakeFoods =  new FoodGrowth();
    SObj.add(SnakeFoods);
  }

  if (frameCount % 160 == 0)
  {
    SnakeFoods =  new FoodLives(); 
    SObj.add(SnakeFoods);
  }

  checkSPowerUpcolli();
  checkSnakeColli();
}



// starting game calling the methods from base class
void GameStart()
{
  // running methods in the arraylist and passing values from he arraylis to the superclass
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
      for (int j = 1; j <= sbj.SnakeSize; j ++)
      {
        if (sbj.direction.get(0).x < 0|| sbj.direction.get(0).y < 0 || sbj.direction.get(0).x > width-5 || sbj.direction.get(0).y > height-5  )
        {
          gameT = false;
        }
        // check collision with own snake
        if (sbj.direction.get(0).dist(sbj.direction.get(j)) < sbj.snakeWidth)
        {         
          gameT = false;
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
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth)
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