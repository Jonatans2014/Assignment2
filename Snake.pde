
//Snake class
class Snake  extends SnakeObj
{
  // Field

  String move;
  int life;
  float textWH;
  int score;
  // constructor
  
  
  Snake()
  {
    super(width*0.5f,height*0.5f,10);
    move = "w";
    life =0;
    textWH = width * 0.040f;
    score = 0;
  }
  // method to draw the snake
  void Render()
  {
    
    textSize(20);
    // display life
    fill(#FC0509);
    text("Life:"+life,textWH,textWH);
    fill(0);
    rect(direction.x, direction.y, snakeWidth, snakeWidth);
    println(direction.x, direction.y);
   
    
    // add score
    
    text("Score " + score,width*0.8,height*0.1);
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
      direction.add(LeftRight);
    }
    if (move == "a")
    {
      direction.sub(LeftRight);
    }
  }

  

  // method to implement when its gonna be game over
  void gameover()
  {

    textSize(32);
    // if function when it is less than 10 and more than 490 a its gonna show game over
    if (direction.y < height -(height-snakeWidth) || direction.y >height - snakeWidth)
    {
      text("Game Over", width*0.3, height/2);
    }
    if (direction.x < width -(width-snakeWidth) || direction.x > width - snakeWidth)
    {
      text("Game Over", width*0.3, height/2);
    }
    println(mouseX, mouseY);
  }
}