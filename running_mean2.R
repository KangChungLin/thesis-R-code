mxd=`MXD_imfs1~7`[344:1100,]
mxd_50yr=running_mean(mxd[,2], 50)
plot(mxd[,1],mxd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(1275:1982,mxd_50yr,lwd=2)

abline(v=1334,lty=2,col='blue')
abline(v=1359,lty=2,col='blue')
abline(v=1448,lty=2,col='blue')
abline(v=1487,lty=2,col='blue')
abline(v=1587,lty=2,col='blue')
abline(v=1717,lty=2,col='blue')
abline(v=1806,lty=2,col='blue')
abline(v=1911,lty=2,col='blue')

plot(mxd[,1],mxd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(loess.smooth(mxd[,1],mxd[,2],span = 50/708),lwd=2)
abline(v=1638,lty=2)
abline(v=1756,lty=2)
abline(v=1790,lty=2)
abline(v=1876,lty=2)


10*0.3/(30*0.3+(1-0.3))

t=10
r=0.4
t*r/(t*r+(1-r))

library(igraph)
mxd=`MXD_imfs1~9`[344:1100,]
mxd_50yr=running_mean(mxd[,2], 50)
plot(mxd[,1],mxd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(1275:1982,mxd_50yr,lwd=2)
plot(mxd[,1],mxd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(loess.smooth(mxd[,1],mxd[,2],span = 50/708),lwd=2)



rd=`RD_imfs1~9`[344:1100,]
rd_50yr=running_mean(rd[,2], 50)
plot(rd[,1],rd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(1275:1982,rd_50yr,lwd=2)
plot(rd[,1],rd[,2],type = 'l',lwd=0.5,col='gray', xlab = 'Year', ylab = 'Value')
lines(loess.smooth(rd[,1],rd[,2],span = 50/708),lwd=2)


rd=ts(`RD_imfs1~3`[,2],start = 907,end = 2008)

library(multitaper)
rd.spec=spec.mtm(rd, nw=2.0, k=4,dtUnits="year")
spec.mtm(ar1.s)
library(TSA)
periodogram(rd,log = 'yes')
data(ar1.s)
periodogram(ar1.s)
plot(rd.spec,log='dB')
plot.spec.phase(rd.spec)

library(biwavelet)
p <- ar1.spectrum(0.9, 1:1102)
plot.ts(p)

data(willamette)
resSpec <- spec.mtm(willamette, nw=4.0, k=8, Ftest=TRUE, plot=FALSE, deltat=1.0, dtUnits="month")
plot(resSpec)
plot(resSpec, Ftest=TRUE)
plot(resSpec, Ftest=TRUE, siglines=c(0.90, 0.99))


resSpec <- spec.mtm(rd, nw=2.0, k=4, Ftest=TRUE, plot=FALSE, deltat=1.0, dtUnits="year")
plot(resSpec)
plot(resSpec, Ftest=TRUE)
plot(resSpec, Ftest=TRUE, siglines=c(0.90, 0.99))

