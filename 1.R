temp=add2[,-1]
rownames(temp)=add2[,1]
write.rwl(temp,fname='add2.rwl',prec=0.001)
