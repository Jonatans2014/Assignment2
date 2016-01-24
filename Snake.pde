
//Snake class
class Snake
{
  // Field
  PVector direction;
  PVector backForth;
  String move;
  float snakew;

  Snake()
  { 
    // chaining constructor
    this(width *0.5f, height*0.5f);
  }

  // constructor 
  Snake(float x, float y)
  {
    move = "w";
    backForth = new PVector(0, 20);
    snakew = 10;
    direction = new PVector(x, y);
  }

  // method to move the snake
  void moveSnake()
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

    // if function to move 
    if (move == "w")
    {
      direction.sub(backForth);
    }
    if (move == "s")
    {
      direction.add(backForth);
    }
    if (move == "d")
    {
      direction.x += 20;
    }
    if (move == "a")
    {
      direction.x -= 20;
    }
  }


  void gameover()
  {

    textSize(32);
    if (direction.y < height -(height-snakew) || direction.y >height - snakew )
    {
      text("Game Over", width*0.3, height/2);
    }
    println(mouseX,mouseY);
  }

  // method to draw the snake
  void drawSnake()
  {
    pushMatrix();
    translate(direction.x, direction.y);
    fill(0);
    rect(0, 0, snakew, snakew);
    println(direction.x, direction.y);
    popMatrix();
  }
}