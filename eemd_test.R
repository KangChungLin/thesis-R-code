#noise 0.1 size 1000

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
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,2],noise_strength = 0.1,ensemble_size=1000L))
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  rw=assign(paste0(n[i],'_final'), cbind(get(n[i])[,1],get(t[i])))
  colnames(rw)=c('year',colnames(get(t[i])))
  write.csv(rw,paste0(n[i],'.csv'),quote = F,row.names = F)
}


#重新讀檔
Path="D:/density_eemd/test/RW"                  #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

#將residual依據年分整合
#先整合兩段序列
rw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  rw=merge(rw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
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
setwd("D:/density_eemd/test/EW")

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,3],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LW")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,4],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/RD")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,7],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/RD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/EWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,8],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}



for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,9],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/MXD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,10],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MXD"                       #資料夾的路徑*
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
setwd("D:/density_eemd/test/MND")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,11],noise_strength = 0.1,ensemble_size=1000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MND"                       #資料夾的路徑
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

Path="D:/density_eemd/test/detrend"
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

setwd("D:/density_eemd/test/detrend_NA")

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

series <- read.csv("D:/density_eemd/test/series.csv")

rw_imfs=eemd(series[,2],noise_strength = 0.1,ensemble_size = 1000L)
ew_imfs=eemd(series[,3],noise_strength = 0.1,ensemble_size = 1000L)
lw_imfs=eemd(series[,4],noise_strength = 0.1,ensemble_size = 1000L)
rd_imfs=eemd(series[,5],noise_strength = 0.1,ensemble_size = 1000L)
ewd_imfs=eemd(series[,6],noise_strength = 0.1,ensemble_size = 1000L)
lwd_imfs=eemd(series[,7],noise_strength = 0.1,ensemble_size = 1000L)
mxd_imfs=eemd(series[,8],noise_strength = 0.1,ensemble_size = 1000L)
mnd_imfs=eemd(series[,9],noise_strength = 0.1,ensemble_size = 1000L)


write.csv(rw_imfs,'RW_imfs.csv',quote = F,row.names = F)
write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)
write.csv(rd_imfs,'RD_imfs.csv',quote = F,row.names = F)
write.csv(ewd_imfs,'EWD_imfs.csv',quote = F,row.names = F)
write.csv(lwd_imfs,'LWD_imfs.csv',quote = F,row.names = F)
write.csv(mxd_imfs,'MXD_imfs.csv',quote = F,row.names = F)
write.csv(mnd_imfs,'MND_imfs.csv',quote = F,row.names = F)

######################


#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

setwd("D:/density_eemd/test/RW")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,2],noise_strength = 0.1,ensemble_size=500L))
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  rw=assign(paste0(n[i],'_final'), cbind(get(n[i])[,1],get(t[i])))
  colnames(rw)=c('year',colnames(get(t[i])))
  write.csv(rw,paste0(n[i],'.csv'),quote = F,row.names = F)
}


#重新讀檔
Path="D:/density_eemd/test/RW"                  #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

#將residual依據年分整合
#先整合兩段序列
rw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  rw=merge(rw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
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
setwd("D:/density_eemd/test/EW")

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,3],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LW")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,4],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/RD")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,7],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/RD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/EWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,8],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}



for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,9],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/MXD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,10],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MXD"                       #資料夾的路徑*
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
setwd("D:/density_eemd/test/MND")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,11],noise_strength = 0.1,ensemble_size=500L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MND"                       #資料夾的路徑
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

Path="D:/density_eemd/test/detrend"
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

setwd("D:/density_eemd/test/detrend_NA")

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

series <- read.csv("D:/density_eemd/test/series.csv")

rw_imfs=eemd(series[,2],noise_strength = 0.1,ensemble_size = 500L)
ew_imfs=eemd(series[,3],noise_strength = 0.1,ensemble_size = 500L)
lw_imfs=eemd(series[,4],noise_strength = 0.1,ensemble_size = 500L)
rd_imfs=eemd(series[,5],noise_strength = 0.1,ensemble_size = 500L)
ewd_imfs=eemd(series[,6],noise_strength = 0.1,ensemble_size = 500L)
lwd_imfs=eemd(series[,7],noise_strength = 0.1,ensemble_size = 500L)
mxd_imfs=eemd(series[,8],noise_strength = 0.1,ensemble_size = 500L)
mnd_imfs=eemd(series[,9],noise_strength = 0.1,ensemble_size = 500L)


write.csv(rw_imfs,'RW_imfs.csv',quote = F,row.names = F)
write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)
write.csv(rd_imfs,'RD_imfs.csv',quote = F,row.names = F)
write.csv(ewd_imfs,'EWD_imfs.csv',quote = F,row.names = F)
write.csv(lwd_imfs,'LWD_imfs.csv',quote = F,row.names = F)
write.csv(mxd_imfs,'MXD_imfs.csv',quote = F,row.names = F)
write.csv(mnd_imfs,'MND_imfs.csv',quote = F,row.names = F)

##########################################


#read file
Path="D:/density_sort/year/after_r4"            #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑
n=gsub('_r.csv','',FileName)                    #讀進來後的名稱

for (i in 1:50)                                 #讀檔
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

setwd("D:/density_eemd/test/RW")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,2],noise_strength = 0.1,ensemble_size=5000L))
}

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #將imfs,residual存下來
{
  rw=assign(paste0(n[i],'_final'), cbind(get(n[i])[,1],get(t[i])))
  colnames(rw)=c('year',colnames(get(t[i])))
  write.csv(rw,paste0(n[i],'.csv'),quote = F,row.names = F)
}


#重新讀檔
Path="D:/density_eemd/test/RW"                  #資料夾的路徑
FileName=dir(Path)                              #路徑上所有檔案
FilePath <- paste(Path, FileName, sep="/")      #所有檔案的路徑

for (i in 1:50)                                 #讀檔
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

#將residual依據年分整合
#先整合兩段序列
rw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])


#將其餘的整合
for (i in 3:50) 
{
  rw=merge(rw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
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
setwd("D:/density_eemd/test/EW")

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,3],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LW")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,4],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LW"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/RD")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,7],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/RD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/EWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,8],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}



for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/EWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/LWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,9],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}

for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/LWD"                       #資料夾的路徑
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
setwd("D:/density_eemd/test/MXD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,10],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MXD"                       #資料夾的路徑*
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
setwd("D:/density_eemd/test/MND")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,11],noise_strength = 0.1,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                                #將imfs,residual存下來
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#重新讀檔
Path="D:/density_eemd/test/MND"                       #資料夾的路徑
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

Path="D:/density_eemd/test/detrend"
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

setwd("D:/density_eemd/test/detrend_NA")

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

series <- read.csv("D:/density_eemd/test/series.csv")

rw_imfs=eemd(series[,2],noise_strength = 0.1,ensemble_size = 5000L)
ew_imfs=eemd(series[,3],noise_strength = 0.1,ensemble_size = 5000L)
lw_imfs=eemd(series[,4],noise_strength = 0.1,ensemble_size = 5000L)
rd_imfs=eemd(series[,5],noise_strength = 0.1,ensemble_size = 5000L)
ewd_imfs=eemd(series[,6],noise_strength = 0.1,ensemble_size = 5000L)
lwd_imfs=eemd(series[,7],noise_strength = 0.1,ensemble_size = 5000L)
mxd_imfs=eemd(series[,8],noise_strength = 0.1,ensemble_size = 5000L)
mnd_imfs=eemd(series[,9],noise_strength = 0.1,ensemble_size = 5000L)


write.csv(rw_imfs,'RW_imfs.csv',quote = F,row.names = F)
write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)
write.csv(rd_imfs,'RD_imfs.csv',quote = F,row.names = F)
write.csv(ewd_imfs,'EWD_imfs.csv',quote = F,row.names = F)
write.csv(lwd_imfs,'LWD_imfs.csv',quote = F,row.names = F)
write.csv(mxd_imfs,'MXD_imfs.csv',quote = F,row.names = F)
write.csv(mnd_imfs,'MND_imfs.csv',quote = F,row.names = F)

#####################################
#test

cor(RW4[,2],RW3[,2])
plot(RW1[,1],RW1[,2],type = 'l',col=2,xlab = 'Year',ylab = 'value')
lines(RW2[,1],RW2[,2],type = 'l',col=3,lty=3)

cor(EW2[,2],EW3[,2])
cor(LW2[,2],LW3[,2])
cor(RD2[,2],RD3[,2])
cor(EWD2[,2],EWD3[,2])
cor(LWD2[,2],LWD3[,2])
cor(MXD2[,2],MXD3[,2])
cor(MND2[,2],MND3[,2])

cor.test(MND1[,2],MXD1[,2])

#############################
#plot residuals
for (i in 2:51) 
{
  tiff(filename = paste0(colnames(rw_residuals)[i],'.tif'),width = 1200,height = 450 )

  plot(rw_residuals[which(rw_residuals[,i]!='NA'),1],rw_residuals[which(rw_residuals[,i]!='NA'),i],
     type = 'l',main = colnames(rw_residuals)[i],xlab = 'Year',ylab = 'Value')

  dev.off()

}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(ew_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(ew_residuals[which(ew_residuals[,i]!='NA'),1],ew_residuals[which(ew_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(ew_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(lw_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(lw_residuals[which(lw_residuals[,i]!='NA'),1],lw_residuals[which(lw_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(lw_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(rd_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(rd_residuals[which(rd_residuals[,i]!='NA'),1],rd_residuals[which(rd_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(rd_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(ewd_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(ewd_residuals[which(ewd_residuals[,i]!='NA'),1],ewd_residuals[which(ewd_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(ewd_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(lwd_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(lwd_residuals[which(lwd_residuals[,i]!='NA'),1],lwd_residuals[which(lwd_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(lwd_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}



for (i in 2:51) 
{
  tiff(filename = paste0(colnames(mxd_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(mxd_residuals[which(mxd_residuals[,i]!='NA'),1],mxd_residuals[which(mxd_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(mxd_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


for (i in 2:51) 
{
  tiff(filename = paste0(colnames(mnd_residuals)[i],'.tif'),width = 1200,height = 450 )
  
  plot(mnd_residuals[which(mnd_residuals[,i]!='NA'),1],mnd_residuals[which(mnd_residuals[,i]!='NA'),i],
       type = 'l',main = colnames(mnd_residuals)[i],xlab = 'Year',ylab = 'Value')
  
  dev.off()
  
}


plot(rw_residuals[,1],rw_residuals[,2]-rw_residuals[894,2],type = 'l',xlab = 'Year',ylab = 'Value',
     xlim = c(1800,2010),ylim = c(-0.2,0.2))

for (i in 3:51)
{
  lines(rw_residuals[,1],rw_residuals[,i]-rw_residuals[894,i])
}

plot(rw_residuals[,1],rw_residuals[,2]-rw_residuals[994,2],type = 'l',xlab = 'Year',ylab = 'Value',
     xlim = c(1900,2008),ylim = c(-0.2,0.2))

for (i in 3:51)
{
  lines(rw_residuals[,1],rw_residuals[,i]-rw_residuals[994,i])
}

abline(h=0,lty=2,col='red')


plot(rd_residuals[,1],rd_residuals[,2]-rd_residuals[994,2],type = 'l',xlab = 'Year',ylab = 'Value',
     xlim = c(1900,2008),ylim = c(-0.05,0.05))

for (i in 3:51)
{
  lines(rd_residuals[,1],rd_residuals[,i]-rd_residuals[994,i])
}

abline(h=0,lty=2, col='red')


plot(mxd_residuals[,1],mxd_residuals[,2]-mxd_residuals[994,2],type = 'l',xlab = 'Year',ylab = 'Value',
     xlim = c(1900,2008),ylim = c(-0.06,0.06))

for (i in 3:51)
{
  lines(mxd_residuals[,1],mxd_residuals[,i]-mxd_residuals[994,i])
}


















