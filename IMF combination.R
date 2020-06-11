MXD_com=MXD_imfs


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

a=MXD_com[MXD_com$year>1950,]
a=a[1:56,]
MXD_temp=cbind(a,jun.Oct=MXD_temp$jun.Oct)
MXD_temp=MXD_temp[,-1]

temp.lm1=lm(jun.Oct~1,MXD_temp, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(jun.Oct~.,MXD_temp, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)

t=MXD_temp
t1=MXD_temp[1:28,]
t2=MXD_temp[29:56,]

lm.fit=lm(jun.Oct~IMF1.10+IMF2.3,MXD_temp)
summary(lm.fit)

car::dwt(lm2.fit,max.lag=5,simulate=T,reps=10000)


car::ncvTest(lm2.fit)


shapiro.test(lm2.fit$resid)


lm1.fit=lm(jun.Oct~IMF1.10+IMF2.3,t1)
lm2.fit=lm(jun.Oct~IMF1.10+IMF2.3,t2)
summary(lm1.fit)
summary(lm2.fit)


pv1=(t2$jun.Oct-predict(lm1.fit,t2))^2
pc1=(t2$jun.Oct-mean(t1$jun.Oct))^2
pvm1=(t2$jun.Oct-mean(t2$jun.Oct))^2
re1=1-(sum(pv1)/sum(pc1))
ce1=1-(sum(pv1)/sum(pvm1))

pv2=(t1$jun.Oct-predict(lm2.fit,t1))^2
pc2=(t1$jun.Oct-mean(t2$jun.Oct))^2
pvm2=(t1$jun.Oct-mean(t1$jun.Oct))^2
re2=1-(sum(pv2)/sum(pc2))
ce2=1-(sum(pv2)/sum(pvm2))


library(dplR)

MXD_pred=predict(lm.fit,MXD_com)
m=mean(MXD_pred[494:694])

plot(MXD_com[294:1100,1],MXD_pred[294:1100]-m,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Jun(-)-Oct temperature anomaly','  (',degree,C,')')))
abline(h=0,lty=2)


chr.10pass=pass.filt(MXD_pred[294:1100]-m,W=10,type = 'low')
lines(MXD_com[294:1100,1],chr.10pass,col='blue',lwd=2)
chr.50pass=pass.filt(MXD_pred[294:1100]-m,W=50,type = 'low')
lines(MXD_com[294:1100,1],chr.50pass,col='red',lwd=4)

abline(v=1200,lty=2,lwd=0.5,col='gray')
abline(v=1250,lty=2,lwd=0.5,col='gray')
abline(v=1300,lty=2,lwd=0.5,col='gray')
abline(v=1350,lty=2,lwd=0.5,col='gray')
abline(v=1400,lty=2,lwd=0.5,col='gray')
abline(v=1450,lty=2,lwd=0.5,col='gray')
abline(v=1500,lty=2,lwd=0.5,col='gray')
abline(v=1550,lty=2,lwd=0.5,col='gray')
abline(v=1600,lty=2,lwd=0.5,col='gray')
abline(v=1650,lty=2,lwd=0.5,col='gray')
abline(v=1700,lty=2,lwd=0.5,col='gray')
abline(v=1750,lty=2,lwd=0.5,col='gray')
abline(v=1800,lty=2,lwd=0.5,col='gray')
abline(v=1850,lty=2,lwd=0.5,col='gray')
abline(v=1900,lty=2,lwd=0.5,col='gray')
abline(v=1950,lty=2,lwd=0.5,col='gray')
abline(v=2000,lty=2,lwd=0.5,col='gray')

legend(1730,0.85,bty='n',
       legend = c('Reconstruction of temperature anaomaly','10-yr low pass filter',
                  '50-yr low pass filter','Mean temperature (1400-1600)'),
       col=c('gray60','blue','red','black'),lwd=c(1,2,4,1),lty = c(1,1,1,2))







