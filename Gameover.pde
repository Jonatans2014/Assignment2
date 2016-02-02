class Gameover
{

  float x;
  float y;

  Gameover()
  {
    //constructor chaining
    this(width/3, height/2);
  }

  Gameover( float x, float y)
  {
    this.x  =x;
    this.y  =y;
  }
  
   // method to implement when its gonna be game over
   void Display()
  {
    fill(0);
    textSize(40);
    text("Game Over",x,y);
    
  }
}
