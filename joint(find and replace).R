#joint data
#first, joint two data set
ew=merge(CIL02A[,c(1,3)],CIL05[,c(1,3)],by='year',all = T)
colnames(ew)=c('year','CIL02A','CIL05')

#joint other data
#use 'find and replace' to change name

ew=merge(ew,CIL89A[,c(1,2)],by='year',all = T)
colnames(ew)[length(ew[1,])]=c('CIL89A')

write.csv(ew,'EW.csv',quote = F,row.names = F)
