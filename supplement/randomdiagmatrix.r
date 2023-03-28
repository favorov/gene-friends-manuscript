library(data.table)
library(dplyr)
library(ggplot2)

msize<-100
n<-1000
zerodiag<-TRUE

two_columns<-data.table('u31'=rep(-1,n),'u32'=rep(-1,n))


for (i in 1:n) {
  matr<-matrix(runif(msize**2),nrow=msize)
  matr<-matr+t(matr)
  if(zerodiag) {diag(matr)<-0}
  two_columns[i,1]<-msize-rank(matr[,1])[3]
  two_columns[i,2]<-msize-rank(matr[,2])[3]
}

#toplot<-two_columns[, .(count=.N), by=.(u31, u32)]
two_columns<-two_columns %>% count (u31,u32)
plot(two_columns,cex=.5)
tst<-cor.test(two_columns[[1]],two_columns[[2]],method="kendall")
print(tst)