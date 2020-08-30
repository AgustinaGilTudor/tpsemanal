int cantH = 10;
int tam;
int [] posX = new int [cantH]; // Posiciones en X de cada ellipse
int [] dirX = new int [cantH]; // Direcciones en X de cada ellipse
int personajePosX, personajePosY;
PImage meta;
PImage trofeo;
int vidas =3;
int nivel=1;

void setup() {
size(500, 500);
tam = height/cantH;
meta= loadImage ("lineaMeta.jpg");  
trofeo= loadImage ("trofeo.png");
surface.setResizable(true);
textSize(width/25);
textAlign(CENTER);
//No calculo la última fila, que es donde arranca el personaje
for (int h=2; h < cantH-1; h++) {
//Genero aleatoriamente la posX de la elipse
posX[h] = round(random(tam, width-tam));
//Genero aleatoriamente la dirección
if (random(0, width)>width/2)
dirX[h] = 1;
else
dirX[h] = -1;
}
//La ubicación del Personaje
personajePosX = width/2;
personajePosY = height - tam/2;
}

void draw() {  
 //Fondo 
tam = height/cantH;
image(meta,0,0);
meta.resize (width,height);
background(meta);
//Vidas
fill (255,0,0);
text("Vidas: "+vidas,width/1.11,height/1.11);
//Nivel
text("Nivel: "+nivel,50,450);

//No calculo la última fila, que es donde arranca el personaje

for (int h=2; h < cantH-1; h++) {
fill (200);
ellipse(posX[h], h*tam + tam/2, tam, tam);
//Calculo la nueva posición
posX[h] = posX[h] + dirX[h];
//Si toca algún borde, cambia la dirección
if (posX[h] < tam/2 || posX[h] > width-tam/2) {
dirX[h] = dirX[h] *-1;
}else if (personajePosX== posX[h] && personajePosY == h*tam + tam/2){
vidas=vidas-1;  

}else if (vidas<=0){
background (255);
textSize (40);
fill (0);
text ("Game over",width/2, height/4);
textSize (25);
text("Reiniciar", width/2, height/2);
noFill();
rect (200,230,100,30); 
personajePosX = width/2;
personajePosY = height - tam/2; 
nivel=1;
}else if (personajePosY<=0){
nivel=nivel+1;
personajePosX = width/2;
personajePosY = height - tam/2; 
 
}else if (nivel==3){
 background (255);
 textSize (30);
 fill (0);
 text("Ganaste",width/2, height/3);
 image (trofeo,200,200);
 trofeo.resize (100,100);
 personajePosX = width/2;
   personajePosY = height - tam/2; 
  text("Reiniciar", width/2, height/1.5);
   noFill();
   rect (180,310,150,40); 
 textSize (20);
 }
  fill(255,0,0);
  ellipse(personajePosX, personajePosY, tam, tam); 
}




}



 void keyPressed() {
 if (nivel==1){
   //Controlo el personaje arriba y abajo
if (keyCode == UP) {
    personajePosY = personajePosY - tam;
} else if (keyCode == DOWN) {
    personajePosY = personajePosY + tam;
}
 }else if (nivel==2){
if (keyCode == UP) {
    personajePosY = personajePosY + tam;
} else if (keyCode == DOWN) {
    personajePosY = personajePosY - tam;
}
}
 }
void mouseClicked() { 
if (vidas<=0){
  if (mouseX>200 && mouseX<300 && mouseY>230 && mouseY<260){
  vidas=3;
  }
}else if(nivel==3){
if (mouseX>180 && mouseX<330 && mouseY>310 && mouseY<350){
nivel=1;
vidas=3;  
}
}
}
