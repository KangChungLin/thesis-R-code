Path="D:/density_sort/year/after_r3"
FileName=dir(Path)
FilePath <- paste(Path, FileName, sep="/")

for (i in 1:48) 
{
  assign(gsub('_r.csv','',FileName[i]), read.csv(FilePath[i],stringsAsFactors=FALSE ))
}