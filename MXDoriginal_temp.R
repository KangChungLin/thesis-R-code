mxd.lm=lm(jun.Oct~MXD,MXDchr_temp)
summary(mxd.lm)

t1=MXDchr_temp[1:28,]
t2=MXDchr_temp[29:56,]


lm1.fit=lm(jun.Oct~MXD,t1)
lm2.fit=lm(jun.Oct~MXD,t2)
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