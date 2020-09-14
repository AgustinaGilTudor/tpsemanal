int estado = 0;
int cantTextos = 5;
int cantImagenes = cantTextos;
PImage [] imagenes = new PImage [cantImagenes]; 
String [] textos = new String [cantTextos]; 
int imagenAleatoria;
int textoAleatorio;
int vidas=3;
void setup() {
  size(600, 600);
  inicializarJuego();
}

void draw() {
  dibujarJuego();
  vidas();
}

void mouseClicked() {
  //generarAleatorios();
  if (clickBotonOK()) {
    matchOK();
    inicializarJuego();
  } else if (clickBotonKO()) {
    matchKO();
  } else 
  vidas=vidas-1; 
  inicializarJuego();
}
void keyPressed() {
  if (gane() || perdi()) {
    if (key == 'r' ) {
      inicializarJuego();
      vidas=3;
    }
  }
}
