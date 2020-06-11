library(astrochron)
mtm(`MXD_imfs1~8`,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=2)
output=mtm(`MXD_imfs1~8`,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)
dev.off()

plot(output[,1],output[,2],type = 'l',xlab = 'Frequency',ylab = 'Power',lwd=2,las=1)
lines(output[,1],output[,6],lty=2,col='red')
lines(output[,1],output[,7],lty=2,col='red')
lines(output[,1],output[,8],lty=2,col='red')

########################################

library(astrochron)
mtm(MXD_imf23,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=2)
output=mtm(`MXD_imfs1~8`,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)
dev.off()

plot(output[,1],output[,2],type = 'l',xlab = 'Frequency',ylab = 'Power',lwd=2,las=1)
lines(output[,1],output[,6],lty=2,col='red')
lines(output[,1],output[,7],lty=2,col='red')
lines(output[,1],output[,8],lty=2,col='red')

IMF23_11low=pass.filt(MXD_imf23[,2],W=11,type = 'low')
plot(MXD_imf23[794:1102,1],IMF23_11low[794:1102],type = 'l',xlab = 'Year',ylab = "MXD_IMF23",las=1)
sun=SN_y_tot_V2.0
sun[,2]=sun[,2]-mean(sun[,2])
sun[,2]=sun[,2]/10000
lines(sun[,1],sun[,2],col='red')
legend(1900,0.023,legend = c('11-yr low pass','sunspot'),col = c('black','red'),lty=c(1,1),bty='n')

mxd1234=MXD_imf1234[MXD_imf1234$year>1699,]
mxd1234=mxd1234[mxd1234$year<2007,]
sun=SN_y_tot_V2.0[SN_y_tot_V2.0[,1]<2007,]
mxd_sun=cbind(mxd1234,ss=sun[,2])
mxd_sun=mxd_sun[,-1]
sun.lm0=lm(ss~IMF23,mxd_sun)
full = formula(lm(ss~.,mxd_sun, na.action = na.exclude))
step(sun.lm0,direction='both',scope=full)

