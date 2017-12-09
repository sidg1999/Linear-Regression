ArrayList<Double> xMatrix = new ArrayList<Double>();
ArrayList<Double> yMatrix = new ArrayList<Double>();
ArrayList<Double> theta = new ArrayList<Double>();
ArrayList<Double> JHistory = new ArrayList<Double>();

double m=0;
Table table = new Table();
boolean newLine=false;

void setup() {
  size(1000, 500);
  background(255, 255, 255);
  line(500, 0, 500, 500);
  table.drawTable();
  theta.add((double)(0.00));
  theta.add((double)(0.00));
  fill(255, 255, 255);
  rect(0,0,500,500);
}

void draw() {
  //atleast two pts
  if (m>1) {
    //if a new line needs to be drawn
    if(newLine==true){
      fill(255, 255, 255);
      rect(0,0,500,500);
      fill(0, 0, 0);
      drawDots();
      gradientDescent();
      newLine=false;
      println(theta);
      line((float)0,(float)(500-hypothesis(0)),(float)500,(float)(500-hypothesis(500)));
      String sT0,sT1;
      sT0 = theta.get(0) + "";
      sT1 = theta.get(1) + "";
      text("y = " + nf(Float.parseFloat(sT1),0,2) + "x + " + nf(Float.parseFloat(sT0),0,2),30,470);
    }
  }
}

void initializeDataSet(){
    fill(0, 0, 0);
    ellipse(23, 94, 10, 10);
    ellipse(98, 68, 10, 10);
    xMatrix.add((double)23);
    yMatrix.add((double)406.0);
    table.addEx(xMatrix.get(xMatrix.size()-1), yMatrix.get(yMatrix.size()-1));
    xMatrix.add((double)98);
    yMatrix.add((double)432.0);
    table.addEx(xMatrix.get(xMatrix.size()-1), yMatrix.get(yMatrix.size()-1));
}


void mousePressed() {
  if (m<7) {
    fill(0, 0, 0);
    ellipse(mouseX-5, mouseY-5, 10, 10);

    xMatrix.add((double)((int)(mouseX-5)));
    yMatrix.add((double)((int)(500-mouseY-5)));

    table.addEx(xMatrix.get(xMatrix.size()-1), yMatrix.get(yMatrix.size()-1));

    m++;
    newLine=true;

  }else{
    m = 0;
  }
}

void drawDots(){
  
  for(int i = 0; i<m; i++){
    String sX = xMatrix.get(i) + "";
    String sY = yMatrix.get(i) + "";
    ellipse(Float.parseFloat(sX),(-1)*Float.parseFloat(sY)+500-10,(float)10,(float)10);  
  }
}