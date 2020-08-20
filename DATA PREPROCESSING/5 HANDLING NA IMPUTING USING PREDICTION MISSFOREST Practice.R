library(missForest)
Practice=read.csv(file.choose(),sep=',',header=T,stringsAsFactors = T) #stringsAsFactors = T is used to convert the charecter type data into factor
summary(Practice)
str(Practice)
D1 <- Practice
if(nrow(D1[!complete.cases(D1),])==0)
{
  D1=D1
}else{
  temp=missForest(D1)
  D1=as.data.frame(temp[[1]])
}
summary(D1)

D1
Practice

