
//Snake class
class Snake  extends SnakeObj
{
  // Field

  float textWH;
  int SnakeS;
  float x;
  float y;

  PImage snakeUp;
  PImage snakeRight;
  PImage snakeLeft;
  PImage snakeDown;
  int boundaries;
  boolean start;
    //snake-graphics1.png
  // constructor
  Snake()
  {
    super(width*0.8, height*0.4, width/2, height/2, 30);  
    textWH = width * 0.040f;
    score = 90;
    SnakeS = 1;

    x = width/3;
    y = height/3;

    audio = minim.loadFile("SnakeBite.wav");
    snakeUp = loadImage("snake-graphics1.png");
    snakeRight = loadImage("snake-graphics3.png");
    snakeLeft = loadImage("snake-graphics2.png");
    snakeDown = loadImage("snake-graphics4.png");
    start = false;
    boundaries = 20;
    getscore = false;
  }
  // method to draw the snake


  void Render()
  {

    textSize(20);
    direction.add(new PVector(-snakeWidth, -snakeWidth));
    // display life


    if (start ==false)
    {
      image(snakeUp, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
    }

    for (int i = 1; i < SnakeSize; i++)
    {

      fill(#73B671);
      stroke(#6A9E68);
      rect(direction.get(i).x, direction.get(i).y, snakeWidth, snakeWidth-2, 10);
    }  
    // add score
    fill(0);
    textSize(20);
    text("Score: " + score, width*0.84, height*0.1);
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
      start = true;
      image(snakeUp, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);

      direction.get(0).sub(backForth);
    }
    if (move == "s")
    {
      start = true;

      image(snakeDown, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
      direction.get(0).add(backForth);
    }
    if (move == "d")
    {
      start = true;
      image(snakeRight, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
      direction.get(0).add(LeftRight);
    }
    if (move == "a")
    {
      start = true;
      image(snakeLeft, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
      direction.get(0).sub(LeftRight);
    }

    

    // code to come out from anothe border
    if (direction.get(0).x < boundaries)
    {

      direction.get(0).x = width -boundaries;
    }

    if (direction.get(0).x > width -boundaries)
    {
      direction.get(0).x = boundaries;
    }

    if (direction.get(0).y < boundaries)
    {
      direction.get(0).y = height-boundaries;
    }

    if (direction.get(0).y > height -boundaries)
    {
      direction.get(0).y = boundaries;
    }
  }

  void Sound()
  {
    audio.rewind();
    audio.play();
  }
}