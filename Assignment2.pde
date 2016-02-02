// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

// globa boolean
boolean gameT = true;
PImage bg;
int ScoreB;
boolean ScoreC = true;

SnakeObj levels = null;

void setup ()
{
  size(1000, 800);
  frameRate(25);
  background(255);
  SnakeObj Snakeadd =  new Snake();
  SObj.add(Snakeadd);
  //SObj.add( SnakeLevel1);
  //SObj.add( SnakeLevel2);
  bg = loadImage("snakeB1.jpg");
}




SnakeObj SnakeLevel2;
void GameLevel()
{

  SnakeObj check = SObj.get(0);

  if (check.score == 0 &&  ScoreC  == true)
  {
    ScoreB = 0;
  } else if (check.score >= 10 && ScoreC == false)
  {
    
   
    ScoreB = 1;
  }
}

void draw()
{
  background(255);
  GameLevel();

  switch (ScoreB)
  {
  case 0:
    SObj.remove(levels);
    levels = new Level1();
    SObj.add(levels);


    ScoreC = false;
    break;
  case 1:

    SObj.remove(levels);
    frameRate(25);
    levels = new Level2();
    SObj.add(levels);
    println(SObj.size());
    ScoreC = true;

    break;
  }



  // calling method
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
  for (int i = SObj.size () -1; i >=0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    sobj.Render();
    sobj.Update();
  }
}

void checkSnakeColli()
{
  for (int i =  SObj.size ()-1; i >= 0; i--)
  {
    SnakeObj sbj = SObj.get(i);
    if (sbj instanceof Snake)
    {
      // check collision with the levels structures
      for (int l = SObj.size () -1; l >= 0; l--)
      {

        SnakeObj levelCheck = SObj.get(l);
        if (levelCheck instanceof Level1 || levelCheck instanceof  Level2 )
        {
          for (int c = 0; c < levelCheck.levelsquares.size (); c++ )
          {
            if (sbj.direction.get(0).dist(levelCheck.levelsquares.get(c)) < sbj.snakeWidth)
            {
              gameT = false;
            }
          }
        }
      }
    }
  }





  /// other collision
  for (int i =  SObj.size ()-1; i >= 0; i--)
  {
    SnakeObj sbj = SObj.get(i);

    if (sbj instanceof Snake)
    {
      for (int j = 1; j <= sbj.SnakeSize; j ++)
      {
        /*
        if (sbj.direction.get(0).x < 0|| sbj.direction.get(0).y < 0 || sbj.direction.get(0).x > width-5 || sbj.direction.get(0).y > height-5  )
         {
         gameT = false;
         }
         */

        // check collision with own snake
        if (sbj.direction.get(0).dist(sbj.direction.get(j)) < sbj.snakeWidth-2)
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
  for (int i= SObj.size () -1; i >= 0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    if (sobj instanceof Snake)
    {
      for (int j = SObj.size () -1; j >=0; j--)
      {

        SnakeObj other =  SObj.get(j);
        if (other instanceof FoodLives || other instanceof FoodGrowth )
        {
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth+4)
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

