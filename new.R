library(astrochron)
MXD_temp <- read.csv("D:/MXD_temp.csv")



temp2=MXD23_new
output2=mtm(temp2,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)

temp3=cbind(year=MXD_temp$year,temp=MXD_temp$jun.Oct)
output3=mtm(temp3,tbw = 2,ntap = 3,ar1 = T,CLpwr =T,xmin = 0,xmax = 0.5,pl=1,output = 1)



par(mfrow=c(2,1),mar=c(3,4,0.5,1))


plot(output2[,1],log10(output2[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.2)
text(-0.01,-2.6,'(a)',cex=1.5)
lines(output2[,1],log10(output2[,7]),lty=2,col='red')  #95%C.I.
lines(output2[,1],log10(output2[,8]),lty=2,col='blue')  #99%C.I.

plot(output3[,1],log10(output3[,2]),type = 'l',xlab = '',ylab = '',las=1,lwd=2,bty='l',cex.axis=1.2)
text(-0.01,-1.95,'  (b)',cex=1.5)
lines(output3[,1],log10(output3[,7]),lty=2,col='red')  #95%C.I.
lines(output3[,1],log10(output3[,8]),lty=2,col='blue')

par(mfrow=c(1,1),mar=c(1,1,1,1))
mtext('Frequency (cycle/year)',1,cex = 1.2)
mtext('Power (log)',2,cex = 1.2)



library(dplR)
MXD23_new <- read.csv("D:/MXD23_new.csv")
a=MXD23_new
b=`MXD_original+IMF23_recon`

x=mean(a[294:1100,2])
y=mean(a[1055:1084,2])


par(mfrow=c(2,1),mar=c(0,5,3,1))


plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100),labels = F)
chr.30pass1=pass.filt(a[294:1100,2]-y,W=30,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2]-y,W=50,type = 'low')

lines(a[294:1100,1],chr.30pass1,col='red',lwd=2)
lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=x-y,lty=2)
abline(h=x-y+0.2617,lty=2,col='blue')
abline(h=x-y-0.2617,lty=2,col='blue')
abline(h=x-y+0.2617*2,lty=3,col='red')
abline(h=x-y-0.2617*2,lty=3,col='red')

text(1190,0.95,'(a)',cex = 1.2)

par(mar=c(3,5,0,1))
plot(b[294:1100,1],b[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))

chr.30pass2=pass.filt(b[294:1100,2]-y,W=30,type = 'low')
chr.50pass2=pass.filt(b[294:1100,2]-y,W=50,type = 'low')


lines(b[294:1100,1],chr.30pass2,col='red',lwd=2)
lines(b[294:1100,1],chr.50pass2,col='blue4',lwd=4)
abline(h=x-y,lty=2)
abline(h=x-y+0.2617,lty=2,col='blue')
abline(h=x-y-0.2617,lty=2,col='blue')
abline(h=x-y+0.2617*2,lty=3,col='red')
abline(h=x-y-0.2617*2,lty=3,col='red')
text(1190,0.95,'(b)',cex = 1.2)

par(mfrow=c(1,1),mar=c(1,1.5,1,1))
mtext(expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')')),2,cex = 1.2)
mtext('Year',1,cex = 1.2)


###############################################

abline(v=1450)
abline(v=1640)
abline(v=1519)
abline(v=1606)
abline(v=1547)
abline(v=1892)

text(1462,-0.63,'1450',cex=0.8)
text(1652,-0.63,'1640',cex=0.8)
text(1531,-0.63,'1519',cex=0.8)
text(1618,-0.63,'1606',cex=0.8)
text(1559,-0.63,'1547',cex=0.8)
text(1904,-0.63,'1892',cex=0.8)
################################################

plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')'))
     ,xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100),labels = T)
chr.5pass1=pass.filt(a[294:1100,2]-y,W=5,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2]-y,W=50,type = 'low')

lines(a[294:1100,1],chr.5pass1,col='red',lwd=3)
#lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=x-y,lty=2)

abline(v=1257)
abline(v=1452)
abline(v=1600)
abline(v=1815)


text(1269,-0.63,'1257',cex=0.8)
text(1464,-0.63,'1452',cex=0.8)
text(1612,-0.63,'1600',cex=0.8)
text(1827,-0.63,'1815',cex=0.8)


################################################################

NETP <- read.csv("D:/paper data/NETP.csv")

NH <- read.csv("D:/paper data/NH.csv")

Asia <- read.csv("D:/paper data/Asia.csv")

y=mean(a[1055:1084,2])


par(mfrow=c(5,1),mar=c(0,5,0,1))

plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass1=pass.filt(a[294:1100,2]-y,W=50,type = 'low')

lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=0)
text(1190,0.95,'(a)',cex = 1.5)

plot(NH$year,NH$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000),ylim = c(-1.3,1)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass2=pass.filt(NH$temp,W=50,type = 'low')


lines(NH$year,chr.50pass2,col='blue4',lwd=4)
abline(h=0)
text(1190,0.93,'(b)',cex = 1.5)

plot(Asia$year,Asia$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100),labels = F)

chr.50pass3=pass.filt(Asia$temp,W=50,type = 'low')


lines(Asia$year,chr.50pass3,col='blue4',lwd=4)
abline(h=0)

text(1190,0.5,'(c)',cex = 1.5)

plot(NETP$year,NETP$temp-0.374,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",xlim = c(1200,2000),ylim = c(-1.2,1.0)) 
axis(1,at=seq(1200,2000,100),cex.axis=1.2)

chr.50pass4=pass.filt(as.numeric(NETP$temp)-0.374,W=50,type = 'low')


lines(NETP$year,chr.50pass4,col='blue4',lwd=4)
abline(h=0)
text(1190,0.9,'(d)',cex = 1.5)

par(mfrow=c(1,1),mar=c(6,1.5,1,1))
mtext(expression( paste('                Temperature anomaly','  (',degree,C,')')),2,cex = 1.2)
mtext('Year',1,cex = 1.2)

################################################


MXDO_new <- read.csv("D:/MXDO_new.csv")

a=`MXD_original+IMF23_recon`
b=MXD_original_recon




library(dplR)

par(mfrow=c(2,1),mar=c(0,5,3,1))

plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100),labels = F)
chr.30pass1=pass.filt(a[294:1100,2]-y,W=30,type = 'low')
chr.50pass1=pass.filt(a[294:1100,2]-y,W=50,type = 'low')

lines(a[294:1100,1],chr.30pass1,col='red',lwd=2)
lines(a[294:1100,1],chr.50pass1,col='blue4',lwd=4)
abline(h=x-y)




text(1190,0.95,'(a)',cex = 1.2)

par(mar=c(3,5,0,1))
plot(b[294:1100,1],b[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab ='',xaxt = "n",ylim = c(-0.6,1.0)) 
axis(1,at=seq(1200,2000,100))

chr.30pass2=pass.filt(b[294:1100,2]-y,W=30,type = 'low')
chr.50pass2=pass.filt(b[294:1100,2]-y,W=50,type = 'low')


lines(b[294:1100,1],chr.30pass2,col='red',lwd=2)
lines(b[294:1100,1],chr.50pass2,col='blue4',lwd=4)
abline(h=0.1)
text(1190,0.95,'(b)',cex = 1.2)

par(mfrow=c(1,1),mar=c(1,1.5,1,1))
mtext(expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')')),2,cex = 1.2)
mtext('Year',1,cex = 1.2)

##############################################################

`MXD_original+IMF23_recon` <- read.csv("D:/MXD_original+IMF23_recon.csv")
a=`MXD_original+IMF23_recon`
a=MXD23_new2

x=mean(a[294:1100,2])
y=mean(a[1055:1084,2])

x=mean(a[294:1112,2])
y=mean(a[1055:1084,2])


library(dplR)

plot(a[294:1112,1],a[294:1112,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')'))
     ,xaxt = "n",ylim = c(-0.6,1.2)) 
axis(1,at=seq(1200,2000,100),labels = T,cex=2)
chr.5pass1=pass.filt(a[294:1112,2]-y,W=5,type = 'low')

lines(a[294:1112,1],chr.5pass1,col='blue',lwd=2)
#abline(h=x-y,lty=2)


points(1364,a$recon[1364-906]-y,pch=19)



abline(v=1257) #Stoffel  #VEI=6 #Indonesia
abline(v=1262)
abline(v=1362,col='red',lwd=2)
abline(v=1452,col='red',lwd=2) #Stoffel  #many
abline(v=1471) #Japan
abline(v=1477,col='red',lwd=2)
abline(v=1563,col='red',lwd=2)
abline(v=1586) #Indonesia
abline(v=1593) #Indonesia
abline(v=1600) #VEI=6
abline(v=1630,col='red',lwd=2)
abline(v=1631)
abline(v=1640,col='red',lwd=2) #Japan
abline(v=1641) #Philippines
abline(v=1663) #Japan
abline(v=1667) #Japan
abline(v=1673) #Indonesia
abline(v=1680,col='red',lwd=2) #Indonesia
abline(v=1707) #Japan
abline(v=1721)
abline(v=1739) #Japan
abline(v=1755)
abline(v=1815) #Indonesia #VEI=7
abline(v=1822)
abline(v=1835)
abline(v=1854,col='red',lwd=2)
abline(v=1875,col='red',lwd=2)
abline(v=1883) #Indonesia #VEI=6
abline(v=1902) #VEI=6
abline(v=1907)
abline(v=1912)
abline(v=1913)
abline(v=1933) #Japan
abline(v=1956,col='red',lwd=2)
abline(v=1963) #Indonesia
abline(v=1991,col='red',lwd=2) #VEI=6


text(1370,-0.63,'1362',cex=0.8,col = 'red')
text(1460,-0.63,'1452',cex=0.8,col = 'red')
text(1485,-0.63,'1477',cex=0.8,col = 'red')
text(1571,-0.63,'1563',cex=0.8,col = 'red')
text(1638,-0.63,'1630',cex=0.8,col = 'red')
text(1648,-0.63,'1640',cex=0.8,col = 'red')
text(1862,-0.63,'1854',cex=0.8,col = 'red')
text(1883,-0.63,'1875',cex=0.8,col = 'red')
text(1964,-0.63,'1956',cex=0.8,col = 'red')
text(1999,-0.63,'1991',cex=0.8,col = 'red')






v=c(1257,1262,1362,1452,1471,1477,1563,1586,1593,1600,1630,1631,1640,1641,1663,1667,1673,1680,
    1707,1721,1739,1755,1815,1822,1835,1854,1875,1883,1902,1907,1912,1913,1933,1956,1963,1991)  #all

a=`MXD_original+IMF23_recon`

dif=matrix(0,ncol = 6,nrow = 36)
dif[,1]=v

lag0=a$recon[v-906]
lag1=a$recon[v-905]
lag2=a$recon[v-904]
lag3=a$recon[v-903]
lag4=a$recon[v-902]
lag5=a$recon[v-901]

dif[,2]=lag1-lag0
dif[,3]=lag2-lag0
dif[,4]=lag3-lag0
dif[,5]=lag4-lag0
dif[,6]=lag5-lag0

write.csv(dif,'volc&temp2.csv',row.names = F,quote = F)


v=c(1471,1586,1593,1640,1641,1663,1667,1673,1680,
    1707,1739,1815,1883,1933,1963)                           #Asia

v=c(1257,1452,1600,1815,1883,1902,1912,1991)            #VEI>=6

cool=matrix(0,ncol = 3,nrow = 31)
cool[,1]=-5:25

for (i in 1:31) 
{
        d=a$recon[v-912+i]-a$recon[v-906]
        m=mean(d)
        se=sd(d)/(7^0.5)
        cool[i,2]=m
        cool[i,3]=se
}

plot(cool[,1],cool[,2],type = 'b',ylim = c(-0.4,0.4),las=1,xlab = 'Years relative to volcanic eruption',
     ylab = 'Temperature change')
abline(h=0,lty=2)
abline(v=0,lty=2,col='gray')
arrows(cool[,1],cool[,2]-cool[,3]*2,cool[,1],cool[,2]+cool[,3]*2, length=0.05, angle=90, code=3)


#####################################################

v=c(1257,1452,1600,1815,1883,1902,1912)            #VEI>=6

cool=matrix(0,ncol = 3,nrow = 36)
cool[,1]=-5:30

for (i in 1:36) 
{
        d=a$recon[v-912+i]-a$recon[v-906]
        m=mean(d)
        se=sd(d)/(7^0.5)
        cool[i,2]=m
        cool[i,3]=se
}




pre1=a$recon[v-907]
lag0=a$recon[v-906]
lag1=a$recon[v-905]
lag2=a$recon[v-904]
lag3=a$recon[v-903]
lag4=a$recon[v-902]
lag5=a$recon[v-901]
lag6=a$recon[v-900]
lag7=a$recon[v-899]
lag8=a$recon[v-898]
lag9=a$recon[v-897]
lag10=a$recon[v-886]
cool=c(mean(pre1-lag0),0,mean(lag1-lag0),mean(lag2-lag0),mean(lag3-lag0),mean(lag4-lag0),
       mean(lag5-lag0),mean(lag6-lag0),mean(lag7-lag0),mean(lag8-lag0),mean(lag9-lag0),
       mean(lag10-lag0))
barplot(cool)
abline(h=0)
mean(lag10-lag0)

######################################


a=MXDO_new
plot(a[294:1100,1],a[294:1100,2]-y,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('Average Jun(-)-Oct temperature anomaly','  (',degree,C,')'))
     ,xaxt = "n",ylim = c(-0.6,1.2)) 
axis(1,at=seq(1200,2000,100),labels = T,cex=2)
chr.5pass1=pass.filt(a[294:1100,2]-y,W=5,type = 'low')

lines(a[294:1100,1],chr.5pass1,col='blue',lwd=3)
abline(h=x-y,lty=2)

abline(v=1257,col='red',lwd=2) #Stoffel  #VEI=6
abline(v=1262)
abline(v=1362)
abline(v=1452,col='red',lwd=2) #Stoffel  #many
abline(v=1471) #Japan
abline(v=1477)
abline(v=1563)
abline(v=1586) #Indonesia
abline(v=1593) #Indonesia
abline(v=1600,col='red',lwd=2) #VEI=6
abline(v=1630)
abline(v=1631)
abline(v=1640) #Japan
abline(v=1641) #Philippines
abline(v=1663) #Japan
abline(v=1667) #Japan
abline(v=1673) #Indonesia
abline(v=1680) #Indonesia
abline(v=1707) #Japan
abline(v=1721)
abline(v=1739) #Japan
abline(v=1755)
abline(v=1815,col='red',lwd=2) #Indonesia #VEI=7
abline(v=1822)
abline(v=1835)
abline(v=1854)
abline(v=1875)
abline(v=1883,col='red',lwd=2) #Indonesia #VEI=6
abline(v=1902,col='red',lwd=2) #VEI=6
abline(v=1907)
abline(v=1912)
abline(v=1913)
abline(v=1933) #Japan
abline(v=1956)
abline(v=1963) #Indonesia
abline(v=1991,col='red',lwd=2) #VEI=6


library(dplR)

plot(NH$year,NH$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('North Hemisphere Summer temperature anomaly','  (',degree,C,')')),
     xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100))

chr.5pass2=pass.filt(NH$temp,W=5,type = 'low')

lines(NH$year,chr.5pass2,col='blue4',lwd=2)

abline(v=1257,col='red',lwd=2) #Stoffel  #VEI=6
abline(v=1452,col='red',lwd=2) #Stoffel  #many
abline(v=1600,col='red',lwd=2) #VEI=6
abline(v=1815,col='red',lwd=2) #Indonesia #VEI=7
abline(v=1883,col='red',lwd=2) #Indonesia #VEI=6
abline(v=1902,col='red',lwd=2) #VEI=6
abline(v=1991,col='red',lwd=2) #VEI=6





plot(Asia$year,Asia$temp,type = 'l',col='gray60',las=1,xlab = 'Year',
     ylab =expression( paste('East Asia summer temperature anomaly','  (',degree,C,')')),
     xaxt = "n",xlim = c(1200,2000)) 
axis(1,at=seq(1200,2000,100))

chr.5pass3=pass.filt(Asia$temp,W=5,type = 'low')

lines(Asia$year,chr.5pass3,col='blue4',lwd=2)

abline(v=1257,col='red',lwd=2) #Stoffel  #VEI=6
abline(v=1452,col='red',lwd=2) #Stoffel  #many
abline(v=1600,col='red',lwd=2) #VEI=6
abline(v=1815,col='red',lwd=2) #Indonesia #VEI=7
abline(v=1883,col='red',lwd=2) #Indonesia #VEI=6
abline(v=1902,col='red',lwd=2) #VEI=6





