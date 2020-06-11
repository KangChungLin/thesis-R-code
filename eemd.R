#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,2],ensemble_size=1000L))
}

t=paste0(n,'_imfs')

for (i in 1:50)                                #將imfs,residual存下來
{
  rw=assign(paste0(n[i],'_final'), cbind(get(n[i])[,1],get(t[i])))
  colnames(rw)=c('year',colnames(get(t[i])))
  write.csv(rw,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#將residual依據年分整合
#先整合兩段序列
rw=merge(get(n[1])[,c(1,length(get(n[1])[1,]))],get(n[2])[,c(1,length(get(n[2])[1,]))],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  rw=merge(rw,get(n[i])[,c(1,length(get(n[i])[1,]))],by='year',all = T)
  colnames(rw)[length(rw[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(rw,'rw_residuals.csv',quote = F,row.names = F)

#原始值-residuals
RW <- read.csv("D:/density_sort/year/20190418/RW.csv")
rw_detrend=RW-rw
rw_detrend[,1]=rw[,1]
write.csv(rw_detrend,'rw_detrend.csv',quote = F,row.names = F)


#EW
setwd("D:/density_eemd/EW")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,3],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/EW"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成ew

ew=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(ew)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  ew=merge(ew,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(ew)[length(ew[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(ew,'ew_residuals.csv',quote = F,row.names = F)

#原始值-residuals
EW <- read.csv("D:/density_sort/year/20190418/EW.csv")
ew_detrend=EW-ew
ew_detrend[,1]=ew[,1]
write.csv(ew_detrend,'ew_detrend.csv',quote = F,row.names = F)


#LW
setwd("D:/density_eemd/LW")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,4],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/LW"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成lw

lw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(lw)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  lw=merge(lw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(lw)[length(lw[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(lw,'lw_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
LW <- read.csv("D:/density_sort/year/20190418/LW.csv")
lw_detrend=LW-lw
lw_detrend[,1]=lw[,1]
write.csv(lw_detrend,'lw_detrend.csv',quote = F,row.names = F)


#RD
setwd("D:/density_eemd/RD")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,7],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/RD"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成rd

rd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rd)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  rd=merge(rd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(rd)[length(rd[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(rd,'rd_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
RD <- read.csv("D:/density_sort/year/20190418/RD.csv")
rd_detrend=RD-rd
rd_detrend[,1]=rd[,1]
write.csv(rd_detrend,'rd_detrend.csv',quote = F,row.names = F)



#EWD
setwd("D:/density_eemd/EWD")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,8],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/EWD"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成ewd

ewd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(ewd)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  ewd=merge(ewd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(ewd)[length(ewd[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(ewd,'ewd_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
EWD <- read.csv("D:/density_sort/year/20190418/EWD.csv")
ewd_detrend=EWD-ewd
ewd_detrend[,1]=ewd[,1]
write.csv(ewd_detrend,'ewd_detrend.csv',quote = F,row.names = F)


#LWD
setwd("D:/density_eemd/LWD")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,9],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/LWD"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成lwd

lwd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(lwd)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  lwd=merge(lwd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(lwd)[length(lwd[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(lwd,'lwd_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
LWD <- read.csv("D:/density_sort/year/20190418/LWD.csv")
lwd_detrend=LWD-lwd
lwd_detrend[,1]=lwd[,1]
write.csv(lwd_detrend,'lwd_detrend.csv',quote = F,row.names = F)



#MXD
setwd("D:/density_eemd/MXD")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,10],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/MXD"                       #資料夾的路徑*
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成mxd

mxd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(mxd)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  mxd=merge(mxd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(mxd)[length(mxd[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(mxd,'mxd_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
MXD <- read.csv("D:/density_sort/year/20190418/MXD.csv")
mxd_detrend=MXD-mxd
mxd_detrend[,1]=mxd[,1]
write.csv(mxd_detrend,'mxd_detrend.csv',quote = F,row.names = F)



#MND
setwd("D:/density_eemd/MND")

#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,11],ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/MND"                       #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}


#將residual依據年分整合
#先整合兩段序列
#rw改成mnd

mnd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(mnd)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  mnd=merge(mnd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(mnd)[length(mnd[1,])]=n[i]
}

#將整合後的residual存下來

write.csv(mnd,'mnd_residuals.csv',quote = F,row.names = F)

#原始值-residuals
#注意大寫
MND <- read.csv("D:/density_sort/year/20190418/MND.csv")
mnd_detrend=MND-mnd
mnd_detrend[,1]=mnd[,1]
write.csv(mnd_detrend,'mnd_detrend.csv',quote = F,row.names = F)

#讀檔(detrend)

Path="D:/density_eemd/detrend"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")

for (i in 1:8) 
{
  assign(gsub('_detrend.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

RW <- read.csv("D:/density_sort/year/20190418/RW.csv")

#將原始值為0改成NA
#有錯誤回傳沒關係

for (i in 2:51) 
{
  rw[which(RW[,i]==0),i]='NA'
  ew[which(RW[,i]==0),i]='NA'
  lw[which(RW[,i]==0),i]='NA'
  rd[which(RW[,i]==0),i]='NA'
  ewd[which(RW[,i]==0),i]='NA'
  lwd[which(RW[,i]==0),i]='NA'
  mxd[which(RW[,i]==0),i]='NA'
  mnd[which(RW[,i]==0),i]='NA'
}

setwd("D:/density_eemd/detrend_NA")

write.csv(rw,'rw.csv',quote = F,row.names = F)
write.csv(ew,'ew.csv',quote = F,row.names = F)
write.csv(lw,'lw.csv',quote = F,row.names = F)
write.csv(rd,'rd.csv',quote = F,row.names = F)
write.csv(ewd,'ewd.csv',quote = F,row.names = F)
write.csv(lwd,'lwd.csv',quote = F,row.names = F)
write.csv(mxd,'mxd.csv',quote = F,row.names = F)
write.csv(mnd,'mnd.csv',quote = F,row.names = F)

#在excel把各個序列平均合併
#read file, eemd again

series <- read.csv("D:/density_eemd/series.csv")

rw_imfs=eemd(series[,2],ensemble_size = 1000L)
ew_imfs=eemd(series[,3],ensemble_size = 1000L)
lw_imfs=eemd(series[,4],ensemble_size = 1000L)
rd_imfs=eemd(series[,5],ensemble_size = 1000L)
ewd_imfs=eemd(series[,6],ensemble_size = 1000L)
lwd_imfs=eemd(series[,7],ensemble_size = 1000L)
mxd_imfs=eemd(series[,8],ensemble_size = 1000L)
mnd_imfs=eemd(series[,9],ensemble_size = 1000L)


write.csv(rw_imfs,'RW_imfs.csv',quote = F,row.names = F)
write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)
write.csv(rd_imfs,'RD_imfs.csv',quote = F,row.names = F)
write.csv(ewd_imfs,'EWD_imfs.csv',quote = F,row.names = F)
write.csv(lwd_imfs,'LWD_imfs.csv',quote = F,row.names = F)
write.csv(mxd_imfs,'MXD_imfs.csv',quote = F,row.names = F)
write.csv(mnd_imfs,'MND_imfs.csv',quote = F,row.names = F)


#把不同組合imf加起來

year=EW_imfs[,1]

for (i in 4:10) 
{
  value=rowSums(RW_imfs[,2:i])
  value=cbind(year,value)
  write.csv(value,paste0('RW_imfs1~',i-1,'.csv'),quote = F,row.names = F)
}













