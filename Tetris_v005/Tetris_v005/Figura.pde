class Figura {
  
  color c;
  
  int[][] matriz;
  
  int fila, col;
  
  Figura(int[][] matriz, color c){
    this.matriz = copiaMatriz(matriz);
    this.c = c;
  }
  
  void setPosicio(int f, int c){
    this.fila = f;
    this.col = c;
  }
  
  int getMaxCol(){
    int maxc=0;
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        if(matriz[f][c]==1 && c>maxc){
          maxc = c;
        }
      }
    }
    return maxc;
  }
  
  int getMaxFil(){
    int n=0;
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        if(matriz[f][c]==1){
          n = f;
        }
      }
    }
    return n;
  }
  
  int getMinCol(){
    int minc=matriz[0].length;
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        if(matriz[f][c]==1 && c<minc){
          minc=c;
        }
      }
    }
    return minc;
  }
  
  int getMinFil(){
    int n=0;
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        if(matriz[f][c]==1){
          return f;
        }
      }
    }
    return n;
  }
  
  void borrarFila(int nf){
    
    int df = nf - this.fila;
    
    // Si és la fila superior
    if(nf==df){
      for(int c=0; c<matriz[0].length; c++){
        matriz[0][c] = 0;
      }
    }
    else if(df>0 && df<matriz.length) {
      // Baixam totes les files superiors
      for(int f=df; f>0; f--){
        for(int c=0; c<matriz[f].length; c++){
          matriz[df][c] = matriz[df-1][c];
        }
      }
      // Buidam la 1era fila
      for(int c=0; c<matriz[0].length; c++){
        matriz[0][c] = 0;
      }
    }
  }
  
  boolean posicioLliure(Tablero t, int ff, int cf){
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        println("MIRANT FILA: "+(ff+f)+", I COL:"+(cf+c));
        if(matriz[f][c]==1 && t.tablero[ff+f][cf+c]==1){
          println("OCUPADA");
          return false;
        }
      }
    }
    return true;
  }
  
  void mouEsquerra(Tablero t){
    if(this.col + this.getMinCol() > 0){
      println("COL:"+this.col+",FILA: "+this.fila);
      
      int newCol = this.col - 1;
      
      println("COL DESTI:"+newCol);
      if(posicioLliure(t, this.fila, newCol)){
        println("SE POT MOURE");
        this.col--;
      }
    }
  }
  
  void mouDreta(Tablero t){
    if(this.col + this.getMaxCol() < t.numCols - 1){
      this.col++;
    }
  }
  
  boolean mouBaix(Tablero t){
    
    if(this.fila + this.getMaxFil() < t.numFils - 1){
      int newFila = this.fila + 1;
      if(posicioLliure(t, newFila, this.col)){
        this.fila++;
        return true;
      }
    }
    return false;
  }
  
  void rota(){
    
    int[][] q = this.copia();
    
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        matriz[f][c]=q[matriz.length - c -1][f];
      }
    }
  }
  
  
  int[][] copia(){
    
    int[][] q = new int[this.matriz.length][this.matriz[0].length];
    for(int f=0; f<matriz.length; f++){
      for(int c=0; c<matriz[0].length; c++){
        q[f][c] = matriz[f][c];
      }
    }
    return q;
  }
  

}
