
class personaje{
  String nombre;
  int vida;
  int ataque;
  int tipo;
  
  personaje(String nombre_, int vida_, int ataque_, int tipo_)
  {
    nombre= nombre_;
    vida=vida_;
    ataque=ataque_;
    tipo=tipo_;
  }
  
  void display()
  {
    switch(tipo)
    {
    case 0:
      image(personaje,0,0);
    break;
    
    case 1:
      image(personaje2,0,0);
    break;
    
    case 2:
      image(personaje3,0,0);
     break;
     
     case 3:
       image(personaje4,0,0);
     break;
     
     case 4: 
       image(personaje5,0,0);
     break;
  }
 }
  
  
void barra(){
  fill(#980202);
  rect(100,100,200,20);
  
  fill(#0CCB47);
  rect(100,100,hp,20); 
  hp=j1.vida;

}

void barra1(){
  fill(#980202);
  rect(550,100,200,20);
  
  fill(#0CCB47);
  rect(550,100,hp,20);  
  hp=j2.vida;
}

void pelea(){
    if(keyPressed){
      if(key == 'x' || key == 'X'){
        j2.vida -= j1.ataque;
        turno=1;
      }
    }
      
  if(j2.vida<=0){
    pantalla=10;
    //gana jugador 1
  }
}
  
  void pelea1(){
    if(keyPressed){
      if(key == 'p' || key == 'P'){
        j1.vida -= j2.ataque;
        turno=0;
      }
    }
    if(j1.vida<=0){
      pantalla=10;
    }
  }
  
}