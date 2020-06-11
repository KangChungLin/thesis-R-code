Path="D:/density_sort/pixel/before_other"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n1=gsub('.csv','_before',FileName)

for (i in 1:24) 
{
  assign(n1[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}

Path="D:/density_sort/pixel/after_other"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n2=gsub('.csv','_after',FileName)

for (i in 1:24) 
{
  assign(n2[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}


for (i in 1:24) 
{
  tiff(gsub('.csv','.tif',FileName[i]),width = 800,height = 560)
  
  boxplot(get(n1[i])[,2],get(n2[i])[,2],names = c(n1[i],n2[i]),las=1)
  
  dev.off()
  
}



temp=matrix(0,4,24)
colnames(temp)=gsub('.csv','',FileName[1:24])
rownames(temp)=c('mean_before','SD_before','mean_after','SD_after')

for (i in 1:24) 
{
  temp[1,i]=mean(get(n1[i])[,2])
  temp[2,i]=sd(get(n1[i])[,2])
  temp[3,i]=mean(get(n2[i])[,2])
  temp[4,i]=sd(get(n2[i])[,2])
}



write.csv(temp,'mean&SD.csv')


for (i in 1:24) 
{
  tiff(gsub('.csv','.tif',FileName[i]),width = 1200,height = 500)
  
  par(mfrow=c(2,1))
  
  plot(loess.smooth(get(n1[i])[,1],get(n1[i])[,2],span = 2/3),type = 'l',las=1,main =n1[i],
       xlab = 'Pixel', ylab = 'Density')
  
  plot(loess.smooth(get(n2[i])[,1],get(n2[i])[,2],span = 2/3),type = 'l',las=1,main =n2[i],
       xlab = 'Pixel', ylab = 'Density')
  
  dev.off()

}












