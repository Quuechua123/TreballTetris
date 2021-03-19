// Objecto de conexión a la BBDD
MySQL msql;

// Paràmetres de la connexió
String user     = "root";
String pass     = "";   
String database = "tetris";


// Connexió
void conecta() {

  msql = new MySQL( this, "localhost", database, user, pass );

  // Si la connexió s'ha establert
  if (msql.connect()) {
    // La connexió s'ha establert correctament
    println("Connexió establerta :)");
  } else {
    // La connexió ha fallat!!!
    println("Error de Connexió :(");
  }
}

// Obté el número de files de la taula
int getNumRowsTabla(String nomTabla) {
  msql.query( "SELECT COUNT(*) AS n FROM %s", nomTabla );
  msql.next();
  int numRows = msql.getInt("n");
  return numRows;
}

// Obté informació de la taula Unitat
String[][] getInfoTablaPartida() {

  int numRows = getNumRowsTabla("Partida");

  String[][] data = new String[numRows][3];

  int nr=0;
  msql.query( "SELECT * FROM Partida" );
  while (msql.next()) {
    data[nr][0] = msql.getString("Nombre");
    data[nr][1] = String.valueOf(msql.getInt("Puntuacion"));
    data[nr][2] = formataFecha(msql.getString("Fecha")) ;
    nr++;
  }
  return data;
}

String[] getNomsTablaUnidad() {

  int numRows = getNumRowsTabla("unitat");

  String[] data = new String[numRows];

  int nr=0;
  msql.query( "SELECT nom FROM unitat" );
  while (msql.next()) {
    data[nr] = msql.getString("nom");
    nr++;
  }
  return data;
}
