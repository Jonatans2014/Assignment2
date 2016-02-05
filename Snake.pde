
//Snake class
class Snake  extends SnakeObj
{
  // Field

  float textWH;
  int SnakeS;
  float x;
  float y;
  PVector dir;

  
  // constructor
  Snake()
  {
    super(width*0.9f, height*0.5f, 10);
    textWH = width * 0.040f;
    score = 500;
    SnakeS = 1;
    lives = 3;
    framerateLV2 = 35;
    x = width/3;
    y = height/3;
    dir = new PVector(0, 0);
  }
  // method to draw the snake



  void Reset()
  {
    
    direction.get(0).x = x;
    direction.get(0).y = y;
    rect(direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
  }
  void Render()
  {

    textSize(20);
    direction.add(new PVector(-snakeWidth, -snakeWidth));
    // display life
    fill(#FC0509);
    
    fill(0);

    for (int i = 0; i < SnakeSize; i++)
    {
      stroke(255);
      rect(direction.get(i).x, direction.get(i).y, snakeWidth, snakeWidth);
    }  
    // add score
    text("Score: " + score, width*0.88, height*0.1);
  }

  // method to move the snake
  void Update()
  {

    if (key == CODED) {
      if (keyCode == UP) {
        move = "w";
      }
      if (keyCode == DOWN) {
        move = "s";
      }
      if (keyCode == RIGHT) {
        move = "d";
      }
      if (keyCode == LEFT) {
        move = "a";
      }
    }


    //switch case
   

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



    // code to come out from anothe border
    if (direction.get(0).x < snakeWidth)
    {
      
      direction.get(0).x = width -snakeWidth;
    }

    if (direction.get(0).x > width -snakeWidth)
    {
      direction.get(0).x = snakeWidth;
    }

    if (direction.get(0).y < snakeWidth)
    {
      direction.get(0).y = height-snakeWidth;
    }

    if (direction.get(0).y > height -snakeWidth)
    {
      direction.get(0).y = snakeWidth;
    }
    dir.x = direction.get(0).x;
    dir.y = direction.get(0).y;
  }
}