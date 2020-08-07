install.packages("missForest")
library(missForest)
data() # this will give all the build in data set names 
summary(iris)
iris

D1= prodNA(iris, noNA = 0.1)#10% of value NA in every col. prodNA inserts na value  in my dataset
summary(D1)
View(D1)

for (i in 1:length(D1)) 
{
  if(nrow(D1[!complete.cases(D1[,1]),])>0)
  {
  if(class(D1[,1])=='integer'|class(D1[,1])=='numeric') 
    {
    
    NNA=round(mean(D1[,1], na.rm = TRUE))
    D1[is.na(D1[,1]),1]=NNA
    print(paste(names(D1[1]),"have NA Values and is imputed by Mean value:",NNA))
    
    }else if(class(D1[,i])=='factor') 
    {
      
    FNA=subset(data.frame(table(D1[5])),Freq==max(Freq))#mode is the one which is having  MAX frequency value
  
    D1[is.na(D1[,5]),i]=FNA[,1]
    print(paste(names(D1[i]),"have NA Values and is imputed by Max Frequent value:",FNA[,1]))
      
    }else
    {
      
    print("USE OMIT OR REDUCE VALUE FROM DATASET")
    
    }
  }else{
    print(paste(names(D1[i]),"doesnot have NA values"))
  }
}

summary(D1)
nrow(D1)
D1stats=D1
