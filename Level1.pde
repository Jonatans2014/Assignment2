class Level1 extends SnakeObj 
{
   
  // constructor
  Level1()
  {

    super(width*0.5, height/5,width*0.5,height/5, 30);
    collour =  color(#A52A2A);
    
     fence =  loadImage("fence_64x32.png");
    
  }


  //methods

  void Render()
  {

    fill(collour);



    for (int i =1; i <= width*0.04; i ++)
    {  
        //Draw fences
      levelsquares.add(new PVector((width*0.25 +(10 *i)), height*0.2));

      levelsquares.add(new PVector((width*0.25 +10 *i), height*0.4));

      levelsquares.add(new PVector((width*0.25 +10 *i), height*0.6));
    }



    for (int i = 0; i <=width *0.12; i++)
    {
      //Draw fences
      image(fence, levelsquares.get(i).x, levelsquares.get(i).y, 30, 30);
      
    }
  }
 
}