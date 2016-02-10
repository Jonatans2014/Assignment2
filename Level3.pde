class Level3  extends SnakeObj 
{
 
  //constructor
   Level3()
  {
    super(width*0.8, height/5,width/2,height/2, 30);  
    collour =  color(#A52A2A);
   
    move = null;
    audio = minim.loadFile("level3.mp3");
    fence =  loadImage("fence_64x32.png");
    
  }
  
  
  //methods
  void Render()
  {
    stroke(0);
    fill(collour);
      
      move = null;
    for (int i =1; i <=  width*0.1; i ++)
    {  
      levelsquares.add(new PVector(width*0.5, 0 +(snakeWidth * i)));
      levelsquares.add(new PVector(-snakeWidth +(snakeWidth * i),height*0.5));
    
    }



    for (int i = 0; i <=width*0.2; i++)
    {
     
      rect(levelsquares.get(i).x, levelsquares.get(i).y, snakeWidth, snakeWidth,10);
    }
  }
  void Sound()
  {
    audio.rewind();
    audio.play();
  }
 
}