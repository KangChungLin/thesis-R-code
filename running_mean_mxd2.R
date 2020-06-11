library(boot)
library(meboot)
library(igraph)
mxd=`MXD_imfs1~8`[,2]
mxd=(mxd*122+223)/16
mxd=mxd-mean(mxd[494:694])
mxd.meb=meboot(mxd)
mxd.mat=cbind(mxd,mxd.meb$ensemble)
mxd.mat=t(mxd.mat)
mxd.env=envelope(mat=mxd.mat)
plot(`MXD_imfs1~8`[994:1102,1],`MXD_imfs1~8`[994:1102,2],type = 'l',lwd=2)
lines(`MXD_imfs1~8`[994:1102,1],mxd.env$point[1,994:1102],lty=2,col='blue')
lines(`MXD_imfs1~8`[994:1102,1],mxd.env$point[2,994:1102],lty=2,col='blue')
arrows(`MXD_imfs1~8`[994:1102,1],mxd.env$point[1,994:1102],
       `MXD_imfs1~8`[994:1102,1],mxd.env$point[2,994:1102],
       length=0.05, angle=90, code=3,col = 'gray')
mxd.run=running_mean(mxd,51)
mxd1.run=running_mean(mxd.env$point[1,],51)
mxd2.run=running_mean(mxd.env$point[2,],51)

plot(`MXD_imfs1~8`[294:1102,1],mxd[294:1102],type = 'n',las=1,ylim = c(-0.4,0.4),
     xlab = 'Year',ylab =expression( paste('Mar(-)-Jun temperature anomaly','  (',degree,C,')')))
lines(`MXD_imfs1~8`[26:1077,1],mxd.run,lwd=4,col='darkblue')
lines(`MXD_imfs1~8`[26:1077,1],mxd1.run,lwd=2,lty=2,col='red')
lines(`MXD_imfs1~8`[26:1077,1],mxd2.run,lwd=2,lty=2,col='red')
abline(h=0,lty=2)
abline(v=1280,lty=2,col='red')
abline(v=1430,lty=2,col='red')
abline(v=1500,lty=2,col='red')
abline(v=1670,lty=2,col='red')
abline(v=1925,lty=2,col='red')
abline(v=1940,lty=2,col='red')
abline(v=1980,lty=2,col='red')
legend(1700,0.4,legend = c('51-yr running mean','95% C.I.','mean temperature (1400-1600)'),
       col = c('darkblue','red','black'),lty=c(1,2,2),lwd = c(4,2,1),bty='n')

text(1290,-0.4,'1280',cex=0.7)
text(1440,-0.4,'1430',cex=0.7)
text(1510,-0.4,'1500',cex=0.7)
text(1680,-0.4,'1670',cex=0.7)
text(1930,-0.4,'1925',cex=0.7)
text(1950,-0.4,'1940',cex=0.7)
text(1990,-0.4,'1980',cex=0.7)


arrows(`MXD_imfs1~8`[294:1102,1],mxd.env$point[1,294:1102],
       `MXD_imfs1~8`[294:1102,1],mxd.env$point[2,294:1102],
       length=0.05, angle=90, code=0,col = 'red',lwd = 3)
#lines(`MXD_imfs1~8`[294:1102,1],`MXD_imfs1~8`[294:1102,2],lwd=2)


mxd.run=running_mean(mxd,101)
mxd1.run=running_mean(mxd.env$point[1,],101)
mxd2.run=running_mean(mxd.env$point[2,],101)
plot(`MXD_imfs1~8`[294:1102,1],mxd[294:1102],type = 'n',las=1,ylim = c(-0.4,0.4),
     xlab = 'Year',ylab = expression( paste('Mar(-)-Jun temperature anomaly','  (',degree,C,')')))
lines(`MXD_imfs1~8`[51:1052,1],mxd.run,lwd=4,col='darkblue')
lines(`MXD_imfs1~8`[51:1052,1],mxd1.run,lwd=2,lty=2,col='red')
lines(`MXD_imfs1~8`[51:1052,1],mxd2.run,lwd=2,lty=2,col='red')
abline(h=0,lty=2)
abline(v=1270,lty=2,col='red')
abline(v=1430,lty=2,col='red')
abline(v=1520,lty=2,col='red')
abline(v=1640,lty=2,col='red')
abline(v=1952,lty=2,col='red')
legend(1700,0.4,legend = c('101-yr running mean','95% C.I.','mean temperature (1400-1600)'),
       col = c('darkblue','red','black'),lty=c(1,2,2),lwd = c(4,2,1),bty='n')
text(1280,-0.4,'1270',cex=0.7)
text(1440,-0.4,'1430',cex=0.7)
text(1530,-0.4,'1520',cex=0.7)
text(1650,-0.4,'1640',cex=0.7)
text(1965,-0.4,'1955',cex=0.7)