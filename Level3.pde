class Level3  extends SnakeObj 
{
  
  
 
   Level3()
  {
    super(width*0.5, height*0.1,width/2,height/2, 30);  
    collour =  color(#A52A2A);
    move = null;
    audio = minim.loadFile("level3.mp3");
    fence =  loadImage("fence_64x32.png");
    
  }
  
  
  
  
  
  void Render()
  {

    fill(collour);
      
      move = null;
    for (int i =1; i <=  100; i ++)
    {  
      levelsquares.add(new PVector(500, 0 +(snakeWidth * i)));
      levelsquares.add(new PVector(-snakeWidth +(snakeWidth * i),400));
    
    }



    for (int i = 0; i <=200; i++)
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