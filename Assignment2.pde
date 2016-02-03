// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

// globa boolean
boolean gameT = true;
PImage bg;
int ScoreB;
boolean ScoreC = true;
boolean  reset =  false;
SnakeObj levels = null;
SnakeObj Snakeadd;
void setup ()
{
  size(1000, 800);
  frameRate(18);
  background(255);
  Snakeadd =  new Snake();
  SObj.add(Snakeadd);
  Snakeadd =  new FoodGrowth();
  SObj.add(Snakeadd);
  bg = loadImage("snakeB1.jpg");
  
}

void GameLevel()
{

  SnakeObj check = SObj.get(0);

  if (check.score == 0 &&  ScoreC  == true)
  {
    ScoreB = 0;
  } else if (check.score == 100 && ScoreC == false)
  {

    ScoreB = 1;
  } else if (check.score == 300 && ScoreC == false)
  {

    ScoreB = 2;
  }
}

void draw()
{

  boolean addApple; 


  background(255);
  // println(mouseX, mouseY);
  //calling method to change levels

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
    frameRate(30);
    levels = new Level2();
    SObj.add(levels);
    ScoreC = true;
    break;

  case 2:
    {
      SObj.remove(levels);
      frameRate(50);
      levels = new Level3();
      SObj.add(levels);
      //println("hey im here");
      ScoreC = true;
      break;
    }
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


  //calling methods  
  checkSnakeColli();
  addApple = checkSPowerUpcolli();

  //println(addApple);

  // creating powerups lives and foodGrowth
  if ( addApple == true)
  {
    SnakeFoods =  new FoodGrowth();
    SObj.add(SnakeFoods);
  }

  if (frameCount % 160 == 0)
  {
    SnakeFoods =  new FoodLives(); 
    SObj.add(SnakeFoods);
  }
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

      //  conditio to check if user has life if not it is game over
      if (sbj.lives <1)
      {
        gameT =false;
      }
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

              reset =true;


              if (levelCheck instanceof Level1 ) {
                ((Level1) levelCheck).DecreaseLife((Snake)sbj);
              }

              if (levelCheck instanceof Level2 ) {
                ((Level2) levelCheck).DecreaseLife((Snake)sbj);
              }
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
      for (int j = 1; j < sbj.SnakeSize; j ++)
      {
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
boolean checkSPowerUpcolli()
{

  boolean addApple  = false;

  for (int i= SObj.size () -1; i >= 0; i--)
  {
    SnakeObj sobj = SObj.get(i);
    if (sobj instanceof Snake)
    {
      for (int j = SObj.size () -1; j >=0; j--)
      {


        SnakeObj other =  SObj.get(j);
        if (other instanceof FoodLives || other instanceof FoodGrowth)
        {
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth +sobj.snakeWidth)
          {


            if (other instanceof FoodLives)
            {
              ((FoodLives) other).applyTo((Snake)sobj);
              SObj.remove(other);
            } else if (other instanceof FoodGrowth)
            {
              ((FoodGrowth) other).applyTo((Snake)sobj);
              SObj.remove(other);
              addApple = !addApple;
              println(addApple);
            }
          }
        }
      }
    }
  }
  return addApple;
}

