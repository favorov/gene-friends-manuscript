msize<-10
mnum<-1000
zerodiag<-TRUE

u31<-rep(-1,mnum)
u32<-rep(-1,mnum)

for (i in 1:mnum) {
  matr<-matrix(runif(msize**2),nrow=msize)
  matr<-matr+t(matr)
  if(zerodiag) {diag(matr)<-0}
  u31[i]<-msize-rank(matr[,1])[3]
  u32[i]<-msize-rank(matr[,2])[3]
}
plot(u31,u32,cex=.5)
tst<-cor.test(u31,u32, method="kendall")
print(tst)