class Level2 extends SnakeObj 
{



  // constructor
  Level2()
  {
    super(width/5, height*0.564, width/5, height*0.563, 30);    
    collour =  color(#A52A2A);
    move = null;
    audio = minim.loadFile("Level2.mp3");
    fence =  loadImage("fence_64x32.png");
  }






  void Render()
  {

    fill(collour);

    move = null;
    for (int i =1; i <=  width*0.010; i ++)
    {  
      levelsquares.add(new PVector(0, height*0.7 +(snakeWidth * i)));
      
      
      levelsquares.add(new PVector(0, -height*0.0625+(snakeWidth * i)));
      levelsquares.add(new PVector(width*0.97, -height*0.0625+(snakeWidth * i)));
      levelsquares.add(new PVector((0  +(10 *i)), height*0.96));
      levelsquares.add(new PVector(width*0.97, height*0.7+(snakeWidth*i)));
      levelsquares.add(new PVector((width*0.97 -(snakeWidth *i)), height*0.965));
      levelsquares.add(new PVector((0+(snakeWidth *i)), 0));
      levelsquares.add(new PVector((-width*0.030+(snakeWidth *i)), height * 0.5625));
      levelsquares.add(new PVector((width*0.99-(snakeWidth *i)), 0));
      levelsquares.add(new PVector((width-(snakeWidth *i)), height * 0.5625));
    }



    for (int i = 0; i <=width*0.10; i++)
    {

      
      
      image(fence, levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth);
    }
  }
  void Sound()
  {
    audio.rewind();
    audio.play();
  }
}