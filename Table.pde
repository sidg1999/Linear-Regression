class Table{
  
  int colNum=125;
  
  public Table(){
    
  }
  
  //w,h = 400, starts at 550, 50, 8x2
  public void drawTable(){
    for(int i = 50; i<450; i+=50){
      for(int j = 550; j<950; j+=200){
        rect(j,i,200,50);
      }
    }
    fill(0,0,0);
    //headers
    text("X",650,75);
    text("Y",850,75);
  }
  
  public void addEx(double x, double y){
    fill(0,0,0);
    if(colNum<450){
      text(x + "",650,colNum);
      text(y + "",850,colNum);
      colNum+=50;
    }
  }
   
}