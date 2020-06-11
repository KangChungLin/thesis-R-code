MXD_original_recon <- read.csv("D:/MXD_original_recon.csv")
`MXD_original+IMF23_recon` <- read.csv("D:/MXD_original+IMF23_recon.csv")


b=MXD_original_recon
a=`MXD_original+IMF23_recon`

a$recon=a$recon-14.74
b$recon=b$recon-14.74




library(dplR)

#par(mfrow=c(2,1),mar=c(0,5,3,1))

plot(a[294:1100,1],a[294:1100,2],type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100),labels = T)
chr.10pass1=pass.filt(a[294:1100,2],W=10,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2],W=50,type = 'low')

lines(a[294:1100,1],chr.10pass1,col='red',lwd=2)
lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=0.1,lty=2)
abline(h=0.1+0.2617,lty=2,col='blue')
abline(h=0.1-0.2617,lty=2,col='blue')
abline(h=0.1+0.2617*2,lty=3,col='red')
abline(h=0.1-0.2617*2,lty=3,col='red')



#legend(1730,0.95,bty='n',
#       legend = c('Reconstruction of temperature anaomaly','10-yr low pass filter',
#                  '50-yr low pass filter','Mean temperature (1200-2006)'),
#       col=c('gray60','blue','red','black'),lwd=c(1,2,4,1),lty = c(1,1,1,2))

legend(1250,0.98,bty='n',
       legend = c('Reconstruction of temperature anomaly','10-yr low pass filter',
                  '50-yr low pass filter'),
       col=c('gray60','blue','red'),lwd=c(1,2,4),lty = c(1,1,1))

legend(1700,0.98,bty='n',
       legend = c('Mean temperature (1200-2006)',expression(Mean %+-% 1*RMSE),
                  expression(Mean %+-% 2*RMSE)),
       col=c('black','blue','red'),lwd=c(1,1,1),lty = c(2,2,3))






text(1190,0.95,'(a)',cex = 1.2)

par(mar=c(3,5,0,1))
plot(b[294:1100,1],b[294:1100,2],type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))

chr.10pass2=pass.filt(b[294:1100,2],W=10,type = 'low')
chr.50pass2=pass.filt(b[294:1100,2],W=50,type = 'low')


lines(b[294:1100,1],chr.10pass2,col='red',lwd=2)
lines(b[294:1100,1],chr.50pass2,col='blue4',lwd=4)
abline(h=0.1)
text(1190,0.95,'(b)',cex = 1.2)

par(mfrow=c(1,1),mar=c(1,1.5,1,1))
mtext(expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')')),2,cex = 1.2)
mtext('Year',1,cex = 1.2)



#############################

library(dplR)

NETP <- read.csv("D:/paper data/NETP.csv")

NH <- read.csv("D:/paper data/NH.csv")

Asia <- read.csv("D:/paper data/Asia.csv")




par(mfrow=c(5,1),mar=c(0,5,0,1))

plot(a[294:1100,1],a[294:1100,2],type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass1=pass.filt(a[294:1100,2],W=50,type = 'low')

lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=0)
text(1190,0.95,'(a)',cex = 1.5)

plot(NH$year,NH$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000),ylim = c(-1.3,1)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass2=pass.filt(NH$temp,W=50,type = 'low')


lines(NH$year,chr.50pass2,col='blue4',lwd=4)
abline(h=0)
text(1190,0.93,'(b)',cex = 1.5)

plot(Asia$year,Asia$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass3=pass.filt(Asia$temp,W=50,type = 'low')


lines(Asia$year,chr.50pass3,col='blue4',lwd=4)
abline(h=0)

text(1190,0.5,'(c)',cex = 1.5)

plot(NETP$year,NETP$temp-0.374,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000),ylim = c(-1.2,1.0)) 
axis(1,at=seq(1200,2000,100),cex.axis=1.2)

chr.50pass4=pass.filt(as.numeric(NETP$temp)-0.374,W=50,type = 'low')


lines(NETP$year,chr.50pass4,col='blue4',lwd=4)
abline(h=0)
text(1190,0.9,'(d)',cex = 1.5)

par(mfrow=c(1,1),mar=c(6,1.5,1,1))
mtext(expression( paste('                Temperature anomaly','  (',degree,C,')')),2,cex = 1.2)
mtext('Year',1,cex = 1.2)



##############################################################

plot(a[294:1100,1],a[294:1100,2],type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Temperature anomaly','  (',degree,C,')')),xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))
chr.10pass1=pass.filt(a[294:1100,2],W=10,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2],W=50,type = 'low')

lines(a[294:1100,1],chr.10pass1,col='red',lwd=2)
lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=0.1,lty=2)

abline(v=1450)
abline(v=1640)
abline(v=1519)
abline(v=1606)
abline(v=1547)
abline(v=1892)

text(1462,-0.63,'1450',cex=0.8)
text(1652,-0.63,'1640',cex=0.8)
text(1531,-0.63,'1519',cex=0.8)
text(1618,-0.63,'1606',cex=0.8)
text(1559,-0.63,'1547',cex=0.8)
text(1904,-0.63,'1892',cex=0.8)



#######################################################################
plot(a[294:1100,1],a[294:1100,2],type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Temperature anomaly','  (',degree,C,')')),xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))
chr.10pass1=pass.filt(a[294:1100,2],W=10,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2],W=50,type = 'low')

lines(a[294:1100,1],chr.10pass1,col='red',lwd=2)
lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=0.1,lty=2)

abline(v=1257)
abline(v=1452)
abline(v=1600)
abline(v=1815)


text(1269,-0.63,'1257',cex=0.8)
text(1464,-0.63,'1452',cex=0.8)
text(1612,-0.63,'1600',cex=0.8)
text(1827,-0.63,'1815',cex=0.8)











