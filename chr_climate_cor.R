Path="D:/density_climate"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','',FileName)

for (i in 1:11) 
{
  assign(n[i], read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

climate=merge(`MXD_original+IMF23_recon`,temp_2yr)             #merge(chronology,climate data)

t=matrix(0,nrow = 24,ncol = 3)
colnames(t)=c('Month','r','p')
t[,1]=1:24

for (i in 1:24) 
{
  cor=cor.test(climate[,2],climate[,i+2])
  t[i,2]=cor$estimate
  t[i,3]=cor$p.value
}


a=12+2
b=10+2+12
  
cor.test(climate$recon,rowSums(climate[,a:b]))

barplot(t[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1)
abline(h=0.262,lty=2)
abline(h=0)

write.csv(t,'MND&RH_cor.csv',row.names = F,quote = F)        #change filename


#plot


Path="D:/density_climate/climate_cor"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','',FileName)
n=gsub('&','',n)

for (i in 1:7) 
{
  assign(n[i], read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


par(mfrow=c(3,1),mar=c(4,6,1,1))
barplot(RDtemp_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,cex.axis=1.2, cex.names = 1.2)
abline(h=0.265,lty=2)
abline(h=0)
text(0,0.38,'RD',cex=2)
barplot(MXDtemp_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,cex.axis=1.2, cex.names = 1.2)
abline(h=0.265,lty=2)
abline(h=0)
text(0,0.38,'MXD',cex=2)
barplot(MNDtemp_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,ylim = c(-0.05,0.45),
        cex.axis=1.2, cex.names = 1.2,)
abline(h=0.265,lty=2)
abline(h=0)
text(0,0.38,'MND',cex=2)
par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Correaction coefficient',2)
mtext('Month',1)

par(mfrow=c(3,1),mar=c(4,6,1,1))
barplot(RDRH_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,cex.axis=1.2, cex.names = 1.2,
        ylim = c(-0.45,0.15))
abline(h=-0.26,lty=2)
abline(h=0)
text(0,0.1,'RD',cex=2)
barplot(MXDRH_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,cex.axis=1.2, cex.names = 1.2,
        ylim = c(-0.45,0.15))
abline(h=-0.26,lty=2)
abline(h=0)
text(0,0.1,'MXD',cex=2)
barplot(MNDRH_cor[,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,ylim = c(-0.45,0.15),
        cex.axis=1.2, cex.names = 1.2,)
abline(h=-0.26,lty=2)
abline(h=0)
text(0,0.1,'MND',cex=2)
par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Correaction coefficient',2)
mtext('Month',1)


barplot(`mxd+IMF23_temp_cor`[1:24,2],names.arg = `mxd+IMF23_temp_cor`[1:24,1],las=1,
        ylab = 'Correaction coefficient', xlab = 'Month')
abline(h=0.265,lty=2)
abline(h=0)


