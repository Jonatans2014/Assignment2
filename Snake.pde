
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
    super(width*0.6f, height*0.5f, 10);
    move = "w";
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


    dir.x = direction.get(0).x;
    dir.y = direction.get(0).y;
  }
}
