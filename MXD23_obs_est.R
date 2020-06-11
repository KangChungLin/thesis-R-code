MXD_temp <- read.csv("D:/MXD_temp.csv")
MXD_com <- read.csv("D:/density_eemd/MXD_com.csv")

a=MXD_com[MXD_com$year>1950 & MXD_com$year<2007,]
MXD_temp=cbind(a,jun.Oct=MXD_temp$jun.Oct)


lm.fit=lm(jun.Oct~IMF1.10+IMF2.3,MXD_temp)
t1=MXD_temp[1:28,]
t2=MXD_temp[29:56,]
lm1.fit=lm(jun.Oct~IMF1.10+IMF2.3,t1)
lm2.fit=lm(jun.Oct~IMF1.10+IMF2.3,t2)

par(mfrow=c(2,1),mar=c(3,5,0.5,1))
plot(MXD_temp$year,MXD_temp$jun.Oct,type = 'b',lty=1,pch=1,lwd=2,las=1,xlab='',ylab ='' )
lines(MXD_temp$year,predict(lm1.fit,MXD_temp),type = 'b',lty=2,pch=19,lwd=2)
lines(MXD_temp$year,predict(lm.fit),type = 'b',lty=3,pch=2,lwd=2)
abline(v=1978.5,lty=2,col='gray60')
legend(1983,14.3,c('Observation','Verification','Reconstruction'),lty = c(1,2,3),pch = c(1,19,2),
       bty='n',horiz = T)
text(1964,15.75,'Calibration period',cex=1.2)
text(1964,15.65,'1951-1978',cex=1.2)
text(1993,15.75,'Verification period',cex=1.2)
text(1993,15.65,'1979-2006',cex=1.2)
text(1950,15.7,'(a)',cex=1.5)

plot(MXD_temp$year,MXD_temp$jun.Oct,type = 'b',lty=1,pch=1,lwd=2,las=1,xlab='',ylab ='' )
lines(MXD_temp$year,predict(lm2.fit,MXD_temp),type = 'b',lty=2,pch=19,lwd=2)
lines(MXD_temp$year,predict(lm.fit),type = 'b',lty=3,pch=2,lwd=2)
abline(v=1978.5,lty=2,col='gray60')
legend(1983,14.3,c('Observation','Verification','Reconstruction'),lty = c(1,2,3),pch = c(1,19,2),
       bty='n',horiz = T)
text(1964,15.75,'Verification period',cex=1.2)
text(1964,15.65,'1951-1978',cex=1.2)
text(1993,15.75,'Calibration period',cex=1.2)
text(1993,15.65,'1979-2006',cex=1.2)
text(1950,15.7,'(b)',cex=1.5)

par(mfrow=c(1,1),mar=c(1,1.5,1,1))
mtext('Year',1,cex = 1.2)
mtext(expression( paste('Average Jun(-)-Oct temperature ','  (',degree,C,')')),2,cex = 1.2)


par(mfrow=c(2,1),mar=c(3,5,0.5,1))

plot(MXD_temp$year,MXD_temp$jun.Oct,type = 'l',col='blue',lty=2,lwd=2,las=1,xlab='',ylab ='' )
lines(MXD_temp$year,predict(lm.fit),col='red',lwd=2)
text(1950,15.7,'(a)',cex=1.5)


lm2.fit=lm(jun.Oct~IMF1.10,MXD_temp)
plot(MXD_temp$year,MXD_temp$jun.Oct,type = 'l',col='blue',lty=2,lwd=2,las=1,xlab='',ylab ='' )
lines(MXD_temp$year,predict(lm2.fit),col='red',lwd=2)
text(1950,15.7,'(b)',cex=1.5)

par(mfrow=c(1,1),mar=c(1,1.5,1,1))
mtext('Year',1,cex = 1.2)
mtext(expression( paste('Average Jun(-)-Oct temperature ','  (',degree,C,')')),2,cex = 1.2)