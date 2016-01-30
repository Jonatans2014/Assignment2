class Level1 extends SnakeObj
{
  
  
  // constructor
  Level1()
  {
    super(width/2,height/2,10);
    collour =  color(#A52A2A);
  }
  
  
  void Render()
  {
    
    fill(collour);
    
    
    
    for(int i =1; i <= 40; i ++)
    {  
      
      
         levelsquares.add(new PVector((250 +10 *i),200));
      
      
     
         levelsquares.add(new PVector((250 +10 *i),400));
        
      
         levelsquares.add(new PVector((250 +10 *i),600));
    }
    
    
    
    for(int i = 1; i <=120; i++)
    {
      rect( levelsquares.get(i).x,levelsquares.get(i).y,snakeWidth,snakeWidth);
    }
    
    
    
   
  }
  
  
}