library(astrochron)

temp=cbind(year=RD_imfs$year,chr=RD_imfs$original)
output=mtm(temp,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

temp2=cbind(year=MXD_imfs$year,chr=MXD_imfs$original)
output2=mtm(temp2,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

temp3=cbind(year=MND_imfs$year,chr=MND_imfs$orignal)
output3=mtm(temp3,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

par(mfrow=c(3,1),mar=c(4,5,1,1))

plot(output[,1],log10(output[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.5)
text(-0.01,-4.7,'(a)',cex=1.5)
lines(output[,1],log10(output[,7]),lty=2,col='red')  #95%C.I.
lines(output[,1],log10(output[,8]),lty=2,col='blue')  #99%C.I.
#text(0.51,-4.35,'99%',col='red')
#text(0.51,-4.45,'95%',col='red')
plot(output2[,1],log10(output2[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.5)
text(-0.01,-4.7,'(b)',cex=1.5)
lines(output2[,1],log10(output2[,7]),lty=2,col='red')  #95%C.I.
lines(output2[,1],log10(output2[,8]),lty=2,col='blue')  #99%C.I.

plot(output3[,1],log10(output3[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.5)
text(-0.01,-4.7,'(c)',cex=1.5)
lines(output3[,1],log10(output3[,7]),lty=2,col='red')  #95%C.I.
lines(output3[,1],log10(output3[,8]),lty=2,col='blue')

par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Frequency',1,cex = 1.2)
mtext('Power (log)',2,cex = 1.2)

write.csv(output,'RD_mtm.csv',row.names = F,quote = F)
write.csv(output3,'MND_mtm3.csv',row.names = F,quote = F)




#MXD23&temp mtm
temp2=cbind(year=MXD_com$year,chr=MXD_pred)
output2=mtm(temp2,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

temp3=cbind(year=MXD_temp$year,temp=MXD_temp$jun.Oct)
output3=mtm(temp3,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)



par(mfrow=c(2,1),mar=c(3,4,0.5,1))


plot(output2[,1],log10(output2[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.2)
text(-0.01,-2.6,'(a)',cex=1.5)
lines(output2[,1],log10(output2[,7]),lty=2,col='red')  #95%C.I.
lines(output2[,1],log10(output2[,8]),lty=2,col='blue')  #99%C.I.

plot(output3[,1],log10(output3[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.2)
text(-0.01,-1.95,'  (b)',cex=1.5)
lines(output3[,1],log10(output3[,7]),lty=2,col='red')  #95%C.I.
lines(output3[,1],log10(output3[,8]),lty=2,col='blue')

par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Frequency (cycle/year)',1,cex = 1.2)
mtext('Power (log)',2,cex = 1.2)


#############################################################

temp=RW_nodetrend
output=mtm(temp,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

temp2=cbind(year=MXD_imfs$year,chr=MXD_imfs$original)
output2=mtm(temp2,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

par(mfrow=c(2,1),mar=c(3,5,0.5,1))

plot(output[,1],log10(output[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.5)
text(-0.01,-3.5,'(a)',cex=1.5)
lines(output[,1],log10(output[,7]),lty=2,col='red')  #95%C.I.
lines(output[,1],log10(output[,8]),lty=2,col='blue')  #99%C.I.


plot(output2[,1],log10(output2[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.5)
text(-0.01,-4.7,'(b)',cex=1.5)
lines(output2[,1],log10(output2[,7]),lty=2,col='red')  #95%C.I.
lines(output2[,1],log10(output2[,8]),lty=2,col='blue')  #99%C.I.


par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Frequency (cycle/year)',1,cex = 1.2)
mtext('Power (log)',2,cex = 1.2)




