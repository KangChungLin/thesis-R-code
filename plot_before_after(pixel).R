Path="D:/density_sort/pixel/before_r"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n1=gsub('.csv','_before',FileName)

for (i in 1:16) 
{
  assign(n1[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}


Path="D:/density_sort/pixel/after_r"
FilePath <- paste(Path, FileName, sep="/")
n2=gsub('.csv','_after',FileName)

for (i in 1:16) 
{
  assign(n2[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}


CIL71B_before=CIL71B_before[-(1:114),]
CIL71B_before[,1]=CIL71B_before[,1]-114
which(CIL71B_before[,3]==1958)
CIL71B_before=CIL71B_before[-(22605:23148),]

CIL80C_before=CIL80C_before[-(1:284),]
CIL80C_before[,1]=CIL80C_before[,1]-284
which(CIL80C_after[,3]==1887)
CIL80C_after=CIL80C_after[-(28224:30118),]

CIL89A_before=CIL89A_before[-(1:202),]
CIL89A_before[,1]=CIL89A_before[,1]-202

CIL63A_after=CIL63A_after[-(1:584),]
CIL63A_after[,1]=CIL63A_after[,1]-584



for (i in 1:16) 
{
  tiff(gsub('.csv','.tif',FileName[i]),width = 1200,height = 600)
  
  plot(get(n1[i])[,1],get(n1[i])[,2],type = 'l',main = gsub('.csv',' (pixel)',FileName[i]),
     xlab = 'Pixel',ylab = 'Density',las=1,ylim = c(0.55,1.15),cex.main=1.5,cex.lab=1.2,col='red')

  lines(get(n2[i])[,1],get(n2[i])[,2],col='blue')
  
  dev.off()
}


i=9

tiff(gsub('.csv','.tif',FileName[i]),width = 1200,height = 600)

plot(get(n1[i])[,1],get(n1[i])[,2],type = 'l',main = gsub('.csv',' (pixel)',FileName[i]),
     xlab = 'Pixel',ylab = 'Density',las=1,ylim = c(0.55,1.15),cex.main=1.5,cex.lab=1.2,col='red')

lines(get(n2[i])[,1],get(n2[i])[,2],col='blue')

dev.off()












