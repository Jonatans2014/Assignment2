class SDecrease extends SnakeObj 
{
   PImage hearth;
  //constructor
  SDecrease()
  {
    super(random(50, width-10), random(50, height-10), 30);
    collour= color(#FCF10A);
    hearth = loadImage("hearth1.png");
  }

  void Render()
  {
    fill(collour);
    // display life
    image(hearth,direction.get(0).x, direction.get(0).y, 30, 30);
    
  }
}