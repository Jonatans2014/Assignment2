class Level1 extends SnakeObj 
{

  // constructor
  Level1()
  {

    super(width*0.5, height/5,width*0.5,height/5, 10);
    collour =  color(#A52A2A);
    audio = minim.loadFile("level1A.mp3");
    
  }


  

  void Render()
  {

    fill(collour);



    for (int i =1; i <= width*0.04; i ++)
    {  

      levelsquares.add(new PVector((width*0.25 +(snakeWidth *i)), height*0.2));

      levelsquares.add(new PVector((width*0.25 +snakeWidth *i), height*0.4));

      levelsquares.add(new PVector((width*0.25 +snakeWidth *i), height*0.6));
    }



    for (int i = 0; i <=width *0.12; i++)
    {
      
      rect( levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth);
    }
  }
  void Sound()
  {
    audio.rewind();
    audio.play();
  }
}