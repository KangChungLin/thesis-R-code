CIL02A_1 <- read.csv("D:/density_sort/year/after_r/CIL02A_1.csv")
which(CIL02A_1[,9]==0)
CIL02A_1[which(CIL02A_1[,9]==0),3]=CIL02A_1[which(CIL02A_1[,9]==0),2]/2
CIL02A_1[which(CIL02A_1[,9]==0),4]=CIL02A_1[which(CIL02A_1[,9]==0),2]/2
CIL02A_1[which(CIL02A_1[,9]==0),5]=50
CIL02A_1[which(CIL02A_1[,9]==0),6]=50
CIL02A_1[which(CIL02A_1[,9]==0),9]=CIL02A_1[which(CIL02A_1[,9]==0),7]

CIL02A_1[,2:4]=CIL02A_1[,2:4]/17.75
CIL02A_1[,7:11]=CIL02A_1[,7:11]*2/2.2

write.csv(CIL02A_1,'CIL02A_1_r.csv',quote = F,row.names = F)

