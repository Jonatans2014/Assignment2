class Level2 extends SnakeObj 
{


 
  // constructor
  Level2()
  {
    super(width, height*0.6, 10);    
    collour =  color(#A52A2A);
    move = null;
    audio = minim.loadFile("level1A.mp3");
  }




   void Sound()
  {
    audio.rewind();
    audio.play();
  }


  void Render()
  {

    fill(collour);

    move = null;
    for (int i =1; i <=  width*0.042; i ++)
    {  
      levelsquares.add(new PVector(0, height*0.625 +(10 * i)));
      levelsquares.add(new PVector(0, -height*0.0625+(10 * i)));
      levelsquares.add(new PVector(width*0.99, -height*0.0625+(10 * i)));
      levelsquares.add(new PVector((0  +(10 *i)), height*0.9875));
      levelsquares.add(new PVector(width*0.99, height*0.625+(10*i)));
      levelsquares.add(new PVector((width*0.99 -(10 *i)), height*0.9875));
      levelsquares.add(new PVector((0+(10 *i)), 0));
      levelsquares.add(new PVector((-width*0.010+(10 *i)), height * 0.5625));
      levelsquares.add(new PVector((width*0.99-(10 *i)), 0));
      levelsquares.add(new PVector((width-(10 *i)), height * 0.5625));
    }



    for (int i = 0; i <=width*0.42; i++)
    {
      rect( levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth);
    }
  }
}