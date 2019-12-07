Frame frame;
Pupilla pupDx, pupSx;
Blinker bDx, bSx;
float t = 0;
float frameRateHz=60;
boolean is_blinking = false;


void setup() {
  //frameRate(5);
  fullScreen(JAVA2D, 2);
  colorMode(HSB, 360, 100, 100);
  //size(1080, 720);
  frame = new Frame();

  pupSx = new Pupilla(0.25*width ,height/2);
  pupDx = new Pupilla(0.75*width ,height/2);

  bSx = new Blinker(0.25*width ,height/2);
  bDx = new Blinker(0.75*width ,height/2);

}

void draw(){

  t+=1/frameRateHz;
  background(0); //Sarà 0 nella versione finale
  
  if(is_blinking) blink();

  showEyes();
  showFrame();

}

void showEyes(){
  pupDx.display(t);
  pupSx.display(t);
}

void mousePressed(){
  do_blink();
}

void do_blink(){
    is_blinking = true;
    frame.is_blinking = true;
    bDx.is_blinking = true;
    bSx.is_blinking = true;
}

void showFrame(){
  frame.spalanca(); 
  
  bDx.display();
  bSx.display();
  
  frame.display();
  
  is_blinking = frame.is_blinking || bDx.is_blinking || bDx.is_blinking;
}

void blink(){
  bDx.blink();
  bSx.blink();
  
  frame.blink();
}

/* void keyPressed(){
  if (key == 'b' || key == 'B') frame.spalanca();  
} */
