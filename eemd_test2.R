#eemd noise_strength = 0.2,ensemble_size=5000L 

#read file
Path="D:/density_sort/year/after_r4"            #path
FileName=dir(Path)                              #all files of the path
FilePath <- paste(Path, FileName, sep="/")      #the path of all files
n=gsub('_r.csv','',FileName)                    #name

for (i in 1:50)                                 #read files
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

setwd("D:/density_eemd/test/RW")

Sys.time()
for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,2],noise_strength = 0.2,ensemble_size=5000L))
}
Sys.time()

t=paste0(n,'_imfs')
f=paste0(n,'_final')

for (i in 1:50)                                #save imfs&residuals
{
  rw=assign(paste0(n[i],'_final'), cbind(get(n[i])[,1],get(t[i])))
  colnames(rw)=c('year',colnames(get(t[i])))
  write.csv(rw,paste0(n[i],'.csv'),quote = F,row.names = F)
}


#read new files(last step saved)
Path="D:/density_eemd/test/RW"                  #path
FileName=dir(Path)                              #all files of the path
FilePath <- paste(Path, FileName, sep="/")      #name

for (i in 1:50)                                 #read files
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

#merge two series
rw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rw)=c('year',n[1],n[2])


#merge others
for (i in 3:50) 
{
  rw=merge(rw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(rw)[length(rw[1,])]=n[i]
}

#save residuals

write.csv(rw,'rw_residuals.csv',quote = F,row.names = F)

#raw data - residuals
RW <- read.csv("D:/density_sort/year/20190418/RW.csv")
rw_detrend=RW-rw
rw_detrend[,1]=rw[,1]
write.csv(rw_detrend,'rw_detrend.csv',quote = F,row.names = F)

#EW
setwd("D:/density_eemd/test/EW")

for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,3],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                               
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#
Path="D:/density_eemd/test/EW"                     
FileName=dir(Path)                              
FilePath <- paste(Path, FileName, sep="/")      

for (i in 1:50)                                 
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




ew=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(ew)=c('year',n[1],n[2])



for (i in 3:50) 
{
  ew=merge(ew,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(ew)[length(ew[1,])]=n[i]
}



write.csv(ew,'ew_residuals.csv',quote = F,row.names = F)


EW <- read.csv("D:/density_sort/year/20190418/EW.csv")
ew_detrend=EW-ew
ew_detrend[,1]=ew[,1]
write.csv(ew_detrend,'ew_detrend.csv',quote = F,row.names = F)


#LW
setwd("D:/density_eemd/test/LW")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,4],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                            
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}

#
Path="D:/density_eemd/test/LW"                       
FileName=dir(Path)                              
FilePath <- paste(Path, FileName, sep="/")      

for (i in 1:50)                                 
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




lw=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(lw)=c('year',n[1],n[2])



for (i in 3:50) 
{
  lw=merge(lw,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(lw)[length(lw[1,])]=n[i]
}



write.csv(lw,'lw_residuals.csv',quote = F,row.names = F)



LW <- read.csv("D:/density_sort/year/20190418/LW.csv")
lw_detrend=LW-lw
lw_detrend[,1]=lw[,1]
write.csv(lw_detrend,'lw_detrend.csv',quote = F,row.names = F)


#RD
setwd("D:/density_eemd/test/RD")



for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,7],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                               
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}


Path="D:/density_eemd/test/RD"                      
FileName=dir(Path)                             
FilePath <- paste(Path, FileName, sep="/")     

for (i in 1:50)                               
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




rd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(rd)=c('year',n[1],n[2])


for (i in 3:50) 
{
  rd=merge(rd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(rd)[length(rd[1,])]=n[i]
}



write.csv(rd,'rd_residuals.csv',quote = F,row.names = F)


RD <- read.csv("D:/density_sort/year/20190418/RD.csv")
rd_detrend=RD-rd
rd_detrend[,1]=rd[,1]
write.csv(rd_detrend,'rd_detrend.csv',quote = F,row.names = F)



#EWD
setwd("D:/density_eemd/test/EWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,8],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}



for (i in 1:50)                                
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}


Path="D:/density_eemd/test/EWD"                       
FileName=dir(Path)                              
FilePath <- paste(Path, FileName, sep="/")     

for (i in 1:50)                                
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




ewd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(ewd)=c('year',n[1],n[2])


for (i in 3:50) 
{
  ewd=merge(ewd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(ewd)[length(ewd[1,])]=n[i]
}



write.csv(ewd,'ewd_residuals.csv',quote = F,row.names = F)


EWD <- read.csv("D:/density_sort/year/20190418/EWD.csv")
ewd_detrend=EWD-ewd
ewd_detrend[,1]=ewd[,1]
write.csv(ewd_detrend,'ewd_detrend.csv',quote = F,row.names = F)


#LWD
setwd("D:/density_eemd/test/LWD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,9],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}

for (i in 1:50)                                
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}


Path="D:/density_eemd/test/LWD"                    
FileName=dir(Path)                             
FilePath <- paste(Path, FileName, sep="/")      

for (i in 1:50)                              
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




lwd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(lwd)=c('year',n[1],n[2])



for (i in 3:50) 
{
  lwd=merge(lwd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(lwd)[length(lwd[1,])]=n[i]
}



write.csv(lwd,'lwd_residuals.csv',quote = F,row.names = F)


LWD <- read.csv("D:/density_sort/year/20190418/LWD.csv")
lwd_detrend=LWD-lwd
lwd_detrend[,1]=lwd[,1]
write.csv(lwd_detrend,'lwd_detrend.csv',quote = F,row.names = F)



#MXD
setwd("D:/density_eemd/test/MXD")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,10],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                               
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}


Path="D:/density_eemd/test/MXD"                  
FileName=dir(Path)                              
FilePath <- paste(Path, FileName, sep="/")      

for (i in 1:50)                                 
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




mxd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(mxd)=c('year',n[1],n[2])



for (i in 3:50) 
{
  mxd=merge(mxd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(mxd)[length(mxd[1,])]=n[i]
}



write.csv(mxd,'mxd_residuals.csv',quote = F,row.names = F)


MXD <- read.csv("D:/density_sort/year/20190418/MXD.csv")
mxd_detrend=MXD-mxd
mxd_detrend[,1]=mxd[,1]
write.csv(mxd_detrend,'mxd_detrend.csv',quote = F,row.names = F)



#MND
setwd("D:/density_eemd/test/MND")


for (i in 1:50)                                 #eemd
{
  assign(paste0(n[i],'_imfs'), eemd(get(n[i])[,11],noise_strength = 0.2,ensemble_size=5000L))    #notice 'get(n[i])[,3]'
}


for (i in 1:50)                           
{
  temp=assign(f[i], cbind(get(n[i])[,1],get(t[i])))
  colnames(temp)=c('year',colnames(get(t[i])))
  write.csv(temp,paste0(n[i],'.csv'),quote = F,row.names = F)
}


Path="D:/density_eemd/test/MND"                       
FileName=dir(Path)                              
FilePath <- paste(Path, FileName, sep="/")     

for (i in 1:50)                                 
{
  assign(gsub('.csv','_final',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}




mnd=merge(get(f[1])[,c(1,length(get(f[1])[1,]))],get(f[2])[,c(1,length(get(f[2])[1,]))],by='year',all = T)
colnames(mnd)=c('year',n[1],n[2])



for (i in 3:50) 
{
  mnd=merge(mnd,get(f[i])[,c(1,length(get(f[i])[1,]))],by='year',all = T)
  colnames(mnd)[length(mnd[1,])]=n[i]
}



write.csv(mnd,'mnd_residuals.csv',quote = F,row.names = F)


MND <- read.csv("D:/density_sort/year/20190418/MND.csv")
mnd_detrend=MND-mnd
mnd_detrend[,1]=mnd[,1]
write.csv(mnd_detrend,'mnd_detrend.csv',quote = F,row.names = F)

####################################################
#average and then eemd

Path="D:/density_eemd/test/detrend"             #detrend folder
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")

for (i in 1:8) 
{
  assign(gsub('_detrend.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}

RW <- read.csv("D:/density_sort/year/20190418/RW.csv")

#RW=0 -> NA
#add NA
#error message is ok

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

#average in excel
#read file, eemd again

series <- read.csv("D:/density_eemd/test/series.csv")

rw_imfs=eemd(series[,2],noise_strength = 0.2,ensemble_size = 5000L)
ew_imfs=eemd(series[,3],noise_strength = 0.2,ensemble_size = 5000L)
lw_imfs=eemd(series[,4],noise_strength = 0.2,ensemble_size = 5000L)
rd_imfs=eemd(series[,5],noise_strength = 0.2,ensemble_size = 5000L)
ewd_imfs=eemd(series[,6],noise_strength = 0.2,ensemble_size = 5000L)
lwd_imfs=eemd(series[,7],noise_strength = 0.2,ensemble_size = 5000L)
mxd_imfs=eemd(series[,8],noise_strength = 0.2,ensemble_size = 5000L)
mnd_imfs=eemd(series[,9],noise_strength = 0.2,ensemble_size = 5000L)


write.csv(rw_imfs,'RW_imfs.csv',quote = F,row.names = F)
write.csv(ew_imfs,'EW_imfs.csv',quote = F,row.names = F)
write.csv(lw_imfs,'LW_imfs.csv',quote = F,row.names = F)
write.csv(rd_imfs,'RD_imfs.csv',quote = F,row.names = F)
write.csv(ewd_imfs,'EWD_imfs.csv',quote = F,row.names = F)
write.csv(lwd_imfs,'LWD_imfs.csv',quote = F,row.names = F)
write.csv(mxd_imfs,'MXD_imfs.csv',quote = F,row.names = F)
write.csv(mnd_imfs,'MND_imfs.csv',quote = F,row.names = F)



cor(RD1[,2],RD5[,2])
cor(RW1[,2],RW5[,2])


 