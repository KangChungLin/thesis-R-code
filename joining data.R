#name
Path="D:/density_sort/year/after_r3"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('_r.csv','',FileName)

for (i in 1:49) 
{
  assign(n[i], read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

#joining data
#first, merge two data set

rw=merge(get(n[1])[,c(1,2)],get(n[2])[,c(1,2)],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])

ew=merge(get(n[1])[,c(1,3)],get(n[2])[,c(1,3)],by='year',all = T)
colnames(ew)=c('year',n[1],n[2])

lw=merge(get(n[1])[,c(1,4)],get(n[2])[,c(1,4)],by='year',all = T)
colnames(lw)=c('year',n[1],n[2])

rd=merge(get(n[1])[,c(1,7)],get(n[2])[,c(1,7)],by='year',all = T)
colnames(rd)=c('year',n[1],n[2])

ewd=merge(get(n[1])[,c(1,8)],get(n[2])[,c(1,8)],by='year',all = T)
colnames(ewd)=c('year',n[1],n[2])

lwd=merge(get(n[1])[,c(1,9)],get(n[2])[,c(1,9)],by='year',all = T)
colnames(lwd)=c('year',n[1],n[2])

mxd=merge(get(n[1])[,c(1,10)],get(n[2])[,c(1,10)],by='year',all = T)
colnames(mxd)=c('year',n[1],n[2])

mnd=merge(get(n[1])[,c(1,11)],get(n[2])[,c(1,11)],by='year',all = T)
colnames(mnd)=c('year',n[1],n[2])

#merge other data

for (i in 3:49) 
{
  rw=merge(rw,get(n[i])[,c(1,2)],by='year',all = T)
  colnames(rw)[length(rw[1,])]=n[i]
  
  ew=merge(ew,get(n[i])[,c(1,3)],by='year',all = T)
  colnames(ew)[length(ew[1,])]=n[i]
  
  lw=merge(lw,get(n[i])[,c(1,4)],by='year',all = T)
  colnames(lw)[length(lw[1,])]=n[i]
  
  rd=merge(rd,get(n[i])[,c(1,7)],by='year',all = T)
  colnames(rd)[length(rd[1,])]=n[i]
  
  ewd=merge(ewd,get(n[i])[,c(1,8)],by='year',all = T)
  colnames(ewd)[length(ewd[1,])]=n[i]
  
  lwd=merge(lwd,get(n[i])[,c(1,9)],by='year',all = T)
  colnames(lwd)[length(lwd[1,])]=n[i]
  
  mxd=merge(mxd,get(n[i])[,c(1,10)],by='year',all = T)
  colnames(mxd)[length(mxd[1,])]=n[i]
  
  mnd=merge(mnd,get(n[i])[,c(1,11)],by='year',all = T)
  colnames(mnd)[length(mnd[1,])]=n[i]
}

write.csv(rw,'RW.csv',quote = F,row.names = F)
write.csv(ew,'EW.csv',quote = F,row.names = F)
write.csv(lw,'LW.csv',quote = F,row.names = F)
write.csv(rd,'RD.csv',quote = F,row.names = F)
write.csv(ewd,'EWD.csv',quote = F,row.names = F)
write.csv(lwd,'LWD.csv',quote = F,row.names = F)
write.csv(mxd,'MXD.csv',quote = F,row.names = F)
write.csv(mnd,'MND.csv',quote = F,row.names = F)



