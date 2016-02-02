
//Snake class
class Snake  extends SnakeObj
{
  // Field

  int life;
  float textWH;
  int SnakeS;
  float x;
  float y;
  PVector dir;

  // constructor
  Snake()
  {
    super(width*0.9f, height*0.5f, 10);

    life = 0;
    textWH = width * 0.040f;
    score = 0;
    SnakeS = 1;

    dir = new PVector(0, 0);
  }
  // method to draw the snake

  void Render()
  {

    textSize(20);
    direction.add(new PVector(-snakeWidth, -snakeWidth));
    // display life
    fill(#FC0509);
    text("Life:"+life, textWH, height*0.1);
    fill(0);

    for (int i = 0; i < SnakeSize; i++)
    {
      stroke(255);
      rect(direction.get(i).x, direction.get(i).y, snakeWidth, snakeWidth);
    }  
    // add score
    text("Score " + score, width*0.8, height*0.1);
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
    if (direction.get(0).x < 0)
    {
      direction.get(0).x = width;
    }

    if (direction.get(0).x > width)
    {
      direction.get(0).x = 0;
    }

    if (direction.get(0).y < 0)
    {
      direction.get(0).y = height;
    }

    if (direction.get(0).y > height)
    {
      direction.get(0).y = 0;
    }
    dir.x = direction.get(0).x;
    dir.y = direction.get(0).y;
  }
}

