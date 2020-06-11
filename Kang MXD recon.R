#IMFs combination

MXD_imfs <- read.csv("D:/density_eemd/series_imfs/MXD/MXD_imfs.csv")


for (i in 1:9) 
{
  for (j in (i+1):10) 
  {
    imf=rowSums(MXD_imfs[,(i+1):(j+1)])
    MXD_com=cbind(MXD_com,imf)
    colnames(MXD_com)[length(MXD_com[1,])]=paste0('IMF',i,'-',j)
  }
}


write.csv(MXD_com,'MXD_com.csv',quote = F,row.names = F)

#Model selection
MXD_temp <- read.csv("D:/MXD_temp.csv")
MXD_com <- read.csv("D:/density_eemd/MXD_com.csv")

a=MXD_com[MXD_com$year>1950 & MXD_com$year<2007,]
MXD_temp=cbind(a,jun.Oct=MXD_temp$jun.Oct)

temp.lm1=lm(jun.Oct~1,MXD_temp, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(jun.Oct~.,MXD_temp, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)

lm.fit=lm(jun.Oct~IMF1.10,MXD_temp)
summary(lm.fit)

MXD_pred=predict(lm.fit,MXD_com)
mxd=cbind(year=MXD_com$year,recon=MXD_pred)

write.csv(mxd,'MXD_original_recon.csv',row.names = F,quote = F)

#mtm spectrum

library(astrochron)
MXD_pred=predict(lm.fit,MXD_com)
mxd=cbind(MXD_com$year,MXD_pred)
temp=cbind(year=MXD_temp$year,temp=MXD_temp$jun.Oct)

output=mtm(mxd,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)
dev.off()

plot(output[,1],log10(output[,2]),type = 'l',main = 'IMF23',
     xlab = 'Frequency',ylab = 'Power (log)',
     las=1,lwd=2,bty='l')

lines(output[,1],log10(output[,6]),lty=2,col='red')  #99%C.I.
lines(output[,1],log10(output[,7]),lty=2,col='red')  #95%C.I.
lines(output[,1],log10(output[,8]),lty=2,col='red')  #90%C.I.
text(0.51,-4.35,'99%',col='red')
text(0.51,-4.45,'95%',col='red')
text(0.51,-4.55,'90%',col='red')


#plot
library(dplR)

plot(MXD_com[294:1100,1],MXD_pred[294:1100]-14.74,type = 'l',col='gray80',las=1,xlab = 'Year',
     ylab =expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')'))) 
#1961-1990 mean=14.74  #anomaly base
#1400-1600 mean=14.87
#1200-2006 mean=14.84
#IMF1-10+IMF23 RMSE=0.2617
#1200-2006 mean anomaly=0.1

m=0.1
abline(h=m+0)
abline(h=m+0.2617,lty=2,col='blue')
abline(h=m-0.2617,lty=2,col='blue')
abline(h=m+0.2617*2,lty=3,col='red')
abline(h=m-0.2617*2,lty=3,col='red')

MXD_pred=predict(lm.fit,MXD_com)
chr.10pass=pass.filt(MXD_pred[294:1100]-14.74,W=10,type = 'low')
chr.50pass=pass.filt(MXD_pred[294:1100]-14.74,W=50,type = 'low')

abline(v=1200,lty=2,lwd=0.5,col='gray80')
abline(v=1250,lty=2,lwd=0.5,col='gray80')
abline(v=1300,lty=2,lwd=0.5,col='gray80')
abline(v=1350,lty=2,lwd=0.5,col='gray80')
abline(v=1400,lty=2,lwd=0.5,col='gray80')
abline(v=1450,lty=2,lwd=0.5,col='gray80')
abline(v=1500,lty=2,lwd=0.5,col='gray80')
abline(v=1550,lty=2,lwd=0.5,col='gray80')
abline(v=1600,lty=2,lwd=0.5,col='gray80')
abline(v=1650,lty=2,lwd=0.5,col='gray80')
abline(v=1700,lty=2,lwd=0.5,col='gray80')
abline(v=1750,lty=2,lwd=0.5,col='gray80')
abline(v=1800,lty=2,lwd=0.5,col='gray80')
abline(v=1850,lty=2,lwd=0.5,col='gray80')
abline(v=1900,lty=2,lwd=0.5,col='gray80')
abline(v=1950,lty=2,lwd=0.5,col='gray80')
abline(v=2000,lty=2,lwd=0.5,col='gray80')


lines(MXD_com[294:1100,1],chr.10pass,col='red',lwd=2)
lines(MXD_com[294:1100,1],chr.50pass,col='blue4',lwd=4)

abline(v=1257)
abline(v=1452)
abline(v=1600)
abline(v=1892)
abline(v=1547)
abline(v=1606)

#legend(1730,0.8,bty='n',
#       legend = c('Reconstruction of temperature anaomaly','10-yr low pass filter',
#                  '50-yr low pass filter','Mean temperature (1400-1600)'),
#       col=c('gray60','blue','red','black'),lwd=c(1,2,4,1),lty = c(1,1,1,2))


chr.50low=cbind(year=MXD_com[294:1100,1],value=chr.50pass)
write.csv(chr.50low,'50 low pass.csv',row.names = F, quote = F)
