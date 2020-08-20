D1=read.csv(file.choose(),sep=',',header=T,stringsAsFactors = T)
D1
str(D1)
str(D1)
View(D1)

library(missForest)
nrow(D1)
summary(D1)
str(D1)
if(nrow(D1[!complete.cases(D1),])==0)
{
  D1=D1
}else{
  temp=missForest(D1)
  D1=as.data.frame(temp[[1]])
}
View(D1)

summary(D1)