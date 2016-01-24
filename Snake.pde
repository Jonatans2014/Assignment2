
//Snake class
class Snake
{

  // Field
  PVector direction;
  PVector backForth;
  float snakew;
  Snake()
  {
    this(width *0.5f, height*0.5f);
  }

  Snake(float x, float y)
  {
    backForth = new PVector(0, 20);
    snakew = 10;
    direction = new PVector(x, y);
  }

  void moveSnake()
  {
    if (keyPressed)
    {
      if (key == 'w')
      {
        direction.sub(backForth);
      }
      if (key == 's')
      {
        direction.add(backForth);
      }
      if (key == 'd')
      {
        direction.x += 20;
      }
      if (key == 'a')
      {
        direction.x -= 20;
      }
      
    }
  }


  void drawSnake()
  {

    pushMatrix();
    translate(direction.x, direction.y);
    fill(0);
    rect(0, 0 ,snakew, snakew);
    println(direction.x, direction.y);
    popMatrix();

  
  }
}