Figura creaFiguraRandom(){
  
  int f = 0;
  int rc = (int)random(0, t.numCols-4);
  
  int n = (int) random(0, 5);
  
  Figura fig;
  switch(n){
    case 0: fig = new FiguraZR();
            break;
            
    case 1: fig = new FiguraZL();
            break;
            
    case 2: fig = new FiguraLL();
            break;
            
    case 3: fig = new FiguraLR();
            break;
            
    case 4: fig = new FiguraT();
            break;
            
    case 5: fig = new FiguraF();
            break;
            
    default: fig = new FiguraS();
             break;
  }
  
  fig.setPosicio(f, rc);
  return fig;
}
