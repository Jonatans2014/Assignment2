class Level2 extends SnakeObj
{
  
  
  // constructor
  Level2()
  {
    super(width/2,height/2,10);
    collour =  color(#A52A2A);
  }
  
  
  void Render()
  {
    
    fill(collour);
    
    
    
   
      
         levelsquares.add(new PVector(0,500 +(10 )));
      
      
     
         levelsquares.add(new PVector((0  +(10 )),790));
        
      
         levelsquares.add(new PVector(990,500+(10)));
         
         
         levelsquares.add(new PVector((990  -(10)),790));
         
        
    
      println( levelsquares.size());
      
      if(levelsquares.size() > 1000)
      {
        levelsquares.clear();
      }
    
    
    for(int i = 1; i <=3; i++)
    {
      rect( levelsquares.get(i).x,levelsquares.get(i).y,snakeWidth,snakeWidth);
    }
    
    
    
   
  }
  
  
}
