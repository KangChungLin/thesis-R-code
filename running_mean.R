sun=rowSums(sunspot[,2:12])
sun=cbind(sunspot[,1],sun)
plot(sun[,1],sun[,2],type = 'l',lwd=0.5,col='gray',xlab = 'Year',ylab ='Spot Number')
lines(loess.smooth(sun[,1],sun[,2],span=25/270),lwd=2)
plot(open.solar.flux[,1],open.solar.flux[,2],type = 'l',lwd=0.5,col='gray')
lines(loess.smooth(open.solar.flux[,1],open.solar.flux[,2],span=20/270),lwd=2)


library(igraph)

plot(`MND_imfs1~5`[294:1100,1],`MND_imfs1~5`[294:1100,2],type = 'l',col='gray',lwd=0.5,xlab = "Year",
     ylab = 'Value')
mnd_5yr=running_mean(`MND_imfs1~5`[294:1100,2],5)
lines(1202:2004,mnd_5yr,lwd=3)
abline(v=1638,lty=2,col='red')
abline(v=1641,lty=2,col='red')
abline(v=1756,lty=2,col='red')
abline(v=1768,lty=2,col='red')
abline(v=1790,lty=2,col='red')
abline(v=1796,lty=2,col='red')
abline(v=1876,lty=2,col='red')
abline(v=1878,lty=2,col='red')


plot(`MND_imfs1~5`[794:1100,1],`MND_imfs1~5`[794:1100,2],type = 'l',lwd=0.3,xlab = "Year",
     ylab = 'Value')
abline(v=1757,lty=2,lwd=0.5,col='red')
abline(v=1789,lty=2,lwd=0.5,col='red')
abline(v=1851,lty=2,lwd=0.5,col='red')
abline(v=1887,lty=2,lwd=0.5,col='red')
abline(v=1888,lty=2,lwd=0.5,col='red')
abline(v=1910,lty=2,lwd=0.5,col='red')
abline(v=1933,lty=2,lwd=0.5,col='red')
abline(v=1952,lty=2,lwd=0.5,col='red')
abline(v=1963,lty=2,lwd=0.5,col='red')
abline(v=1977,lty=2,lwd=0.5,col='red')
abline(v=1988,lty=2,lwd=0.5,col='red')
abline(v=2002,lty=2,lwd=0.5,col='red')

plot(`RD_imfs1~5`[294:1100,1],`RD_imfs1~5`[294:1100,2],type = 'l',lwd=0.5, col='gray')
rd_5yr=running_mean(`RD_imfs1~5`[294:1100,2],5)
lines(1202:2004,rd_5yr,lwd=3)
abline(v=1638,lty=2,col='red')
abline(v=1641,lty=2,col='red')
abline(v=1756,lty=2,col='red')
abline(v=1768,lty=2,col='red')
abline(v=1790,lty=2,col='red')
abline(v=1796,lty=2,col='red')
abline(v=1876,lty=2,col='red')
abline(v=1878,lty=2,col='red')


plot(`MXD_imfs1~5`[294:1100,1],`MXD_imfs1~5`[294:1100,2],type = 'l',lwd=0.5, col='gray')
#mxd_5yr=running_mean(`MXD_imfs1~5`[294:1100,2],5)
#lines(1202:2004,mxd_5yr,lwd=3)
mxd_25yr=running_mean(`MXD_imfs1~5`[294:1100,2],25)
lines(1212:1994,mxd_25yr,lwd=3)
mxd_51yr=running_mean(`MXD_imfs1~5`[294:1100,2],51)
lines(1225:1981,mxd_51yr,lwd=3)
abline(v=1638,lty=2,col='red')
abline(v=1641,lty=2,col='red')
abline(v=1756,lty=2,col='red')
abline(v=1768,lty=2,col='red')
abline(v=1790,lty=2,col='red')
abline(v=1796,lty=2,col='red')
abline(v=1876,lty=2,col='red')
abline(v=1878,lty=2,col='red')



for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'.tiff'),width = 1200,height = 600)
  plot(MXD_imfs[,1],MXD_imfs[,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}


for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'_1200-2006.tiff'),width = 1200,height = 600)
  plot(MXD_imfs[294:1100,1],MXD_imfs[294:1100,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}




for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'.tiff'),width = 1200,height = 600)
  plot(RD_imfs[,1],RD_imfs[,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}


for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'_1200-2006.tiff'),width = 1200,height = 600)
  plot(RD_imfs[294:1100,1],RD_imfs[294:1100,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}

for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'.tiff'),width = 1200,height = 600)
  plot(MND_imfs[,1],MND_imfs[,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}


for (i in 1:10) 
{
  tiff(filename = paste0('IMF',i,'_1200-2006.tiff'),width = 1200,height = 600)
  plot(MND_imfs[294:1100,1],MND_imfs[294:1100,i+1],type = 'l',xlab = 'Year',ylab = 'Value')
  dev.off()
}

for (i in 5:9) 
{
  tiff(filename = paste0('IMF1-',i,'_5yr.tif'),width = 1200,height = 600)
  plot(MXD_imfs[294:1100,1],rowSums(MXD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  mxd_5yr=running_mean(rowSums(MXD_imfs[294:1100,2:(i+1)]),5)
  lines(1202:2004,mxd_5yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_11yr.tif'),width = 1200,height = 600)
  plot(MXD_imfs[294:1100,1],rowSums(MXD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  mxd_11yr=running_mean(rowSums(MXD_imfs[294:1100,2:(i+1)]),11)
  lines(1205:2001,mxd_11yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_25yr.tif'),width = 1200,height = 600)
  plot(MXD_imfs[294:1100,1],rowSums(MXD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  mxd_25yr=running_mean(rowSums(MXD_imfs[294:1100,2:(i+1)]),25)
  lines(1212:1994,mxd_25yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_51yr.tif'),width = 1200,height = 600)
  plot(MXD_imfs[294:1100,1],rowSums(MXD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  mxd_51yr=running_mean(rowSums(MXD_imfs[294:1100,2:(i+1)]),51)
  lines(1225:1981,mxd_51yr,lwd=3)
  dev.off()
}


for (i in 5:9) 
{
  tiff(filename = paste0('IMF1-',i,'_5yr.tif'),width = 1200,height = 600)
  plot(RD_imfs[294:1100,1],rowSums(RD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  RD_5yr=running_mean(rowSums(RD_imfs[294:1100,2:(i+1)]),5)
  lines(1202:2004,RD_5yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_11yr.tif'),width = 1200,height = 600)
  plot(RD_imfs[294:1100,1],rowSums(RD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  RD_11yr=running_mean(rowSums(RD_imfs[294:1100,2:(i+1)]),11)
  lines(1205:2001,RD_11yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_25yr.tif'),width = 1200,height = 600)
  plot(RD_imfs[294:1100,1],rowSums(RD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  RD_25yr=running_mean(rowSums(RD_imfs[294:1100,2:(i+1)]),25)
  lines(1212:1994,RD_25yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_51yr.tif'),width = 1200,height = 600)
  plot(RD_imfs[294:1100,1],rowSums(RD_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  RD_51yr=running_mean(rowSums(RD_imfs[294:1100,2:(i+1)]),51)
  lines(1225:1981,RD_51yr,lwd=3)
  dev.off()
}


for (i in 5:9) 
{
  tiff(filename = paste0('IMF1-',i,'_5yr.tif'),width = 1200,height = 600)
  plot(MND_imfs[294:1100,1],rowSums(MND_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  MND_5yr=running_mean(rowSums(MND_imfs[294:1100,2:(i+1)]),5)
  lines(1202:2004,MND_5yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_11yr.tif'),width = 1200,height = 600)
  plot(MND_imfs[294:1100,1],rowSums(MND_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  MND_11yr=running_mean(rowSums(MND_imfs[294:1100,2:(i+1)]),11)
  lines(1205:2001,MND_11yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_25yr.tif'),width = 1200,height = 600)
  plot(MND_imfs[294:1100,1],rowSums(MND_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  MND_25yr=running_mean(rowSums(MND_imfs[294:1100,2:(i+1)]),25)
  lines(1212:1994,MND_25yr,lwd=3)
  dev.off()
  
  tiff(filename = paste0('IMF1-',i,'_51yr.tif'),width = 1200,height = 600)
  plot(MND_imfs[294:1100,1],rowSums(MND_imfs[294:1100,2:(i+1)]),type = 'l',lwd=0.5, col='gray',xlab = 'Year',
       ylab = 'Value')
  MND_51yr=running_mean(rowSums(MND_imfs[294:1100,2:(i+1)]),51)
  lines(1225:1981,MND_51yr,lwd=3)
  dev.off()
}





