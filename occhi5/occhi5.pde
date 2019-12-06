Frame frame;
Pupilla pupDx, pupSx;
Blinker bDx, bSx;
float t = 0;
float frameRateHz=60;

void setup() {
  fullScreen(JAVA2D, 2);
  //size(1080, 720);
  frame = new Frame();

  pupSx = new Pupilla(0.25*width ,height/2);
  pupDx = new Pupilla(0.75*width ,height/2);

  bSx = new Blinker(0.25*width ,height/2);
  bDx = new Blinker(0.75*width ,height/2);

}

void draw(){

  t+=1/frameRateHz;
  background(20); //Sarà 0 nella versione finale

  showEyes();
  showFrame();


}

void showEyes(){
  pupDx.display(t);
  pupSx.display(t);

  if(mousePressed){
    bDx.action();
    bSx.action();

    frame.blink();
  }

}

void mouseReleased() {
  bDx.reset();
  bSx.reset();

  frame.reset();
}

void showFrame(){
  frame.display();
}
