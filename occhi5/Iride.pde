
class Iride{
  
  PImage ir;


  Iride(){
    ir = loadImage("iride.png");
    
  }
  
  void display(float xx, float yy, float radius){
    imageMode(CENTER);
    image(ir, xx, yy, radius, radius);
    imageMode(CORNER);
  }


}
