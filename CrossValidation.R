#LETS DO SOME CROSS VALIDATION
library(dplyr)
library(ggvis)

#finding the best parameters 
#partition into training and test set / validation


#find dimensions
dim(acnt) #dim 1148 x 14
#create vector of the length 
v <- c(1:1148)
#we want training to be 80%
#creating training length
n <- round(.8*dim(acnt)[1],0) #round creates a whole number if use argument ,0 
s <- sample(v,n, replace = F) #randomly choosing numbers from our vector to select from training

#create training set from our sample vector
#sample vector randomly selects rows from our DF


train <- acnt[s,]#selecting only randomized from sample
test <- acnt[-s,] #validation are all rows not sampled

#create model off of train set
model <- lm(TotalPay ~ Benefits + JobTitle, data = acnt)
summary(model)

#predict
pred <- predict(model, test)
plot(pred, test$TotalPay)
abline(a = 0, b = 1)

#how to test effectiveness 
l <- which(is.na(test$Benefits))
avgdiff <- sum(abs(pred-test$TotalPay), na.rm=T)/(dim(test)[1] - length(l)) #need to divide by n - NA's


#####################################################
CV <- list(1:5)
Prediction <- list(1:5)
AverageError <- c(1:5)

#creating lists of models and predictions
for (i in 1:5) {
  s <- sample(v, n, replace = F)
  train <- acnt[s,]
  test <- acnt[-s,]
  model <- lm(TotalPay ~ Benefits + JobTitle, data = acnt)
  pred <- predict(model, test)
  CV[[i]] <- model
  Prediction[[i]] <- pred
  avgdiff <- sum(abs(pred-test$TotalPay), na.rm=T)/(dim(test)[1] - length(l))
  AverageError[i] <- avgdiff
}


#Printing Summary stats for Models
for (i in 1:5) {
  print(summary(CV[[i]]))
}

#printing average error prediction
AverageError 

#finding out which model has least error
min <- min(AverageError)
w <- which(AverageError==min) #fifth model is best

CV[[w]]#best model

