
import processing.sound.*;
SoundFile soundfile;

//arbol
pathfinder[] paths;
int num;
static int count;

//arbol2
ArrayList<Blade> bush = new ArrayList<Blade>();
int fillColor = 255, backgroundColor = 0, maxSize = 65;
boolean doOnce = true;

//particulas
ArrayList<Ball> floatBall;
int ballNum = 10;

int pantalla=0;
int turno=0;
int jugador1;
int jugador2;
int hp;

PFont medieval;
PFont normal;
PFont extra;

PImage personaje;
PImage personaje2;
PImage personaje3;
PImage personaje4;
PImage personaje5;
PImage historia;
PImage paisaje;
PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;

personaje Druida;
personaje Contemplador;
personaje Leviatan;
personaje Drider;
personaje Drow;

personaje j1;
personaje j2;

void setup(){
  size(850,600);
   
  //imagenes
  personaje= loadImage("1_Druida.png");
  personaje2= loadImage("2_contemplador.png");
  personaje3= loadImage("3_Leviatan.png");
  personaje4= loadImage("4_Drider.png");
  personaje5= loadImage("5_Drow.png");
  historia= loadImage("historia.jpg");
  paisaje= loadImage("landscape.jpg");
  p1= loadImage("p1.jpg");
  p2= loadImage("p2.jpg");
  p3= loadImage("p3.jpg");
  p4= loadImage("p4.jpg");
  p5= loadImage("p5.jpg");
  
  //audio
  soundfile = new SoundFile(this, "theme.mp3");
  soundfile.play();
  soundfile.loop();
   
  //fuentes
  medieval= loadFont("EnchantedLand-40.vlw");
  normal= loadFont("BellMT-25.vlw");
  extra= loadFont("FootlightMTLight-30.vlw");
  
  background(paisaje);       //default
  
  //clases
  Druida= new personaje("Druida",200,2,0);
  Contemplador= new personaje("Contemplador",200,6,1);
  Leviatan= new personaje("Leviatan",200,4,2);
  Drider= new personaje ("Drider",200,10,3);
  Drow= new personaje ("Drow", 200, 8,4);
  
  //arbol
  ellipseMode(CENTER);
  stroke(46, 115, 116, 200);
  smooth();
  num = 2;
  count = 0;
  paths = new pathfinder[num];
  for(int i = 0; i < num; i++) paths[i] = new pathfinder();
  
  //arbol2
  for (int i = 0; i < maxSize; i++) {
    bush.add(new Blade(random(40, 180)));//This is creating a blade with a random number of segments
  }
  
  //particulas juego
  floatBall = new ArrayList<Ball>();
  for (int i=0; i <ballNum; i++) {
    floatBall.add(new Ball());
  }
}

void draw(){
  switch(pantalla){
    
    case 0:
      //intro
      for (int i = 0; i < paths.length; i++) {
      PVector loc = paths[i].location;
      PVector lastLoc = paths[i].lastLocation;
      strokeWeight(paths[i].diameter);
      line(lastLoc.x, lastLoc.y, loc.x, loc.y);
      paths[i].update();
      }
        
    if(key=='c' || key=='C')
    {
       pantalla=1;
    }
  
    break;
    
/*-------------------------------Historia-----------------------------*/
    case 1:
      background(historia);
      if(key=='s' || key == 'S')
      {
        pantalla=2;
      }
    break;
    
  /*------------------------ conoce personajes --------------------*/  
    case 2:
      background(p1);
      
      if(key == 'q' || key == 'Q'){
        pantalla=3;
      }
    break;
    
    case 3:
      background(p2);
      
      if(key == 'w' || key == 'W'){
        pantalla=4;
      }
    break;
    
    case 4:  
      background(p3);
      
      if(key == 'e' || key == 'E'){
        pantalla=5;
      }
    break;
    
    case 5:
      background(p4);
      
      if(key == 'r' || key == 'R'){
        pantalla=6;
      }
    break;
    
    case 6:
      background(p5);
      
      if(key == 't' || key == 'T'){
        pantalla=7;
      }
    break;
    
/*------------------------------- seleccion --------------------------------------*/    
    case 7:
      background(#F3F5C3);
     
      fill(#646464);
      textAlign(CENTER);
      textFont(medieval);
      text("Jugador 1",425,50);
      textFont(normal);
      fill(0);
      textSize(20);
      text("Para elegir personaje presione la tecla correspondiente",425,80);
      
      pushMatrix();
      scale(0.5);
      translate(50,400);
      Druida.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(350,400);
      Contemplador.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(650,400);
      Leviatan.display();
      popMatrix();
 
      pushMatrix();
      scale(0.5);
      translate(1000,400);
      Drider.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(1300,400);
      Drow.display();
      popMatrix();
 
      textSize(18);
      text("A.Druida",100,420);
      text("B. Contemplador",260,420);
      text("C. Leviatan",425,420);
      text("D. Drider",580,420);
      text("E. Drow",730,420);
   
      if(keyPressed){
        if(key== 'A' || key == 'a'){
          jugador1=0;
          j1=Druida;
          pantalla=8;
        }
      
        if(key== 'B' || key == 'b'){
          jugador1=1;
          j1=Contemplador;
          pantalla=8;      
        }
      
        if(key== 'C' || key == 'c'){
          jugador1=2;
          j1=Leviatan;
          pantalla=8;      
        }
      
        if(key== 'D' || key == 'd'){
          jugador1=3;
          j1=Drider;
          pantalla=8;      
        }
      
        if(key== 'E' || key == 'e'){
          jugador1=4;
          j1=Drow;
          pantalla=8;      
        }
      }
     
    break;
    
 /* ---------------------- seleccion2 -------------------------------------*/
    case 8:
      background(#E1FAE4);
    
      fill(#646464);
      textSize(20);
      textFont(medieval);
      text("Jugador 2", 425, 50);
      fill(0);
      textFont(normal);
      text("Para elegir personaje presione la tecla correspondiente",425,80);
      
      pushMatrix();
      scale(0.5);
      translate(50,400);
      Druida.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(350,400);
      Contemplador.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(650,400);
      Leviatan.display();
      popMatrix();
 
      pushMatrix();
      scale(0.5);
      translate(1000,400);
      Drider.display();
      popMatrix();
      
      pushMatrix();
      scale(0.5);
      translate(1300,400);
      Drow.display();
      popMatrix();
      
      textSize(18);
      text("F.Druida",100,420);
      text("G. Contemplador",260,420);
      text("H. Leviatan",425,420);
      text("I. Drider",580,420);
      text("J. Drow",730,420);
      
      if(keyPressed){
        if(key== 'F' || key == 'f'){
          jugador2=0;
          j2 = Druida;
          pantalla=9;
        }
      
        if(key== 'g' || key == 'G'){
          jugador2=1;
          j2= Contemplador;
          pantalla=9;      
        }
      
        if(key== 'H' || key == 'h'){
          jugador2=2;
          j2= Leviatan;
          pantalla=9;      
        }
      
        if(key== 'I' || key == 'i'){
          jugador2=3;
          j2=Drider;
          pantalla=9;      
        }
      
        if(key== 'j' || key == 'J'){
          jugador2=4;
          j2=Drow;
          pantalla=9;      
        }
      }
      
    break;
    
    /*-------------------------Pantalla pelea ------------------------------*/
    case 9:
      background(#F1F5DA);
      
      //particulas juego
      if (floatBall.get(floatBall.size()-1).alpha ==230) {
        for (int i = 0; i <ballNum; i++) {
          floatBall.add(new Ball());
        }
      }
      if (floatBall.get(0).alpha < 0) {
        for (int i = 0; i < ballNum; i++) {
          floatBall.remove(0);
        }
      }
      for (int i = 0; i<floatBall.size(); i++) {
        Ball b1 = floatBall.get(i);
        b1.update();
        b1.drawball();
        b1.bounce();
      }
  
      fill(#646464);
      textSize(20);
      textFont(medieval);
      text("Lucha por tu Tierra",425,50);
      
      if(jugador1 == 0){
        pushMatrix();
        scale(0.7);
        translate(100,200);
        Druida.display();
        popMatrix();
    
        Druida.barra();
      }
  
      if(jugador1 ==1){
        pushMatrix();
        scale(0.7);
        translate(100,200);
        Contemplador.display();
        popMatrix();
    
        Contemplador.barra();
      }
  
      if(jugador1 == 2){
        pushMatrix();
        scale(0.7);
        translate(100,200);
        Leviatan.display();
        popMatrix();
    
        Leviatan.barra();
      }
  
      if(jugador1 == 3){
        pushMatrix();
        scale(0.7);
        translate(100,200);
        Drider.display();
        popMatrix();
    
        Drider.barra();
      }
  
      if(jugador1 == 4){
        pushMatrix();
        scale(0.7);
        translate(100,200);
        Drow.display();
        popMatrix();
    
        Drow.barra();
      }
  
  /************************* jugador 2******************************* */
  
      if(jugador2 == 0){
        pushMatrix();
        scale(0.7);
        translate(750,200);
        Druida.display();
        popMatrix();
    
        Druida.barra1();
      }
  
      if(jugador2 == 1){
        pushMatrix();
        scale(0.7);
        translate(750,200);
        Contemplador.display();
        popMatrix();
    
        Contemplador.barra1();
      }
  
      if(jugador2 == 2){
        pushMatrix();
        scale(0.7);
        translate(750,200);
        Leviatan.display();
        popMatrix();
    
        Leviatan.barra1();
      }
  
      if(jugador2 == 3){
        pushMatrix();
        scale(0.7);
        translate(750,200);
        Drider.display();
        popMatrix();
    
        Drider.barra1();
      }
  
      if(jugador2 == 4){
        pushMatrix();
        scale(0.7);
        translate(750,200);
        Drow.display();
        popMatrix();
    
        Drow.barra1();
      } 
  
      fill(#0F6C43);
      textAlign(CENTER);
      textFont(normal);
      textSize(20);
      text("Jugador 1: Ataca con 'p'",200,450);
      text("Jugador 2: Ataca con 'x'",650,450);
  
      if(turno==0){
        j1.pelea();
      }
  
      else{
        j2.pelea1();
      }
    
    break;
    
    /*------------------------------------- fin ----------------------------------------*/
    case 10:
    
    //arbol2
    background(backgroundColor);
    fill(fillColor);
    for(int i = 0; i < bush.size(); i++){
      Blade b = (Blade) bush.get(i);
      b.drw();
    }
    
      if(j1.vida<=0){
        textAlign(CENTER);
        textFont(extra);
        textSize(30);
        text("HAS GANADO JUGADOR 1",425,150);
        textFont(normal);
        textSize(20);
        text("Has salvado tu Tierra",425,180);
      }
  
      if(j2.vida<=0){
        textSize(30);
        textFont(extra);
        text("HAS GANADO JUGADOR 2",425,150);
        textSize(20);
        textFont(normal);
        text("Has salvado tu Tierra",425,180);
      }
  
      textSize(20);
      text("presiona r para regresar",680,550);
      if(keyPressed){
        if(key=='r' || key=='R'){
          pantalla=7;
          if(pantalla==7){
            j1.vida=200;
            j2.vida=200;
          }
        }
      }
    break;
  
  }
}


/* ----------------------- arbol -------------------------*/
class pathfinder {
  PVector lastLocation;
  PVector location;
  PVector velocity;
  float diameter;
  boolean isFinished;
  
  pathfinder() {
    location = new PVector(width/2, height);
    lastLocation = new PVector(location.x, location.y);
    velocity = new PVector(0, -10);
    diameter = random(10, 20);
    isFinished = false;
  }
  
   pathfinder(pathfinder parent) {
    location = parent.location.get();
    lastLocation = parent.lastLocation.get();
    velocity = parent.velocity.get();
    diameter = parent.diameter * 0.62;
    isFinished = parent.isFinished;
    parent.diameter = diameter;
  }
  
 void update() {
    
    if(location.x > -10 & location.x < width + 10 & location.y > -10 & location.y < height + 10) {
      lastLocation.set(location.x, location.y);
      if (diameter > 0.2) {
        count ++;
        PVector bump = new PVector(random(-1, 1), random(-1, 1));
        velocity.normalize();
        bump.mult(0.2);
        velocity.mult(0.8);
        velocity.add(bump);
        velocity.mult(random(5, 10));
        location.add(velocity);
        if (random(0, 1) < 0.2) { // control length
          paths = (pathfinder[]) append(paths, new pathfinder(this));
        }
      } 
      else {
        if(!isFinished) {
          isFinished = true;
          noStroke();
          fill(235, 178, 54, 100);    //flores
          ellipse(location.x, location.y, 10, 10);
          stroke(46, 115, 116, 200);
        }
      }
    }
  }
}

/*--------------------------------arbol2-----------------------------------*/
class Blade {
  float segments, angle, num;
  
  Blade(float segments) {
    this.segments = segments;
    angle = random(-20, 20);//Sets a random angle for the blade
  }

  void drw(){
    pushMatrix();
    translate(200, 620);
    branch(segments);
    popMatrix();
  }
  
  //This gets called repeatedly to draw all the segments of branch
  void branch(float len) {
    len *= 0.75;
    
    float t = map(len, 1, maxSize, 1, 5);
    float c = angle+sin(len+num) * 5;
    strokeWeight(t);
    
    /* Draw the line first then overlap the joints with white cirlces. */
    line(0, 0, 0, -len);
    ellipse(0, 0, t, t);
    
    /* We make the next location and if len > 5 then we make a new segment to our branch */
    translate(0, -len);
    if (len > 5) {
      pushMatrix();
      rotate(radians(c));
      /* A function that calls itself with the same parameters. */
      branch(len);
      popMatrix();
    }
    num+=0.001;
  }
}

//particulas
class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  int w, h,alpha;

  Ball() {
    pos = new PVector(400, 500);
    //vel = new PVector(1, -1);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    w = 30;
    h = 30;
    alpha =255;
  }

  void update() {
    acc.x = random(-0.13, 0.13);
    acc.y = random(-0.13, 0.13);
    vel.add(acc);
    pos.add(vel);
    //alpha = int(alpha - 0.5);
    alpha--;
  }

  void drawball() {
    noStroke();
    //stroke(255,alpha);
    fill(173,255, 173,alpha);
    ellipse(pos.x, pos.y, w, h);
  }
  void bounce() {
    if (pos.x>width || pos.x<0) {
      vel.x *= -1;
    }
    if (pos.y>height || pos.y<0) {
      vel.y *= -1;
    }
  }
}