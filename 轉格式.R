Path="D:/density_sort/year/joining data"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")
n=gsub('.csv','',FileName)

for (i in 1:8) 
{
  assign(n[i], read.csv(FilePath[i],stringsAsFactors=FALSE))
}



## 直式轉Tucson
library(dplR)     # 要先把"年"的那row砍掉

rownames(EW)=EW[,1]
EW=EW[,-1]
rownames(EWD)=EWD[,1]
EWD=EWD[,-1]
rownames(LW)=LW[,1]
LW=LW[,-1]
rownames(LWD)=LWD[,1]
LWD=LWD[,-1]
rownames(MND)=MND[,1]
MND=MND[,-1]
rownames(MXD)=MXD[,1]
MXD=MXD[,-1]
rownames(RD)=RD[,1]
RD=RD[,-1]
rownames(RW)=RW[,1]
RW=RW[,-1]



#rownames(temp)=1970:2014     #DSS            # 再手動加回來
#    rownames(temp)=1699:2014      # 松            

#colnames(temp)=c('3003X','3003Y')         # 若數字開頭的core名稱, R會自動加上"X", 若超過六碼則無法轉換
# 需用此行程式更改回原名稱, 或將名稱改為文字開頭
write.rwl(temp,fname='DSS_OK.lwr',prec=0.001) # prec 預設是0.01 記得要改

library(dplR) 

write.rwl(EW,fname='EW',prec=0.001)
write.rwl(EWD,fname='EWD',prec=0.001)
write.rwl(LW,fname='LW',prec=0.001)
write.rwl(LWD,fname='LWD',prec=0.001)
write.rwl(MND,fname='MND',prec=0.001)
write.rwl(MXD,fname='MXD',prec=0.001)
write.rwl(RD,fname='RD',prec=0.001)
write.rwl(RW,fname='RW',prec=0.001)






















