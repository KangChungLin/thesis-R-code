MXD_temp=MXD_temp[,-1]
temp.lm1=lm(jun.Oct~1,MXD_temp, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(jun.Oct~.,MXD_temp, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)

t1=MXD_temp[1:28,]
t2=MXD_temp[29:56,]

lm.fit=lm(jun.Oct~IMF1.8+IMF23,MXD_temp)
summary(lm.fit)
mxd.prd=predict(lm.fit)
mxd_new=cbind(1951:2006,mxd.prd)
write.csv(mxd_new,'mxd_new.csv')

tt=temp_2yr[-1,]
tt=tt[-1,]
cor.test(mxd.prd[1:55],tt[,25])


lm1.fit=lm(jun.Oct~IMF1.8+IMF23,t1)
lm2.fit=lm(jun.Oct~IMF1.8+IMF23,t2)
summary(lm1.fit)
summary(lm2.fit)
car::dwt(lm1.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm1.fit)
#passed 

#normality test
shapiro.test(lm1.fit$resid)

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
#####################################

lm.fit
acf(lm.fit$fitted.values)
pacf(lm.fit$fitted.values)
#########################################################

chr_prd=predict(lm.fit,MXD_chr)
plot(MXD_chr[294:1102,1],chr_prd[294:1102]-15,type = 'l',col='gray80')
chr.11pass=pass.filt(chr_prd[294:1102]-15,W=11,type = 'low')
lines(MXD_chr[294:1102,1],chr.11pass)
abline(h=0,lty=2)

#######################################################
library(boot)
library(meboot)

mxd.meb=meboot(MXD_pred)
mxd.mat=cbind(MXD_pred,mxd.meb$ensemble)
mxd.mat=t(mxd.mat)
mxd.env=envelope(mat=mxd.mat)

chr.10pass=pass.filt(MXD_pred[294:1102]-14.9,W=10,type = 'low')
chr.10pass1=pass.filt(mxd.env$point[1,294:1102]-15,W=10,type = 'low')
chr.10pass2=pass.filt(mxd.env$point[2,294:1102]-15,W=10,type = 'low')

temp=data.frame(year=MXD_com[294:1102,1],lower=mxd.env$point[2,294:1102]-15,
                recon=MXD_pred[294:1102]-15,
                upper=mxd.env$point[1,294:1102]-15)
temp$incl=as.numeric(sign(temp$lower*temp$upper))

plot(MXD_com[294:1102,1],MXD_pred[294:1102]-14.87,type = 'l',col='black',las=1,xlab = 'Year',
     ylab =expression( paste('Jun(-)-Oct temperature anomaly','  (',degree,C,')'))) 
#1961-1990 mean=14.74
#1400-1600 mean=14.87
#1200-2006 mean=14.84
#IMF1-10+IMF23 RMSE=0.2617
#lines(MXD_com[294:1102,1],MXD_pred[294:1102]-15,col='red',lty=2)
#lines(MXD_com[294:1102,1],MXD_pred[294:1102]-15,col='red',lty=2)
abline(h=0,lty=4)
abline(h=0.2617,lty=2)
abline(h=-0.2617,lty=2)
abline(h=0.2617*2,lty=3)
abline(h=-0.2617*2,lty=3)
lines(MXD_chr[294:1102,1],chr.10pass,col='blue',lwd=2)
#lines(MXD_chr[294:1102,1],chr.10pass,col='blue',lwd=2)
#lines(MXD_chr[294:1102,1],chr.10pass,col='blue',lwd=2)
chr.pass=pass.filt(chr_prd[294:1102]-15,W=50,type = 'low')
lines(MXD_chr[294:1102,1],chr.pass,col='red',lwd=4)
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


legend(1730,0.8,bty='n',
       legend = c('Reconstruction of temperature anaomaly','10-yr low pass filter',
                  '50-yr low pass filter','Mean temperature (1200-2006)'),
       col=c('gray60','blue','red','black'),lwd=c(1,2,4,1),lty = c(1,1,1,2))

###############################################################

chr.10pass=pass.filt(chr_prd[294:1102]-15,W=10,type = 'low')
chr.10pass1=pass.filt(mxd.env$point[1,294:1102]-15,W=10,type = 'low')
chr.10pass2=pass.filt(mxd.env$point[2,294:1102]-15,W=10,type = 'low')


plot(MXD_chr[294:1102,1],chr_prd[294:1102]-15,type = 'l',col='gray85',las=1,lwd=0.5,xlab = 'Year',
     ylab =expression( paste('Jun(-)-Oct temperature anomaly','  (',degree,C,')')))
abline(h=0,lty=2)
lines(MXD_com[294:1102,1],chr.10pass,col='red',lwd=2)
lines(MXD_chr[294:1102,1],chr.10pass1,col='blue',lwd=1,lty=2)
lines(MXD_chr[294:1102,1],chr.10pass2,col='blue',lwd=1,lty=2)
legend(1800,0.8,bty = 'n',legend = c('10-yr low pass filter','95% C.I.'),col = c('blue4','blue'),
       lty = c(1,2),lwd = c(2,1))


chr.50pass=pass.filt(MXD_pred[294:1102]-14.87,W=50,type = 'low')
chr.50pass1=pass.filt(mxd.env$point[1,294:1102]-15,W=50,type = 'low')
chr.50pass2=pass.filt(mxd.env$point[2,294:1102]-15,W=50,type = 'low')


plot(MXD_chr[294:1102,1],chr_prd[294:1102]-15,type = 'l',col='gray90',las=1,xlab = 'Year',
     ylab =expression( paste('Jun(-)-Oct temperature anomaly','  (',degree,C,')')))
abline(h=0,lty=2)
lines(MXD_com[294:1102,1],chr.50pass,col='blue4',lwd=2)
lines(MXD_chr[294:1102,1],chr.50pass1,col='blue',lwd=1,lty=2)
lines(MXD_chr[294:1102,1],chr.50pass2,col='blue',lwd=1,lty=2)

#############################################################

chr.100pass=pass.filt(chr_prd[294:1102]-15,W=100,type = 'low')
lines(MXD_chr[294:1102,1],chr.100pass,col='red')
length(MXD_chr[294:1102,1])
mean(chr_prd[494:694])
lm1.fit=lm(jun.Oct~IMF1.8+IMF23,t1)
lm2.fit=lm(jun.Oct~IMF1.8+IMF23,t2)
summary(lm1.fit)
summary(lm2.fit)

car::dwt(lm2.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm2.fit)
#passed 

#normality test
shapiro.test(lm2.fit$resid)


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

plot(1950:2006,MXD_temp$jun.Oct,type = 'l',lwd=2,col='blue',las=1,xlab = "Year",
     ylab='Mar(-)-Jun mean temperature')
lines(1950:2006,predict(lm.fit),lwd=2,col='red')

################################################################
plot(`MXD_imfs1~2`[894:1100,1],`MXD_imfs1~2`[894:1100,2],type = 'l',col='gray60',las=1)
mxd_5pass=pass.filt(`MXD_imfs1~2`[894:1100,2],5,type = 'low')
lines(`MXD_imfs1~2`[894:1100,1],mxd_5pass,lwd=2)
s=sunspot[,2]-mean(sunspot[,2])
s=s/sd(s)
s=s/100
lines(sunspot[,1],s,col='red',lwd=2)

cor(mxd_5pass,sunspot[52:208,2])






temp2=data.frame(temp,lowp=chr.50pass)
temp2$incl=0
temp2$inc=NULL
temp2$incl[temp2$lowp<temp2$lower | temp2$lowp>temp2$upper]=1

mean(MXD_pred[MXD_com$year>1199 & MXD_com$year<2007])
