n=gsub('.csv','',FileName)

for (i in 1:23) 
{
  get(n[i])[which(get(n[i])[,9]==0),3]=get(n[i])[which(get(n[i])[,9]==0),2]/2
  get(n[i])[which(get(n[i])[,9]==0),4]=get(n[i])[which(get(n[i])[,9]==0),2]/2
  get(n[i])[which(get(n[i])[,9]==0),5]=50
  get(n[i])[which(get(n[i])[,9]==0),6]=50
  get(n[i])[which(get(n[i])[,9]==0),9]=get(n[i])[which(get(n[i])[,9]==0),7]
}

i=1
get(n[i])[which(get(n[i])[,9]==0),3] <- get(n[i])[which(get(n[i])[,9]==0),2]/2
get(n[i])[which(get(n[i])[,9]==0),3]

CIL89A[which(CIL89A[,9]==0),3]=CIL89A[which(CIL89A[,9]==0),2]/2
CIL89A[which(CIL89A[,9]==0),4]=CIL89A[which(CIL89A[,9]==0),2]/2
CIL89A[which(CIL89A[,9]==0),5]=50
CIL89A[which(CIL89A[,9]==0),6]=50
CIL89A[which(CIL89A[,9]==0),9]=CIL89A[which(CIL89A[,9]==0),7]


CIL89A[,2]=CIL89A[,2]/17.75
CIL89A[,3]=CIL89A[,3]/17.75
CIL89A[,4]=CIL89A[,4]/17.75

write.csv(CIL08B,'CIL08B_r.csv',quote = F,row.names = F)
write.csv(CIL17A,'CIL17A_r.csv',quote = F,row.names = F)
write.csv(CIL20A,'CIL20A_r.csv',quote = F,row.names = F)
write.csv(CIL20B,'CIL20B_r.csv',quote = F,row.names = F)
write.csv(CIL40A,'CIL40A_r.csv',quote = F,row.names = F)
write.csv(CIL41A,'CIL41A_r.csv',quote = F,row.names = F)
write.csv(CIL50A,'CIL50A_r.csv',quote = F,row.names = F)
write.csv(CIL50B,'CIL50B_r.csv',quote = F,row.names = F)
write.csv(CIL57A,'CIL57A_r.csv',quote = F,row.names = F)
write.csv(CIL63A,'CIL63A_r.csv',quote = F,row.names = F)
write.csv(CIL63B,'CIL63B_r.csv',quote = F,row.names = F)
write.csv(CIL69B,'CIL69B_r.csv',quote = F,row.names = F)
write.csv(CIL67B,'CIL67B_r.csv',quote = F,row.names = F)
write.csv(CIL71A,'CIL71A_r.csv',quote = F,row.names = F)
write.csv(CIL71B,'CIL71B_r.csv',quote = F,row.names = F)
write.csv(CIL71C,'CIL71C_r.csv',quote = F,row.names = F)
write.csv(CIL80B,'CIL80B_r.csv',quote = F,row.names = F)
write.csv(CIL80C,'CIL80C_r.csv',quote = F,row.names = F)
write.csv(CIL83A,'CIL83A_r.csv',quote = F,row.names = F)
write.csv(CIL83B,'CIL83B_r.csv',quote = F,row.names = F)
write.csv(CIL86A,'CIL86A_r.csv',quote = F,row.names = F)
write.csv(CIL86B,'CIL86B_r.csv',quote = F,row.names = F)
write.csv(CIL89A,'CIL89A_r.csv',quote = F,row.names = F)


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

for (i in 3:23) 
{
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

write.csv(ew,'EW.csv',quote = F,row.names = F)
write.csv(lw,'LW.csv',quote = F,row.names = F)
write.csv(rd,'RD.csv',quote = F,row.names = F)
write.csv(ewd,'EWD.csv',quote = F,row.names = F)
write.csv(lwd,'LWD.csv',quote = F,row.names = F)
write.csv(mxd,'MXD.csv',quote = F,row.names = F)
write.csv(mnd,'MND.csv',quote = F,row.names = F)
