import ddf.minim.*;

Minim minim;
// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

// globa boolean
boolean gameT = true;
PImage bg;
int ScoreB = 0;
boolean ScoreC = true;
boolean  reset =  false;
boolean speedDecrease = false;
boolean speedIncrease = false;
boolean stopSpeed = false;
boolean stopIncreaseSpeed = false;
int speed1 = 35;
int speed2 = 40;
int SpeedDecrement = 0;
int SpeedIncrement  = 0;
AudioPlayer audio;

SnakeObj levels = null;
SnakeObj Snakeadd;



/*
void LoadAudio()
 {
 if (ScoreB == 0)
 {
 audio = minim.loadFile("level1A.mp3");
 playAudio();
 
 ScoreB = 5;
 }
 
 if (ScoreB == 1)
 {
 
 audio.pause();
 audio = minim.loadFile("Level2.mp3");
 playAudio();
 ScoreB = 5;
 }
 }
 void playAudio()
 {
 audio.play();
 audio.rewind();
 
 
 if(ScoreB == 1)
 {
 audio2.play();
 audio2.rewind();
 }
 
 
 }
 */

void setup ()
{
  size(1000, 800);
  minim = new Minim(this);

  frameRate(20);
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
   
  } else if (check.score >= 100 &&  check.score < 290 &&  ScoreC == false)
  {


    ScoreB = 1;
    
  } else if (check.score >= 300 && ScoreC == true)
  {

    ScoreB = 2;
  }
}

void draw()
{


  boolean addApple; 
  boolean addAppleCheck;
  println(ScoreC);
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
    ScoreC = !ScoreC;
    levels.Sound();
  

    ScoreB = 5;
    break;

  case 1:
      
    levels.audio.pause();
    SObj.remove(levels);
    frameRate(speed1);
    levels = new Level2();
    SObj.add(levels);
    
    levels.Sound();
    textSize(20);
    fill(0);
    
    ScoreC = !ScoreC;
    ScoreB = 5;
    break;

  case 2:
    {
    
       //levels.audio.pause();

      SObj.remove(levels);
      frameRate(speed2);
      levels = new Level3();
      SObj.add(levels);
    
      
      levels.Sound();
      textSize(20);
      
      fill(0);
      text("Speed : " +speed2, width*0.02, height*0.1);
      ScoreC = !ScoreC ;
      ScoreB = 5;
      break;
    }
  }

  // display speed
  
  if(levels instanceof Level1)
  {
      text("Speed : " +20, width*0.02, height*0.1);
  }
  
  if(levels instanceof Level2)
  {
      text("Speed : " +speed1, width*0.02, height*0.1);
  }
  
  if(levels instanceof Level3)
  {
      text("Speed : " +speed2, width*0.02, height*0.1);
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

  //calling methods 
  changeFrameRate();
  //LoadAudio();
  checkSnakeColli();
  addApple = checkPowerup();
  addAppleCheck = checkSPowerUpcolli();

  // creating powerups lives and foodGrowth
  if ( addApple == true || addAppleCheck == true )
  {

    Snakeadd =  new FoodGrowth();
    SObj.add(Snakeadd);
    addApple = false;
    addAppleCheck = false;
  }


  SnakeObj getscore = SObj.get(0);


  //println(getscore.score);
  if (frameCount % 300 == 0 && stopSpeed == false && getscore.score >100)
  {
    Snakeadd =  new SDecrease();
    SObj.add(Snakeadd);
    SpeedDecrement ++;


    // when speed reaches 3 then it stop adding speed power up
    if ( SpeedDecrement == 3)
    {
      stopSpeed = true;
    }
  }


  if (frameCount % 200 == 0 && stopIncreaseSpeed  == false &&  getscore.score >100 )
  {
    Snakeadd =  new SIncrease();
    SObj.add(Snakeadd);
    SpeedIncrement ++;

    //println("SpeedIn", SpeedIncrement);

    // when speed reaches 3 then it stop adding speed power up
    if ( SpeedIncrement == 3)
    {
      stopIncreaseSpeed  = true;
    }
  }
}


void changeFrameRate()
{

  if (speedDecrease == true && ScoreC == true)
  {
    speed1 -= 10;

    frameRate(speed1);

    speedDecrease = !speedDecrease ;
  } else if ( speedDecrease == true && ScoreC == false)
  {
    println("drecreased", speed2);
    speed2 -= 5;


    frameRate(speed2);

    speedDecrease = !speedDecrease ;
  }


  // code to increase the framerate

  if (speedIncrease == true && ScoreC == true)
  {


    speed1 += 10;
    frameRate(speed1);

    speedIncrease = !speedIncrease ;
  } else if ( speedIncrease == true && ScoreC == false )
  {
    println("inrecreased", speed2);
    speed2 += 15;
    frameRate(speed2);

    speedIncrease = !speedIncrease ;
  }
}



// starting game calling the methods from base class
void GameStart()
{
  // running methods in the arraylist and passing values from he arraylis to the superclass
  for (int i = SObj.size () -1; i >=0; i--)
  {
    //println(SObj.size());
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
          if (levelCheck instanceof Level1 || levelCheck instanceof  Level2  || levelCheck instanceof  Level3 )
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
          if (other instanceof SDecrease || other instanceof SIncrease|| other instanceof FoodGrowth )
          {
            if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth +sobj.snakeWidth)
            {
                  
                sobj.Sound();

              if (other instanceof SDecrease)
              {
                    other.Sound();

                //change i

                speedDecrease = true;
                println("works decreae", speedDecrease );


                SObj.remove(other);
              } else if (other instanceof SIncrease)
              {
                other.Sound();
                speedIncrease = true;
                println("works  speed incrase", speedIncrease );
                SObj.remove(other);
              } else if (other instanceof FoodGrowth)
              {
                 other.Sound();
                ((FoodGrowth) other).applyTo((Snake)sobj);

                SObj.remove(other);
                addApple = !addApple;
              }
            }
          }
        }
      }
    }


    return addApple;
  }

  boolean  checkPowerup()
  {
    boolean addApple1  = false;
    for (int i= SObj.size () -1; i >= 0; i--)
    {
      SnakeObj sobj = SObj.get(i);
      if ( sobj instanceof Level1 ||sobj instanceof Level2 || sobj instanceof Level3)
      {
        for (int j = SObj.size () -1; j >=0; j--)
        {
          SnakeObj other =  SObj.get(j);
          if (other instanceof FoodGrowth || other instanceof SDecrease  || other instanceof SIncrease)
          {
            for (int c = 0; c < sobj.levelsquares.size(); c ++)
            {
              if (other.direction.get(0).dist(sobj.levelsquares.get(c)) < other.snakeWidth + other.snakeWidth)
              {

                if (other instanceof FoodGrowth)
                {
                  SObj.remove(other);
                  addApple1 = true;
                }

                if (other instanceof SDecrease)
                {
                  SObj.remove(other);
                }
                if (other instanceof SIncrease)
                {
                  SObj.remove(other);
                }
              }
            }
          }
        }
      }
    }

    return addApple1;
  }