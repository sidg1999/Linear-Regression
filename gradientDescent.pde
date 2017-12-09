public void gradientDescent(){
  JHistory.clear();
  double alpha = 0.00001;
  double temp0;
  double temp1;
  for(int i = 0; i<2000000; i++){
    temp0 = theta.get(0) - alpha * (derivativeTerm(0));
    temp1 = theta.get(1) - alpha * (derivativeTerm(1));
    theta.clear();
    theta.add(temp0);
    theta.add(temp1);
    JHistory.add(cost());
  }
}
public double derivativeTerm(int whichCol){
  //if it's the y intercept (theta0) then no multiplication of x_j 
  double sumDif=0;
  if(whichCol==0){
    for(int i = 0; i<m; i++){
      sumDif+=hypothesis(xMatrix.get(i))-yMatrix.get(i);
    }
  }else{
    for(int i = 0; i<m; i++){
      sumDif+=(hypothesis(xMatrix.get(i))-yMatrix.get(i))*xMatrix.get(i);
    }
  }
  return (sumDif/m);
}

public double cost() {
  double sumSqDif=0;
  for (int i = 0; i<m; i++) {
    sumSqDif+= Math.pow((hypothesis(xMatrix.get(i))-yMatrix.get(i)), 2);
  }
  return (1/(2*m))*sumSqDif;
}

public double hypothesis(double x) {
  return theta.get(0) + theta.get(1)*x;
}