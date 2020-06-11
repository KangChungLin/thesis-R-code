

a=`MXD_original+IMF23_recon`
temp=`850mb.temp_1951.2006`
x=mean(a[294:1100,2])       #mean of 1200-2006
y=mean(a[1055:1084,2])      #mean of 1961-1990

plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',
     las=1,xlab = 'Year',
     ylab =expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')'))
     ,xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))
lines(temp[,1],temp[,2]-y,lty=2)
abline(h=x-y,lty=2,col='gray50')
abline(h=x-y+0.2617,lty=2,col='blue')
abline(h=x-y-0.2617,lty=2,col='blue')
abline(h=x-y+0.2617*2,lty=3,col='red')
abline(h=x-y-0.2617*2,lty=3,col='red')
legend(1800,1.05,legend = c('Reconstruction','Observation'),
       lty = c(1,2),bty = 'n')