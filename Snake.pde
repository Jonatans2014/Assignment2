
//Snake class
class Snake  extends SnakeObj
{
  // Field

  String move;
  int life;
  float textWH;
  int score;
  int SnakeS;
  float x;
  float y;
  PVector dir;

  // constructor


  Snake()
  {
    super(width*0.5f, height*0.5f, 10);
    move = "w";
    life =0;
    textWH = width * 0.040f;
    score = 0;
    SnakeS = 1;
    x =0;
    y =0;
    dir = new PVector(width*0.5f, height*0.5f);
  }
  // method to draw the snake





  void addS()
  {
    direction.add(new PVector(direction.get(0).x,direction.get(0).y));
  }
  void Render()
  {

    textSize(20);

    // display life
    fill(#FC0509);
    text("Life:"+life, textWH, textWH);
    fill(0);


    for (int i = SnakeSize -1; i> 0; i --)
    {
      stroke(255);
    }

    for (int i = 0; i < SnakeSize; i++)
    {
      rect(direction.get(i).x, direction.get(i).y, snakeWidth, snakeWidth);
    }  



    // add score
    text("Score " + score, width*0.8, height*0.1);
  }

  // method to move the snake
  void Update()
  {


    if (keyPressed)
    {
      if (key == 'w')
      {
        move = "w";
      }
      if (key == 's')
      {
        move = "s";
      }
      if (key == 'd')
      {
        move = "d";
      }
      if (key == 'a')
      {
        move = "a";
      }
    }




    for (int i = 0; i < SnakeSize; i++)
    {

      for (int j = SnakeSize -1; j > 0; j-- ) {
        
       direction.get(j).x=  direction.get(j-1).x;
       direction.get(j).y=  direction.get(j-1).y;
      } 

      // if function to move 
      if (move == "w")
      {
        direction.get(0).sub(backForth);
      }
      if (move == "s")
      {
        direction.get(0).add(backForth);
      }
      if (move == "d")
      {
        direction.get(0).add(LeftRight);
      }
      if (move == "a")
      {
        direction.get(0).sub(LeftRight);
      }
    }

 
  }




  // method to implement when its gonna be game over
  void gameover()
  {

    textSize(32);
    // if function when it is less than 10 and more than 490 a its gonna show game over
    if (direction.get(0).y < height -(height-snakeWidth) ||direction.get(0).y >height - snakeWidth)
    {
      text("Game Over", width*0.3, height/2);
    }
    if (direction.get(0).x < width -(width-snakeWidth) || direction.get(0).x > width - snakeWidth)
    {
      text("Game Over", width*0.3, height/2);
    }
  }
}