// Funciones de Dibujo de las Pantallas

void dibujaPantallaMenu() {
  pushStyle();
  //dibujoTablaPuntuaciones();
  dibujoBotones();
  dibujoLogo();
  Seleccion.display();
  popStyle();
}

void dibujaPantallaJuego() {
  enableButtons();
  dibujoBotones();
  bJugar.setEnabled(false);
  bConfig.setEnabled(false);
  dibujoTablasPiezas();
  dibujoTablaPuntuaciones();
}

void dibujaPantallaAjustes() {
  enableButtons();
  dibujoBotones();
  bJugar.setEnabled(false);
  bConfig.setEnabled(false);
  dibujoZonaCentral();
  piezaFantasma.display();
  volumen.display();
  tipoMusica.display();
  hold.display();
  hardDrop.display();
  softDrop.display();
  rotateLeft.display();
  rotateRight.display();
  moveLeft.display();
  moveRight.display();
  bReset.display();
}
