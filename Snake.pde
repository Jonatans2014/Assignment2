
//Snake class
class Snake  extends SnakeObj
{
  // Field
  
  String move;
  

 
  // constructor 
  Snake()
  {
    move = "w";
  }
  
  
 
    // method to draw the snake
  void Render()
  {
    pushMatrix();
    translate(direction.x, direction.y);
    fill(0);
    rect(0, 0, snakeWidth, snakeWidth);
    println(direction.x, direction.y);
    popMatrix();
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
      direction.x += 20;
    }
    if (move == "a")
    {
      direction.x -= 20;
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
    if(direction.x < width -(width-snakeWidth) || direction.x > width - snakeWidth)
    {
      text("Game Over", width*0.3, height/2);
    }
    println(mouseX,mouseY);
  }



}