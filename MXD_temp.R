MXD_temp=MXD_temp[,-1]
temp.lm1=lm(mar.Jun~IMF1.8,MXD_temp, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(mar.Jun~.,MXD_temp, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)

temp.lm2=lm(mar.Jun~IMF1.8+IMF.2+IMF.3,MXD_temp, na.action = na.exclude)
summary(temp.lm2)
round(cor(MXD_temp),3)
AIC(temp.lm1)
AIC(temp.lm2)
temp.lm3=lm(mar.Jun~IMF1.8+IMF.2,MXD_temp, na.action = na.exclude)
AIC(temp.lm3)
BIC(temp.lm1)
BIC(temp.lm2)
BIC(temp.lm3)

plot(1949:2006,MXD_temp$mar.Jun,type = 'l',lwd=2,col='blue',las=1,xlab = "Year",
     ylab='Mar(-)-Jun mean temperature')
lines(1949:2006,predict(temp.lm3),lwd=2,col='red')

t=MXD_temp
t1=MXD_temp[1:29,]
t2=MXD_temp[30:58,]

lm.fit=lm(mar.Jun~IMF1.8+IMF.2+IMF.3,MXD_temp)

car::dwt(lm.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm.fit)
#passed 

#normality test
shapiro.test(lm.fit$resid)


lm1.fit=lm(mar.Jun~IMF1.8+IMF.2+IMF.3,t1)
lm2.fit=lm(mar.Jun~IMF1.8+IMF.2+IMF.3,t2)
summary(lm1.fit)
summary(lm2.fit)
summary(lm.fit)

pv1=(t2$mar.Jun-predict(lm1.fit,t2))^2
pc1=(t2$mar.Jun-mean(t1$mar.Jun))^2
pvm1=(t2$mar.Jun-mean(t2$mar.Jun))^2
re1=1-(sum(pv1)/sum(pc1))
ce1=1-(sum(pv1)/sum(pvm1))

pv2=(t1$mar.Jun-predict(lm2.fit,t1))^2
pc2=(t1$mar.Jun-mean(t2$mar.Jun))^2
pvm2=(t1$mar.Jun-mean(t1$mar.Jun))^2
re2=1-(sum(pv2)/sum(pc2))
ce2=1-(sum(pv2)/sum(pvm2))

#################################################
MXD_temp=MXD_temp[,-1]
MXD_temp=MXD_temp[-1,]
temp.lm1=lm(mar.Jun~IMF1.8,MXD_temp, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(mar.Jun~.,MXD_temp, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)


t1=MXD_temp[1:28,]
t2=MXD_temp[29:57,]

lm.fit=lm(mar.Jun~IMF1.8+IMF23,MXD_temp)
summary(lm.fit)

car::dwt(lm.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm.fit)
#passed 

#normality test
shapiro.test(lm.fit$resid)


lm1.fit=lm(mar.Jun~IMF1.8+IMF23,t1)
lm2.fit=lm(mar.Jun~IMF1.8+IMF23,t2)
summary(lm1.fit)
summary(lm2.fit)


pv1=(t2$mar.Jun-predict(lm1.fit,t2))^2
pc1=(t2$mar.Jun-mean(t1$mar.Jun))^2
pvm1=(t2$mar.Jun-mean(t2$mar.Jun))^2
re1=1-(sum(pv1)/sum(pc1))
ce1=1-(sum(pv1)/sum(pvm1))

pv2=(t1$mar.Jun-predict(lm2.fit,t1))^2
pc2=(t1$mar.Jun-mean(t2$mar.Jun))^2
pvm2=(t1$mar.Jun-mean(t1$mar.Jun))^2
re2=1-(sum(pv2)/sum(pc2))
ce2=1-(sum(pv2)/sum(pvm2))

plot(1950:2006,MXD_temp$mar.Jun,type = 'l',lwd=2,col='blue',las=1,xlab = "Year",
     ylab='Mar(-)-Jun mean temperature')
lines(1950:2006,predict(lm.fit),lwd=2,col='red')

#########################################
t1=MXD_temp[1:28,]
t2=MXD_temp[29:57,]

lm.fit=lm(mar.Jun~IMF1.8,MXD_temp)
summary(lm.fit)

car::dwt(lm.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm.fit)
#passed 

#normality test
shapiro.test(lm.fit$resid)


lm1.fit=lm(mar.Jun~IMF1.8,t1)
lm2.fit=lm(mar.Jun~IMF1.8,t2)
summary(lm1.fit)
summary(lm2.fit)


pv1=(t2$mar.Jun-predict(lm1.fit,t2))^2
pc1=(t2$mar.Jun-mean(t1$mar.Jun))^2
pvm1=(t2$mar.Jun-mean(t2$mar.Jun))^2
re1=1-(sum(pv1)/sum(pc1))
ce1=1-(sum(pv1)/sum(pvm1))

pv2=(t1$mar.Jun-predict(lm2.fit,t1))^2
pc2=(t1$mar.Jun-mean(t2$mar.Jun))^2
pvm2=(t1$mar.Jun-mean(t1$mar.Jun))^2
re2=1-(sum(pv2)/sum(pc2))
ce2=1-(sum(pv2)/sum(pvm2))







