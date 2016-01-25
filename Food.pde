// this is an abstract class that will hold basic functionalities for subclasses
abstract class Food
{

  float foodW;
  float x;
  float y;

  Food()
  {
    //Constructor chaining
    this(width * 0.5f, height  * 0.5f);
  }

  // constructor 
  Food(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  abstract void update();
  abstract void render();
}