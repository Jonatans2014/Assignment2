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
    
    
    
    for(int i =1; i <=42; i ++)
    {  
      
      
         levelsquares.add(new PVector(0,500 +(10 * i)));
      
      
     
         levelsquares.add(new PVector((0  +(10 *i)),790));
        
      
         levelsquares.add(new PVector(990,500+(10*i)));
         
         
         levelsquares.add(new PVector((990  -(10 *i)),790));
         
        
    }
    
    
    
    for(int i = 1; i <=168; i++)
    {
      rect( levelsquares.get(i).x,levelsquares.get(i).y,snakeWidth,snakeWidth);
    }
    
    
    
   
  }
  
  
}