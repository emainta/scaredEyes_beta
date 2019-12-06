boolean is_blinking = false;
float b_amt = 0;
float delta_blink = 3;
float max_blink;

class Blinker{
  float xPos, yPos;
  float h, l;
  color c;

  Blinker(float xPos, float yPos){
    max_blink = height / 6;
    this.xPos = xPos;
    this.yPos = yPos - max_blink;

    c = color(250);
    l = width/2;
    h = height/3;

  }

  void action(){

    b_amt = b_amt + delta_blink;

    if ( b_amt >= max_blink ) {
      b_amt = max_blink;
      delta_blink *= -1;
    }
    if ( b_amt <= 0 ) {
      b_amt = 0;
      delta_blink *= -1;
      is_blinking = false;
    }

    this.display();
  }

  void display(){
    fill(c);
    noStroke();

    ellipseMode(CENTER);
    ellipse(xPos, yPos + b_amt, l, h);
  }

  void reset(){
    b_amt = 0;
  }






}
