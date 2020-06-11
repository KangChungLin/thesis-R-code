cor(`RW_imfs1~9`[,2],`RD_imfs1~9`[,2])
cor.test(`RW_imfs1~9`[,2],`MND_imfs1~9`[,2])
cor(`RW_imfs1~9`[300:1102,2],`LW_imfs1~9`[300:1102,2])
cor(`EW_imfs1~9`[300:1102,2],`RW_imfs1~9`[300:1102,2])
sd(`EW_imfs1~9`[,2])
sd(`LW_imfs1~9`[,2])


ew_imfs=eemd(ewlw[,2],ensemble_size = 1000L)
lw_imfs=eemd(ewlw[,3],ensemble_size = 1000L)

write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)

year=EW_imfs[,1]

for (i in 4:10) 
{
  value=rowSums(LW_imfs[,2:i])
  value=cbind(year,value)
  write.csv(value,paste0('LW_imfs1~',i-1,'.csv'),quote = F,row.names = F)
}


temp=CIL50final
temp[which(!is.na(temp[,2])),2]
which(!is.na(temp[,2]))
a=eemd(temp[which(!is.na(temp[,2])),2],ensemble_size = 1000L)
dim(a)[2]
a[,dim(a)[2]]

for (i in 2:51) 
{
  a=eemd(temp[which(!is.na(temp[,i])),i],ensemble_size = 1000L)
  temp[which(!is.na(temp[,i])),i]=temp[which(!is.na(temp[,i])),i]-a[,dim(a)[2]]
}


write.csv(temp,'CILWW.csv',quote = F,row.names = F)



ww_imfs=eemd(ChrWW[,2],ensemble_size = 1000L)
write.csv(ww_imfs,'WW_imfs.csv',quote = F,row.names = F)
year=temp[,1]

for (i in 4:10) 
{
  value=rowSums(WW_imfs[,2:i])
  value=cbind(year,value)
  write.csv(value,paste0('WW_imfs1~',i-1,'.csv'),quote = F,row.names = F)
}


t=cbind(Tmin[,1],rowSums(Tmin[,2:4]))
colnames(t)=c('year','Tmin')
result=merge(`RW_imfs1~9`,t)
tmin.lm=lm(Tmin~value,data = result)
anova(tmin.lm)
cor.test(result$value,result$Tmin)
tmin.pred=predict(tmin.lm)
plot(result$year,result$Tmin,type = 'l',col='blue')
lines(result$year,tmin.pred,col='red')



result2=result[50:108,]
tmin.lm2=lm(Tmin~value,data = result2)
anova(tmin.lm2)
cor.test(result2$value,result2$Tmin)
tmin2.pred=predict(tmin.lm2)
plot(result2$year,result2$Tmin,type = 'l',col='blue')
lines(result2$year,tmin2.pred,col='red')

plot(result2$value,result2$Tmin,type = 'p',col='blue')
points(result$value[1:50],result$Tmin[1:50],col='red')

tmean=eemd(TmeanSJ$V2,ensemble_size = 1000L)
write.csv(tmean,'TmeanSJ_eemd.csv',,quote = F,row.names = F)
detrend=rowSums(TmeanSJ_eemd[,2:6])
plot(TmeanSJ_eemd$year,TmeanSJ_eemd$Residual,type = 'l')
plot(TmeanSJ_eemd$year,detrend,type = 'l')
scatter.smooth(TmeanSJ_eemd$year,detrend)
plot(loess.smooth(TmeanSJ_eemd$year,detrend,span = 1/10),type = 'l')

plot(TmeanSJ$V1,TmeanSJ$V2,col='red',type = 'l',lwd=2)
lines(`RW_imfs1~9`[996:1102,1],(`RW_imfs1~9`[996:1102,2])*15+80,col='blue',lwd=2)
lines(`RW_imfs1~9`[1052:1102,1],(`RW_imfs1~9`[1052:1102,2])*15+80,col='blue',lwd=2)
lines((`RW_imfs1~9`[996:1051,1])-1,(`RW_imfs1~9`[996:1051,2])*15+80,col='blue',lwd=2)
cor.test(`RW_imfs1~9`[1007:1051,2],TmeanSJ[11:55,2])
plot(`RW_imfs1~9`[1007:1051,2],TmeanSJ[11:55,2])

plot(rw_residuals[,1],rw_residuals[,2]-rw_residuals[994,2],type = 'l',xlim = c(1900,2010),ylim =c(-0.25,0.25))
for (i in 3:51) 
{
  lines(rw_residuals[,1],rw_residuals[,i]-rw_residuals[994,i])
}


cor.test(RW_nodetrend[1016:1101,2],TmeanSJ[21:106,2])

plot(TmeanSJ$V1,TmeanSJ$V2,col='red',type = 'l',lwd=2)
lines(RW_nodetrend[996:1102,1],(RW_nodetrend[996:1102,2])*15+80,col='blue',lwd=2)


colnames(TmeanSJ)=c('year','Tmean')
a=merge(`RW_imfs1~9`,TmeanSJ)
a.lm=lm(Tmean~value,data = a)
anova(a.lm)
cor.test(a$value,a$Tmean)

b=a[54:106,]
b.lm=lm(Tmean~value,data = b)
anova(b.lm)
cor.test(b$value,b$Tmean)
ab.pred=predict(b.lm,newdata=a)


plot(a$year,a$Tmean,type = 'l',lwd=2, col='blue',main = 'Observed & Predicted', xlab = 'Year',ylab = 'Temperature')
lines(a$year,ab.pred,col='red',lwd=2)
abline(v=1954.5,lty=2,col='darkgray',lwd=2)
legend(1995,77,legend = c('Observed','predictrd'),col = c('blue','red'),bty = 'n',lty = c(1,1),lwd = c(2,2))


plot(`MXD_imfs1~9`[1052:1102,1],`MXD_imfs1~9`[1052:1102,2],type = 'l',col='darkgray')
lines(loess.smooth(`MXD_imfs1~9`[1052:1102,1],`MXD_imfs1~9`[1052:1102,2],span = 1/7),col='blue',lwd=2)

plot(`MXD_imfs1~9`[994:1102,1],`MXD_imfs1~9`[994:1102,2],type = 'l',col='darkgray')
lines(loess.smooth(`MXD_imfs1~9`[994:1102,1],`MXD_imfs1~9`[994:1102,2],span = 1/7),col='blue',lwd=2)

hua_Tmean=cbind(Huanshan_Tmean[,1],rowSums(Huanshan_Tmean[,5:10]))
colnames(hua_Tmean)=c('year','Tmean')
hua_mxd=merge(`MXD_imfs1~9`,hua_Tmean)
cor.test(hua_mxd$value,hua_mxd$Tmean)
hua_mxd.lm=lm(Tmean~value,hua_mxd)
plot(hua_mxd$year,hua_mxd$Tmean,type = 'l',col='blue',lwd=2,xlab = 'Year',ylab = 'Temperature')
lines(hua_mxd$year,predict(hua_mxd.lm),col='red',lwd=2)

pre=Pre[,4]
pre=cbind(Pre[,1],pre)
colnames(pre)=c('year','Pre')
mnd_pre=merge(`MND_imfs1~9`,pre)
cor.test(mnd_pre$value,mnd_pre$Pre)
mnd_pre.lm=lm(Pre~value,mnd_pre)
plot(mnd_pre$year,mnd_pre$Pre,type = 'l',col='blue',lwd=2,xlab = 'Year',ylab = 'Precipitation')
lines(mnd_pre$year,predict(mnd_pre.lm),col='red',lwd=2)
legend(1990,300,legend = c('Observed','estimated'),col = c('blue','red'),bty = 'n',lty = c(1,1),lwd = c(2,2))

plot(mnd_pre$year,mnd_pre$Pre,type = 'l',col='blue',lwd=0.5,xlab = 'Year',ylab = 'Precipitation')
lines(loess.smooth(mnd_pre$year,mnd_pre$Pre,span = 1/10),col='darkblue',lwd=4)
lines(mnd_pre$year,predict(mnd_pre.lm),col='red',lwd=0.5)
lines(loess.smooth(mnd_pre$year,predict(mnd_pre.lm),span = 1/10),col='darkred',lwd=4)
legend(1990,300,legend = c('Observed','estimated'),col = c('darkblue','darkred'),
       bty = 'n',lty = c(1,1),lwd = c(2,2))



















