dataset= read.csv(file.choose())
dataset
View(dataset)

# Taking care of missing data
dataset$Age
dataset$Salary
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age,
                         FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Age
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary,
                            FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)
dataset$Salary
View(dataset)
str(dataset)

# Encoding categorical data
dataset$Country 
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
str(dataset)
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))


dataset$Purchased 

#SPlitting the dataset into 2 parts
##1.training
##2.testing

install.packages('caTools')
library(caTools)
set.seed(123)
#The set. seed() function sets the starting number 
#used to generate a sequence of random numbers 
#it ensures that you get the same result
#if you start with that same seed each time you run the same process.

##0.8 as 80% for training and 20% for testing

split = sample.split(dataset$Purchased, SplitRatio = 0.8) 
split



##Purchased because we need to put the last column of dataset

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

##==TRUE WILL INCLUDE THE PART TRUE IN SPLIT
##==FALSE WILL INCLUDE THE PART NOT TRUE IN SPLIT

View(training_set)
View(test_set)




training_set = scale(training_set)
test_set = scale(test_set)


##Scaling
##scaling will use the formula or/and standard deviation to scale the values
training_set[,2:3]
training_set[,2:3] = scale(training_set[,2:3])
test_set[,2:3] = scale(test_set[,2:3])

View(test_set)
View(training_set)