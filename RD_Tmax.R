plot(MXD_temp$jun.Oct,temp_new$value)
cor.test(MXD_temp$jun.Oct,temp_new$value)
cor.test(predict(lm.fit),temp_new$value)
cor.test(predict(lm.fit),MXD_temp$jun.Oct)
cor.test(MXD_temp$IMF1.8,temp_new$value)

temp=rowSums(temp_2yr[,7:22])
cor.test(MXD_temp$IMF1.8,temp)
############################################################

RD_Tmax=merge(RD_new,Tmax_new)
RD_Tmax=RD_Tmax[1:106,]
t=RD_Tmax[,-1]

temp.lm1=lm(tmax~1,t, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(tmax~.,t, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)

t1=t[1:53,]
t2=t[54:106,]

lm1.fit=lm(tmax~IMF1.8+IMF.6+IMF.9,t1)
lm2.fit=lm(tmax~IMF1.8+IMF.6+IMF.9,t2)

summary(lm1.fit)
summary(lm2.fit)

pv1=(t2$tmax-predict(lm1.fit,t2))^2
pc1=(t2$tmax-mean(t1$tmax))^2
re1=1-(sum(pv1)/sum(pc1))
pvm1=(t2$tmax-mean(t2$tmax))^2
ce1=1-sum(pv1)/sum(pvm1)

pv2=(t1$tmax-predict(lm2.fit,t1))^2
pc2=(t1$tmax-mean(t2$tmax))^2
re2=1-(sum(pv2)/sum(pc2))
pvm2=(t1$tmax-mean(t1$tmax))^2
ce2=1-sum(pv2)/sum(pvm2)




temp.lm1=lm(tmax~IMF1.8,t, na.action = na.exclude)
summary(temp.lm1)
full = formula(lm(tmax~.,t, na.action = na.exclude))

step(temp.lm1,direction='both',scope=full)
