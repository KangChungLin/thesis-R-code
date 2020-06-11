hist(RW[,2:49])
rw=RW[,-1]
hist(rw[which(rw[,1]!='NA'),1])


rw.seq=rw[which(rw[,1]!='NA'),1]

for (i in 2:48) 
{
  rw.seq=c(rw.seq,rw[which(rw[,i]!='NA'),i])
}


hist(rw.seq,breaks =50,main = 'Histogram of RW',xlab = 'RW(mm)',xlim = c(0,3) )

2*tan(pi/180*9)
length(which(rw<0.32))
6532/36997
