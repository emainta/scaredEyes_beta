float pi=(float)Math.PI;

class Pupilla {

  color c, backC;
  float xPos, yPos, centerX, centerY;
  float omegaX, omegaY, phiX, phiY;
  float radius, radiusI, startR, dist;
  float ampTremoX, ampTremoY, shakiness;

  Iride iride;

  //Constructor:
  Pupilla(float xPos, float yPos){
     this.xPos = xPos;
     this.yPos = yPos;

     this.centerX = xPos;
     this.centerY = yPos;

     iride = new Iride();
     radius = 180;
     this.radiusI = radius/3;
     this.startR = radiusI;
     dist = 50;

     ampTremoX = 30;
     ampTremoY = 10;
     shakiness = 1;

     c = color(90,110,255);
     backC = color(240, 230, 255);


    this.omegaX = 1./10*2*pi;
    this.omegaY = 1./7*2*pi;

    this.phiX= 1./2*2*pi;
    this.phiY= 1./3*2*pi;


  }

  void variations(float t){
    // this.xPos=this.centerX + this.dist*(float)Math.cos(Math.cos(t*0.3)*t*this.omegaX+this.phiX);
    // this.yPos=this.centerY + this.dist*0.3*(float)Math.sin(t*this.omegaY+this.phiY);
    this.tremolio(t);
    this.radiusI=this.startR + 5*(float)Math.sin(t*2*this.omegaX+this.phiY);


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
    this.xPos=this.centerX + map(noise(shakiness*3*t), 0,1, -ampTremoX, ampTremoX);
    this.yPos=this.centerY + map(noise(shakiness*t), 0,1, -ampTremoY, ampTremoY);
  }


}
