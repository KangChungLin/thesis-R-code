RD_RH=RD_RH[,-1]
RD_RH=RD_RH[-1,]
temp.lm1=lm(Jan.Jul~1,RD_RH, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(Jan.Jul~.,RD_RH, na.action = na.exclude))
step(temp.lm1,direction='both',scope=full)
lm.fit=lm(Jan.Jul~IMF1.4,RD_RH)

summary(lm.fit)

car::dwt(lm.fit,max.lag=5,simulate=T,reps=10000)
#passed; no auto correlation up to lage 5

#constant variance test
car::ncvTest(lm.fit)
#passed 

#normality test
shapiro.test(lm.fit$resid)

t1=RD_RH[2:29,]
t2=RD_RH[30:58,]


lm1.fit=lm(Jan.Jul~IMF1.4+IMF.3,t1)
lm2.fit=lm(Jan.Jul~IMF1.4+IMF.3,t2)
summary(lm1.fit)
summary(lm2.fit)


pv1=(t2$Jan.Jul-predict(lm1.fit,t2))^2
pc1=(t2$Jan.Jul-mean(t1$Jan.Jul))^2
pvm1=(t2$Jan.Jul-mean(t2$Jan.Jul))^2
re1=1-(sum(pv1)/sum(pc1))
ce1=1-(sum(pv1)/sum(pvm1))

pv2=(t1$Jan.Jul-predict(lm2.fit,t1))^2
pc2=(t1$Jan.Jul-mean(t2$Jan.Jul))^2
pvm2=(t1$Jan.Jul-mean(t1$Jan.Jul))^2
re2=1-(sum(pv2)/sum(pc2))
ce2=1-(sum(pv2)/sum(pvm2))