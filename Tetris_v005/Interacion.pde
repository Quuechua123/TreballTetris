char teclaRight, teclaLeft, rotaLeft, rotaRight, caidaSuave, caidaRapida, guardarPieza;

void valoresInicialesTeclas() {
  teclaRight = 'd';
  teclaLeft = 'a';
  rotaLeft = 'q';
  rotaRight = 'e';
  caidaSuave = 'w';
  caidaRapida = 's';
  guardarPieza = 'c';
}

void keyPressed() {
  if (key==teclaRight) {
    println("Derecha");
    figActual.moverDerecha(t);
  } else if (key==teclaLeft) {
    println("Izquierda");
    figActual.moverIzquierda(t);
  } else if (key==rotaRight) {
    println("Rotar Derecha");
    figActual.rota(0);
  } else if (key==rotaLeft) {
    figActual.rota(1);
  } else if (key==caidaSuave) {
    println("Suave");
    figActual.moverAbajo(t);
  } else if (key==caidaRapida) {
    println("Rapida");
    figActual.moverAbajo(t);
  } else if (key==guardarPieza) {
    println("Guardar");
  }
}

void mousePressed() {

  if (bJugar.mouseOverButton() && bJugar.enabled) {
    pantalla = PANTALLA.JUGAR;
    audio1.play();
  } else if (bConfig.mouseOverButton() && bConfig.enabled) {
    pantalla = PANTALLA.CONFIG;
    audio1.play();
  } else if (bSalida.mouseOverButton() && bSalida.enabled) {
    pantalla = PANTALLA.MENU;
    audio1.play();
  } else if (moveRight.mouseOverSelect() && moveRight.enabled) {
    if (!moveRight.collapsed) {
      moveRight.update();
      //   println(moveRight.selectedValue);
      //  teclaRight = moveRight.selectedValue.charAt(0);
    }
    moveRight.toggle();
  } else if (moveLeft.mouseOverSelect() && moveLeft.enabled) {
    if (!moveLeft.collapsed) {
      moveLeft.update();
    }
    moveLeft.toggle();
  } else if (rotateRight.mouseOverSelect() && rotateRight.enabled) {
    if (!rotateRight.collapsed) {
      rotateRight.update();
    }
    rotateRight.toggle();
  } else if (rotateLeft.mouseOverSelect() && rotateLeft.enabled) {
    if (!rotateLeft.collapsed) {
      rotateLeft.update();
    }
    rotateLeft.toggle();
  } else  if (softDrop.mouseOverSelect() && softDrop.enabled) {
    if (!softDrop.collapsed) {
      softDrop.update();
    }
    softDrop.toggle();
  } else if (hardDrop.mouseOverSelect() && hardDrop.enabled) {
    if (!hardDrop.collapsed) {
      hardDrop.update();
    }
    hardDrop.toggle();
  } else if (hold.mouseOverSelect() && hold.enabled) {
    if (!hold.collapsed) {
      hold.update();
    }
    hold.toggle();
  } else  if (Seleccion.mouseOverSelect() && Seleccion.enabled) {
    if (!Seleccion.collapsed) {
      Seleccion.update();
    }
    Seleccion.toggle();
    if(Seleccion.selectedValue!=""){
      bJugar.setEnabled(true);
      bConfig.setEnabled(true);
    }
  } else if (piezaFantasma.onMouseOver()) {
    piezaFantasma.toggle();
  } else {
    volumen.update();
    tipoMusica.update();
  }
}


// Modifica el cursor
void updateCursor() {

  if ((bJugar.mouseOverButton() && bJugar.enabled)||
    (bConfig.mouseOverButton() && bConfig.enabled))
  {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
}
