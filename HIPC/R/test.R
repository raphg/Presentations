library(flowClust)

# Two peaks
y<-SimulateMixture(10000, c(.7,.3), c(2,6), c(1,2), nu=10)
dens<-density(y)
plot(dens)
x.valley<-findValley(dens,stepSize=1,n=10,tol.in=.Machine$double.eps,tol.out=.001)
abline(v=x.valley,col=2)

# 1 peak with a minor hump
y<-SimulateMixture(10000, c(.7,.3), c(2,5), c(1,2), nu=10)
dens<-density(y)
plot(dens)
x.valley<-findValley(dens,stepSize=1,n=10,tol.in=.Machine$double.eps,tol.out=.001)
abline(v=x.valley,col=2)

# 2 peaks with a minor hump
y<-SimulateMixture(10000, c(.5,.3,.2), c(2,5,7), c(1,1,1), nu=10)
dens<-density(y)
plot(dens)
x.valley<-findValley(dens,stepSize=1,n=10,tol.in=.Machine$double.eps,tol.out=.001)
abline(v=x.valley,col=2)


# 3 peaks
y<-SimulateMixture(10000, c(.5,.3,.2), c(2,5,8), c(1,1,1), nu=10)
dens<-density(y)
plot(dens)
x.valley<-findValley(dens,stepSize=1,n=10,tol.in=.Machine$double.eps,tol.out=.001)
abline(v=x.valley,col=2)


findValley<-function(dens,stepSize=1,n=5,tol.in=.Machine$double.eps,tol.out=.001)
{
  i<-seq(stepSize+1,length(dens$x)-stepSize,stepSize)
  i.plus<-i+1
  i.minus<-i-1
  ind.max.in<-i[dens$y[i]-dens$y[i.minus]< -tol.in & dens$y[i]-dens$y[i.plus]< -tol.in]
  # Remove the tails
  ind.max.in<-ind.max.in[ind.max.in<length(dens$x)-n*stepSize & ind.max.in>n*stepSize]
  # Second condition
  i.plus<-ind.max.in+n*stepSize
  i.minus<-ind.max.in-n*stepSize
  ind.max.out<-ind.max.in[dens$y[ind.max.in]-dens$y[i.minus]< -tol.out & dens$y[ind.max.in]-dens$y[i.plus]< -tol.out]
  
  dens$x[ind.max.out]
}