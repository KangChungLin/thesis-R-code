rw=read.rwl('RW.rwl')            #read file


years<-as.integer(rownames(rw))
eps=matrix(0,nrow = 101,ncol = 2)
eps[,1]=seq(950,1950,by=10)

for (i in 1:101) 
{
  rw.subset<-(subset(rw, subset=years>=(i-1)*10+950 & years<=(i+4)*10+950))        #time interval
  rw.subset<-rw.subset[,which(rw.subset[1,]!='NA')]                #remove series
  eps[i,2]=EPS.value(rw.subset)$eps
}

plot(eps[,1],eps[,2],type = 'l',xlab = 'Year',ylab = 'EPS')
abline(h=0.85,lty=2)
abline(h=0.8,lty=3)

rw.subset<-(subset(rw, subset=years>=1240 & years<=1290))        #time interval
rw.subset<-rw.subset[,which(rw.subset[1,]!='NA')]                #remove series
EPS.value(rw.subset)$eps


data(co021, package="dplR")
years<-as.integer(rownames(co021))
co021.subset<-(subset(co021, subset=years>=1900 & years<=1950))
co021.subset<-co021.subset[,-c(28,30,31)] ## to remove the following series "645232","646107" and "646118"

EPS.value(co021.subset, stc=c(0,8,0))
