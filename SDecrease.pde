class SDecrease extends SnakeObj 
{
  PImage antidote;
  
  
 
  //constructor
  SDecrease()
  {
    super(random(50, width-10), random(50, height-10),width/2,width/2, 30);
    collour= color(#FCF10A);
    antidote = loadImage("antidote1.png");
    audio = minim.loadFile("decrease.mp3");
  
  }
  
  void Render()
  {
    fill(collour);
    // display life
   
    image(antidote, direction.get(0).x, direction.get(0).y, snakeWidth, snakeWidth);
  }
  void Sound()
  {
    audio.rewind();
    audio.play();
  }
}