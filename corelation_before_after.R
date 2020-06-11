MND_b=merge(CIL08A_r[,c(1,11)],MND_b,by='year',all = T)
colnames(MND_b)[2]='CIL08A'
write.csv(MND_b,'MND_b.csv',quote = F,row.names = F)

Path="D:/density_sort/year/compare"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','',FileName)

for (i in 1:10) 
{
  assign(n[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}





temp=matrix(0,nrow = 5,ncol = 24)
colnames(temp)=colnames(EWD)[-1]
rownames(temp)=c('RD','EWD','LWD','MXD','MND')

for (i in 1:24) 
{
  temp[1,i]=cor(RD[,i+1],RD_b[,i+1],use = "complete.obs")
  temp[2,i]=cor(EWD[,i+1],EWD_b[,i+1],use = "complete.obs")
  temp[3,i]=cor(LWD[,i+1],LWD_b[,i+1],use = "complete.obs")
  temp[4,i]=cor(MXD[,i+1],MXD_b[,i+1],use = "complete.obs")
  temp[5,i]=cor(MND[,i+1],MND_b[,i+1],use = "complete.obs")
}

write.csv(temp,'corelation.csv',quote = F)

