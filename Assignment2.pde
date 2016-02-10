/*

 Assignment  2
 Jonatans A de Souza
 This is a Snake Game*/



import ddf.minim.*;
import controlP5.*;

ControlP5 menu;

Minim minim;
// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();

// global boolean
boolean gameT = true;
PImage bg;
int ScoreB = 3;
boolean ScoreC = true;
boolean AdvanceG = false;
boolean  reset =  false;
boolean speedDecrease = false;
boolean speedIncrease = false;
boolean stopSpeed = false;
boolean stopIncreaseSpeed = false;
boolean turnoffSong = false;
boolean adanvanceL = false;
int speed1 = 13;
int speed2 = 16;
int SpeedDecrement = 0;
int SpeedIncrement  = 0;
PrintWriter getValue;
AudioPlayer audio;

SnakeObj levels = null;
SnakeObj Snakeadd;

void setup ()
{

  size(1000, 800);
  minim = new Minim(this);

  frameRate(10);
  background(255);
  bg = loadImage("bgG.png");
  audio = minim.loadFile("snake1.wav");
  textSize(20);
  Snakeadd =  new Snake();
  SObj.add(Snakeadd);
  Snakeadd =  new FoodGrowth();
  SObj.add(Snakeadd);
  getValue =  createWriter("file.txt");
}


void menu()
{




  PImage bgMenu;
  PFont font = createFont("arial", 20);


  bgMenu = loadImage("Menu1bg.png");
  background(bgMenu);

  //Buttons

  if (turnoffSong == true)
  {
    levels.audio.pause();
  }

  audio.play();
  gameT = true;
  fill(#03647E);
  textSize(35);

  text("CONTINUE ", width*0.41, 550 );

  text("NEW GAME", width*0.41, 600 );

  text("HIGHSCORE", width*0.40, 650 );
  text("QUIT ", width*0.46, 700 );


  // hover over menu
  if (mouseX > 413 && mouseX <590 && mouseY >520 && mouseY <550)
  {
    fill(0);
    text("CONTINUE ", width*0.41, 550 );
  }

  if (mouseX > 413 && mouseX <590 && mouseY >570 && mouseY <600)
  {

    fill(0);
    text("NEW GAME", width*0.41, 600 );
  }
  if (mouseX > 400 && mouseX <590 && mouseY >620 && mouseY <650)
  {
    fill(0);
    text("HIGHSCORE", width*0.40, 650 );
  }

  if (mouseX > width*0.46 && mouseX <550 && mouseY >670 && mouseY <698)
  {
    fill(0);
    text("QUIT ", width*0.46, 700 );
  }


  if (mousePressed && mouseX > 413 && mouseX <590 && mouseY >520 && mouseY <550 )
  {

    if (SObj.size() >2)
    {
      ScoreB = 10;
    }
    if (SObj.size() >2 && SObj.get(0).score == 100 &&  ScoreC  == false &&  ScoreB !=3)
    {

      SObj.get(0).direction.get(0).x = width*0.8;
      SObj.get(0).direction.get(0).y = height/5;

      ScoreC = true;
      ScoreB = 1;
    }

    if (SObj.size() >2 && SObj.get(0).score == 120 &&  ScoreC  == true &&  ScoreB !=3)
    {
      SObj.get(0).direction.get(0).x = width*0.8;
      SObj.get(0).direction.get(0).y = height/5;

      ScoreC = false;
      ScoreB = 2;
    }
  }
  if (mousePressed && mouseX > 413 && mouseX <590 && mouseY >570 && mouseY <600 )
  {
    ScoreB = 0;
    SObj.clear(); 
    frameRate(12);

    Snakeadd =  new Snake();
    SObj.add(Snakeadd);
    Snakeadd =  new FoodGrowth();
    SObj.add(Snakeadd);


    if (turnoffSong == true)
    {
      levels.audio.pause();
    }
  }
  if (mousePressed && mouseX > 400 && mouseX <590 && mouseY >620 && mouseY <650)
  {
    println("wok2");
  }
  if (mousePressed && mouseX > width*0.46 && mouseX <550 && mouseY >670 && mouseY <698)
  {
    exit();
  }
}

void GameLevel()
{


  SnakeObj check = SObj.get(0);
  //send back to the menu and allow the user to choose whether wanna keep continues or not

  if (SObj.get(0).score == 100 &&  ScoreC  == false &&  ScoreB !=3)
  {

    ScoreB = 1;
    ScoreB = 3;
  }
  if (check.score == 120 && ScoreC == true)
  {
    ScoreB = 2;
    ScoreB = 3;
  }
}





void loadstring()
{
  String [] line = null;
}

//pause game and bring back to the menu
void keyPressed()
{


  
  if (key == 'p' || key == 'P' )
  {
    ScoreB = 3;
    audio.rewind();


    if (turnoffSong == true)
    {
      levels.audio.pause();
    }
  }

  if (key == '1')
  {
    gameT = true;



    for (int i = 1; i < SObj.size(); i++)
    {
      if (SObj.size() > 2)
      {
        SObj.remove(i);
      }
    }


    if (turnoffSong == true)
    {
      levels.audio.pause();
    }
    audio.pause();
    ScoreB = 3;
  }
}

void draw()
{

  loadstring();

  boolean addApple; 
  boolean addAppleCheck;



  println("size"+SObj.size());

  //calling method to change levels

  switch (ScoreB)
  {
  case 0:


    SObj.remove(levels);
    levels = new Level1();
    SObj.add(levels);

    levels.Sound();
    ScoreC = false;
    turnoffSong = false;
    ScoreB = 10;

    break;

  case 1:


    SObj.remove(levels);

    audio.pause();
    frameRate(speed1);
    levels = new Level2();


    levels.Sound();
    turnoffSong = true;
    textSize(20);
    fill(0);

    SObj.add(levels);
    ScoreB = 10;
    break;



  case 2:
    {
      SObj.remove(levels);
      audio.pause();
      levels.audio.pause();

      frameRate(speed2);
      levels = new Level3();

      levels.Sound();

      textSize(20);
      fill(0);
      turnoffSong = true;
      SObj.add(levels);
      ScoreB = 10;
      break;
    }
  case 3:
    {

      menu();

      break;
    }
  }


  // display speed

  if (levels instanceof Level1)
  {
    text("Speed : " +20, width*0.04, height*0.1);
  }

  if (levels instanceof Level2)
  {
    text("Speed : " +speed1, width*0.04, height*0.1);
  }

  if (levels instanceof Level3)
  {
    text("Speed : " +speed2, width*0.04, height*0.1);
  }
  // calling method



  if (gameT == true && ScoreB!= 3)
  {

    GameStart();
  } 

  //stop or starting the game

  if (gameT == false)
  {

    GameOver();
  }
  // instance of baseclass

  //calling methods 
  changeFrameRate();
  //LoadAudio();

  addApple = checkPowerup();
  addAppleCheck = checkSPowerUpcolli();

  checkSnakeColli();
  // creating powerups lives and foodGrowth
  if ( addApple == true || addAppleCheck == true )
  {

    Snakeadd =  new FoodGrowth();
    SObj.add(Snakeadd);
    addApple = false;
    addAppleCheck = false;
  }


  SnakeObj getscore = SObj.get(0);

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

    // when speed reaches 3 then it stop adding speed power up
    if ( SpeedIncrement == 3)
    {
      stopIncreaseSpeed  = true;
    }
  }
  GameLevel();
}


void GameOver()
{

  // method to implement when its gonna be game over  
  background(255);
  fill(0);
  textSize(40);

  if (SObj.get(0).getscore == false)
  {
   

    SObj.get(0).getscore = true;
  }
  
  getValue.println(SObj.get(0).score);
  getValue.flush();  // Writes the remaining data to the file
  getValue.close();  // Finishes the file
  
  text("Game Over", width*0.38, height*0.46);
  text("your Score: "+SObj.get(0).score, width*0.35, height*0.60);

  textSize(15);
  text("Press Esc to exit  ", 520, 550);
  text("Press 1 to try again or ", 350, 550);
}

void changeFrameRate()
{

  if (speedDecrease == true && ScoreC == true)
  {
    speed1 -= 3;

    frameRate(speed1);

    speedDecrease = !speedDecrease ;
  } else if ( speedDecrease == true && ScoreC == false)
  {

    speed2 -= 4;

    frameRate(speed2);
    speedDecrease = !speedDecrease ;
  }
  // code to increase the framerate

  if (speedIncrease == true && ScoreC == true)
  {
    speed1 += 5;
    frameRate(speed1);

    speedIncrease = !speedIncrease ;
  } else if ( speedIncrease == true && ScoreC == false )
  {
    speed2 += 8;
    frameRate(speed2);

    speedIncrease = !speedIncrease ;
  }
}

// starting game calling the methods from base class
void GameStart()
{

  background(bg);
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
        if (levelCheck instanceof Level1 || levelCheck instanceof  Level2  || levelCheck instanceof  Level3 )
        {
          for (int c = 0; c < levelCheck.levelsquares.size (); c++ )
          {

            if (sbj.direction.get(0).dist(levelCheck.levelsquares.get(c)) < sbj.snakeWidth)
            {
              //println("Fences"+sbj.direction.get(0).dist(sbj.direction.get(0)));
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

        if (sbj.direction.get(0).dist(sbj.direction.get(j)) < sbj.snakeWidth)

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
          if (sobj.direction.get(0).dist(other.direction.get(0)) < sobj.snakeWidth)
          {

            sobj.Sound();

            if (other instanceof SDecrease)
            {
              other.Sound();



              speedDecrease = true;



              SObj.remove(other);
            } else if (other instanceof SIncrease)
            {
              other.Sound();
              speedIncrease = true;

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
            if (other.direction.get(0).dist(sobj.levelsquares.get(c)) < other.snakeWidth+5)
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