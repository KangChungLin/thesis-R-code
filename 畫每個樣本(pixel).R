Path="D:/density_sort/pixel/before"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','_before',FileName)

for (i in 1:16) 
{
  assign(gsub('.csv','_before',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE, header=FALSE ))
}



CIL40A_before[,2]=CIL40A_before[,2]*2/2.1
CIL41A_before[,2]=CIL41A_before[,2]*2/2.2
CIL50B_before[,2]=CIL50B_before[,2]*2/2.2
CIL57A_before[,2]=CIL57A_before[,2]*2/2.2
CIL63A_before[,2]=CIL63A_before[,2]*2/2.2
CIL71B_before[,2]=CIL71B_before[,2]*2/2.1
CIL83A_before[,2]=CIL83A_before[,2]*2/2.2
CIL83B_before[,2]=CIL83B_before[,2]*2/2.1
CIL86A_before[,2]=CIL86A_before[,2]*2/2.2
CIL86B_before[,2]=CIL86B_before[,2]*2/2.2
CIL89A_before[,2]=CIL89A_before[,2]*2/2.1

for (i in 1:16) 
{
  write.csv(get(n[i]),FileName[i],quote = F,row.names = F)
}


Path="D:/density_sort/pixel/after"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','_after',FileName)

for (i in 1:47) 
{
  assign(gsub('.csv','_after',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE, header=FALSE ))
}

CIL02A_after[,2]=CIL02A_after[,2]*2/2.2
CIL05_after[,2]=CIL05_after[,2]*2/2.1
CIL07B_after[,2]=CIL07B_after[,2]*2/2.1
CIL10A_after[,2]=CIL10A_after[,2]*2/2.1
CIL10B_after[,2]=CIL10B_after[,2]*2/2.1
CIL12A_after[,2]=CIL12A_after[,2]*2/2.1
CIL12B_after[,2]=CIL12B_after[,2]*2/2.1
CIL13A_after[,2]=CIL13A_after[,2]*2/2.2
CIL13B_after[,2]=CIL13B_after[,2]*2/2.1
CIL18A_after[,2]=CIL18A_after[,2]*2/2.1
CIL18B_after[,2]=CIL18B_after[,2]*2/2.2
CIL19B_after[,2]=CIL19B_after[,2]*2/2.1
CIL28B_after[,2]=CIL28B_after[,2]*2/2.1
CIL29A_after[,2]=CIL29A_after[,2]*2/2.2
CIL29B_after[,2]=CIL29B_after[,2]*2/2.1
CIL33A_after[,2]=CIL33A_after[,2]*2/2.1
CIL33B_after[,2]=CIL33B_after[,2]*2/2.1
CIL40A_after[,2]=CIL40A_after[,2]*2/2.1
CIL41A_after[,2]=CIL41A_after[,2]*2/2.2
CIL43A_after[,2]=CIL43A_after[,2]*2/2.1
CIL43B_after[,2]=CIL43B_after[,2]*2/2.2
CIL44B_after[,2]=CIL44B_after[,2]*2/2.2
CIL50A_after[,2]=CIL50A_after[,2]*2/2.2
CIL50B_after[,2]=CIL50B_after[,2]*2/2.2
CIL57A_after[,2]=CIL57A_after[,2]*2/2.2
CIL57B_after[,2]=CIL57B_after[,2]*2/2.1
CIL63A_after[,2]=CIL63A_after[,2]*2/2.2
CIL63B_after[,2]=CIL63B_after[,2]*2/2.1
CIL67A_after[,2]=CIL67A_after[,2]*2/2.1
CIL67B_after[,2]=CIL67B_after[,2]*2/2.2
CIL71A_after[,2]=CIL71A_after[,2]*2/2.2
CIL71B_after[,2]=CIL71B_after[,2]*2/2.1
CIL71C_after[,2]=CIL71C_after[,2]*2/2.2
CIL80A_after[,2]=CIL80A_after[,2]*2/2.1
CIL80C_after[,2]=CIL80C_after[,2]*2/2.1
CIL83A_after[,2]=CIL83A_after[,2]*2/2.2
CIL83B_after[,2]=CIL83B_after[,2]*2/2.1
CIL86A_after[,2]=CIL86A_after[,2]*2/2.2
CIL86B_after[,2]=CIL86B_after[,2]*2/2.2
CIL89A_after[,2]=CIL89A_after[,2]*2/2.1

for (i in 1:47) 
{
  write.csv(get(n[i]),FileName[i],quote = F,row.names = F)
}


plot(CIL08A_before[,1],CIL08A_before[,2],type = 'l',main = 'CIL08A (pixel)',xlab = 'Pixel',ylab = 'Density',las=1,
     ylim = c(0.5,1.2))


Path="D:/density_sort/pixel/before"
FileName=dir(Path)
n=gsub('.csv','_before',FileName)




for (i in 1:16) 
{
  tiff(paste0(n[i],'.tif'),width = 1200,height = 600)
  
  plot(get(n[i])[,1],get(n[i])[,2],type = 'l',main = paste(n[i],'(pixel)'),xlab = 'Pixel',ylab = 'Density',las=1,
     ylim = c(0.55,1.15),cex.main=1.5,cex.lab=1.2)
  
  dev.off()
}


CIL67A_after=CIL67A
CIL86B_after=CIL86B


Path="D:/density_sort/pixel/after"
FileName=dir(Path)
n=gsub('.csv','_after',FileName)




for (i in 1:47) 
{
  tiff(paste0(n[i],'.tif'),width = 1200,height = 600)
  
  plot(get(n[i])[,1],get(n[i])[,2],type = 'l',main = paste(n[i],'(pixel)'),xlab = 'Pixel',ylab = 'Density',las=1,
       ylim = c(0.55,1.15),cex.main=1.5,cex.lab=1.2)
  
  dev.off()
}










