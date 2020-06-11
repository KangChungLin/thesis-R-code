rh=rowSums(`850mb.relative.humidity`[,2:8])
rh=cbind(`850mb.relative.humidity`[,1],rh)
colnames(rh)=c('year','RH')
mnd_rh=merge(`MND_imfs1~5`,rh)
cor.test(mnd_rh[1:30,2],mnd_rh[1:30,3])

rh.eemd=eemd(rh[,2],ensemble_size = 5000L,noise_strength = 0.1)
rh.detrend=rh
rh.detrend[,2]=rowSums(rh.eemd[,1:4])
mnd_rhd=merge(`MND_imfs1~5`,rh.detrend)
cor.test(mnd_rhd[1:59,2],mnd_rhd[1:59,3])

temp=rowSums(`850mb.temp_2yr`[,7:23])
temp=cbind(`850mb.temp_2yr`[,1],temp)
colnames(temp)=c('year','temp')
mxd_temp=merge(`MXD_imfs1~8`,temp)
cor.test(mxd_temp[2:58,2],mxd_temp[2:58,3])
mxd_temp.lm=lm(mxd_temp[2:58,3]~mxd_temp[2:58,2])
plot(mxd_temp[2:58,1],mxd_temp[2:58,3]/17,type = 'l',col='blue',xlab = 'Year',
     ylab = 'Jun(-)-Oct average temperature',lwd=2)
lines(mxd_temp[2:58,1],predict(mxd_temp.lm)/17,col='red',lwd=2)

t=mxd_temp[2:58,]
t1=mxd_temp[2:29,]
t2=mxd_temp[30:58,]

lm.fit=lm(temp~value,t)

car::dwt(lm.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm.fit)
#passed 

#normality test
shapiro.test(lm.fit$resid)

summary(lm.fit)
lm1.fit=lm(temp~value,t1)
lm2.fit=lm(temp~value,t2)
summary(lm1.fit)
summary(lm2.fit)


pv1=(t2$temp-predict(lm1.fit,t2))^2
pc1=(t2$temp-mean(t1$temp))^2
re1=1-(sum(pv1)/sum(pc1))
pvm1=(t2$temp-mean(t2$temp))^2
ce1=1-sum(pv1)/sum(pvm1)

pv2=(t1$temp-predict(lm2.fit,t1))^2
pc2=(t1$temp-mean(t2$temp))^2
re2=1-(sum(pv2)/sum(pc2))
pvm2=(t1$temp-mean(t1$temp))^2
ce2=1-sum(pv2)/sum(pvm2)

########################
#MND&RH

rh=rowSums(rh_2yr[,12:20])
rh=cbind(rh_2yr[,1],rh)
colnames(rh)=c('year','RH')
mnd_rh=merge(`MND_imfs1~5`,rh)
cor.test(mnd_rh[1:58,2],mnd_rh[1:58,3])

t=mnd_rh[1:58,]
t1=mnd_rh[1:29,]
t2=mnd_rh[30:58,]


lm.fit=lm(RH~value,t)
summary(lm.fit)
lm1.fit=lm(RH~value,t1)
sse1=anova(lm1.fit)[2,2]
lm2.fit=lm(RH~value,t2)
summary(lm1.fit)
summary(lm2.fit)
cor(t1[,2],t1[,3])
cor(t[-train,2],t[-train,3])

pv=(t2$RH-predict(lm1.fit,t2))^2
pc=(t2$RH-mean(t1$RH))^2
pvm=(t2$RH-mean(t2$RH))^2
re=1-(sum(pv)/sum(pc))
ce=1-(sum(pv)/sum(pvm))

pv=(t1$RH-predict(lm2.fit,t1))^2
pc=(t1$RH-mean(t2$RH))^2
pvm=(t1$RH-mean(t1$RH))^2
ce=1-(sum(pv)/sum(pvm))
#######################################
#RD&Tmax

tmax=rowSums(Tmax[,2:10])
tmax=cbind(Tmax[,1],tmax)
colnames(tmax)=c('year','Tmax')
rd_tmax=merge(`RD_imfs1~8`,tmax)
rd_tmax=rd_tmax[1:106,]
cor.test(rd_tmax[,2],rd_tmax[,3])

t=data.frame(rd_tmax)
t1=data.frame(rd_tmax[1:53,])
t2=data.frame(rd_tmax[54:106,])


lm.fit=lm(Tmax~value,t)
summary(lm.fit)
lm1.fit=lm(Tmax~value,t1)
lm2.fit=lm(Tmax~value,t2)
summary(lm1.fit)
summary(lm2.fit)


pv=(t2$Tmax-predict(lm1.fit,t2))^2
pc=(t2$Tmax-mean(t1$Tmax))^2
pvm=(t2$Tmax-mean(t2$Tmax))^2
re=1-(sum(pv)/sum(pc))
ce=1-(sum(pv)/sum(pvm))

pv=(t1$Tmax-predict(lm2.fit,t1))^2
pc=(t1$Tmax-mean(t2$Tmax))^2
pvm=(t1$Tmax-mean(t1$Tmax))^2
re=1-(sum(pv)/sum(pc))
ce=1-(sum(pv)/sum(pvm))










