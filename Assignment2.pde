// arraylist with the obj type
ArrayList<SnakeObj> SObj = new ArrayList<SnakeObj>();



void setup ()
{
  size(500, 500);

  
  Snake snake = new Snake();
  SObj.add(snake);
  food = new FoodGrowth();
  life = new FoodLives();
  frameRate(8);
}



FoodGrowth food;
FoodLives life;

void addPowerUps()
{
  
}

void draw()
{
  background(255);
  
  for(int i = SObj.size() -1; i >=0 ; i--)
  {
      SnakeObj sobj = SObj.get(i);
      sobj.Update();
      sobj.Render();
    
  }
  
  // create objcs randomly
  SnakeObj SnakeFoods = null;
  int i = (int) random(0,2);
  
  switch(i)
  {
    case 0:
    SnakeFoods =  new FoodGrowth();
    break;
    
    case 1:
    SnakeFoods = new FoodLives();
    break;
  }
  
  SObj.add(SnakeFoods);
  
  
}