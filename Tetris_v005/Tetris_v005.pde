
// Libreria de MySQL y Processing
import de.bezier.data.sql.*;

// Objecto de connexión a la BBDD
MySQL msql;

enum PANTALLA {
  MENU, JUGAR, CONFIG
};

PANTALLA pantalla = PANTALLA.MENU;

Tablero t;
Figura figActual;
boolean gameOver = false;
int numLinies = 0;
FigList figs;

int speed = 10;

void setup() {
  fullScreen();
  textAlign(CENTER);  // Alineación del texto
  textSize(18);   // Tamaño del texto
  rectMode(CENTER);

  //connecta();

  loadMedia();
  setGUI();

  t = new Tablero(10, 20, width/2-300, 0, 600, height);

  figs = new FigList();
  figActual = figs.nextFigura();

}



void draw() {

  image(imgFondo, 0, 0, width, height);   //Imagen de fondo

  // Dibuixa la pantalla corresponent
  switch(pantalla) {
  case MENU: 
    dibujaPantallaMenu(); 
    break;
  case JUGAR:
    dibujaPantallaJuego(); 
    jugar();
    break;
  case CONFIG: 
    dibujaPantallaAjustes(); 
    break;
  } 

  updateCursor();
}

void jugar() {

  pushMatrix();
  translate(t.x, t.y);
  // Dibuixa el tauler
  t.dibuja();

  // Dibuixa la figura actual
  t.dibuja(figActual);

  popMatrix();

  // Bucle del juego
  if (!gameOver) {
    
    if (frameCount%speed == 0 && !figActual.moverAbajo(t)) {
      println("Figura bloqueada!!");
      if (figActual.fila==0) {
        println("Partida acabada!!");
        gameOver = true;
      } else {
        // Añadir figura al tauler
        t.anadirFigura(figActual);
        t.aplica(figActual);

        // Comprovar linies
        boolean[] llenas = t.comprovarFilasLlenas();
        for (int f=0; f<llenas.length; f++) {
          if (llenas[f]==true) {
            t.bajarFigurasAntesDe(f);
            numLinies++;
          }
        }
          
          if(figs.isEmpty()){
            figs = new FigList();
          }
        figActual = figs.nextFigura();
      }
    }
  } else {
    // Si la partida ha acabado
    fill(0); 
    textAlign(CENTER); 
    textSize(50);
    text("GAME OVER", width/2, height/2);
    // Número de figuras colocadas
    text("FIGURAS:"+t.getNumFiguras(), width/2, height/2 + 100);
    // Número de líneas
    text("LINEAS:"+numLinies, width/2, height/2+200);
  }
}
