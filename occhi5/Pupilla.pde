float pi=(float)Math.PI;
float radiusI, startR;

/* ----------------
   |   PUPILLA    |
   ---------------- */

class Pupilla {

  color c, backC;
  float xPos, yPos, centerX, centerY;
  float omegaX, omegaY, phiX, phiY;
  float radius, dist;
  float ampTremoX, ampTremoY, shakiness;

  Iride iride;

  //Constructor:
  Pupilla(float xPos, float yPos){
     this.xPos = xPos;
     this.yPos = yPos;

     this.centerX = xPos;
     this.centerY = yPos;

     this.iride = new Iride();
     this.radius = height/4;
     radiusI = 0.5*radius;
     startR = radiusI;
     this.dist = 50;

     this.ampTremoX = 50;
     this.ampTremoY = 10;
     this.shakiness = 1;
     
     this.c = color(208, 5, 35);
     this.backC = color(0,0,90);


    this.omegaX = 1./10*2*pi;
    this.omegaY = 1./7*2*pi;

    this.phiX= 1./2*2*pi;
    this.phiY= 1./3*2*pi;


  }

  void variations(float t){
    // this.xPos=this.centerX + this.dist*(float)Math.cos(Math.cos(t*0.3)*t*this.omegaX+this.phiX);
    // this.yPos=this.centerY + this.dist*0.3*(float)Math.sin(t*this.omegaY+this.phiY);
    this.tremolio(t);
    this.shrinkIride();


  }

  void display(float t){
    displayRect();
    variations(t);

    noStroke();
    fill(c);
    circle(xPos, yPos, radius);

    iride.display(xPos, yPos, radiusI);
  }

  void displayRect(){
    rectMode(CENTER);
    noStroke();
    fill(backC);

    rect(centerX, centerY, width/2, height/3);
  }

  void tremolio(float t){
    this.xPos=this.centerX + map(noise(shakiness*(0.5+(float)Math.cos(t))*t), 0,1, -ampTremoX, ampTremoX);
    this.yPos=this.centerY + map(noise(shakiness*3*t+100), 0,1, -ampTremoY, ampTremoY);
  }
  
  void shrinkIride(){
    radiusI=startR + 0.45*startR*(float)Math.sin(t*noise(t+10)*this.omegaX+this.phiY);
  }


}

/* --------------
   |   IRIDE    |
   -------------- */

class Iride{
  
  PImage ir;

  Iride(){
    this.ir = loadImage("iride.png");
    
  }
  
  void display(float xx, float yy, float radius){
    imageMode(CENTER);
    image(ir, xx, yy, radius, radius);
    imageMode(CORNER);
  }
}


/* ----------------
   |   BLINKER    |
   ---------------- */

class Blinker{
  float xPos, yPos;
  float h, l;
  color c;
  
  float b_amt = 0;
  float delta_blink;
  float max_blink;
  
  boolean is_blinking;

  Blinker(float xPos, float yPos){
    this.max_blink = height /4;
    this.delta_blink = max_blink/2.5;
    this.xPos = xPos;
    this.yPos = yPos - 1.3*max_blink;

    this.c = color(0,0,95);
    this.l = width/2;
    this.h = height/3;
    
    this.is_blinking = false;
    

  }

  void blink(){

    if(this.is_blinking){
      b_amt = b_amt + delta_blink;
  
      if ( b_amt >= max_blink ) {
        b_amt = max_blink;
        delta_blink *= -1;
      }
      if ( b_amt <= 0 ) {
        b_amt = 0;
        delta_blink *= -1;
        this.is_blinking = false;
      }
    }

  }

  void display(){
    fill(c);
    noStroke();

    ellipseMode(CENTER);
    ellipse(xPos, yPos + b_amt, l, h);
  }

}
