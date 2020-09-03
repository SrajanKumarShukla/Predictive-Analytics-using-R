dataset=read.csv("sales.csv") 
summary(dataset) 
View(dataset)
dataset$State = factor(dataset$State, 
                       levels = c('New York', 'Washington', 'Wisconsin'), 
                       labels = c(1, 2, 3)) 
dataset$Category = factor(dataset$Category, 
                          levels = c('Furniture', 'Office supplies', 'Technology'), 
                          labels = c(4, 5, 6)) 

library(caTools) 
set.seed(123) 
split = sample.split(dataset$Salesperson_share..1000.s., SplitRatio = 0.6) 
training_set = subset(dataset, split == TRUE) 
test_set = subset(dataset, split == FALSE) 


regressor = lm(formula = Salesperson_share..1000.s. ~ ., 
               data = training_set) 
summary(regressor) 

y_pred = predict(regressor, newdata = test_set) 
y_pred 


regressor = lm(formula =Salesperson_share..1000.s. ~ Store +State+Category+Monthly.E.commerce.Sales.in..1000.s., 
               data = dataset) 
summary(regressor) 

regressor = lm(formula =Salesperson_share..1000.s. ~ Store +Category+Monthly.E.commerce.Sales.in..1000.s., 
               data = dataset) 
summary(regressor) 

regressor = lm(formula =Salesperson_share..1000.s. ~ Store +Monthly.E.commerce.Sales.in..1000.s., 
               data = dataset) 
summary(regressor) 

regressor = lm(formula =Salesperson_share..1000.s. ~ Monthly.E.commerce.Sales.in..1000.s., 
               data = dataset) 
summary(regressor) 
View(regressor)
View(test_set)
y_pred = predict(regressor, newdata = test_set) 
y_pred 

library(ggplot2) 
ggplot() + 
  geom_point(aes(x = dataset$Monthly.E.commerce.Sales.in..1000.s., y = dataset$Salesperson_share..1000.s.), 
             colour = 'red') + 
  geom_line(aes(x = dataset$Monthly.E.commerce.Sales.in..1000.s., 
                y = predict(regressor, newdata = dataset)), 
            colour = 'blue') + 
  ggtitle('Truth or Bluff (Linear Regression)') + 
  xlab('Level') + 
  ylab('Salary') 

x=data.frame(Monthly.E.commerce.Sales.in..1000.s.=456,State=2,Category=4) 
predict(regressor,newdata = x)