void dibujarJuego() {
  if (estoyJugando()) {
    aJugar();
  } else if (perdi()) {
    perdiste();
  } else if (gane()) {
    ganaste();
  }
}

boolean estoyJugando() {
  return estado == 0;
}

boolean perdi() {

  return estado == 2;
}

boolean gane() {
  return estado == 1;
}

void perdiste() {
  vidas=0;
  background(200);
  textSize(40);
  text("PERDISTE!!!!", width/2, height/4);
  textSize (30);
  text ("Presione la tecla R para reiniciar", width/2, height/2);
}

void ganaste() {
  background(200);
  textSize (40);
  text("GANASTE!!!!", width/2, height/4);
  textSize (30);
  text ("Presione la tecla R para reiniciar", width/2, height/2);
}

void aJugar() {
  dibujarPantalla(imagenAleatoria, textoAleatorio);
}

void dibujarPantalla(int imagenAleatoria, int textoAleatorio) {
  image(imagenes[imagenAleatoria], 0, 0, width, height);
  textAlign(CENTER);
  textSize(40);
  text(textos[textoAleatorio], width/2, height/2);
  println(imagenAleatoria, textoAleatorio);
}

void matchOK() {
  if (imagenAleatoria == textoAleatorio) {
    estado = 1;
  } else {
    estado = 2;
  }
}

void matchKO() {
  if (imagenAleatoria != textoAleatorio) {
    estado = 1;
  } else {
  }
}

void vidas () {
  textSize (15);
  text("Vidas"+vidas, 540, 540);
  if (vidas<=0) {
    estado=2;
  }
}
