float delta_blink_frame = 4;
float MAX_BLINK_FRAME = 210;

class Frame{
  PShape frame;
  float heightFrame, widthFrame;
  float deltaH, deltaW;



  Frame(){
    frame = loadShape("frame.svg"); //1080x720
    shapeMode(CENTER);

    heightFrame = height;
    widthFrame = width;

    deltaH =0;
    deltaW = 0;
  }

  void display(){
    shape(frame, width/2, height/2, widthFrame + deltaW , heightFrame - 3*deltaH);
  }

  void blink(){
    deltaH += delta_blink;

    if ( deltaH >= MAX_BLINK_FRAME ) {
      delta_blink *= -1;
    }
    if ( deltaH <= 0 ) {
      deltaH = 0;
      delta_blink *= -1;
      //is_blinking = false;
    }




  }

  void reset(){
    //delta_blink *=-1;
    deltaH = 0;
    //deltaW = 0;
  }
















}
