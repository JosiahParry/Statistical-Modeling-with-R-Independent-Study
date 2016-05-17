install.packages("randomForest")
library(randomForest)

df <- read.csv("/Users/Josiah/Documents/Dataa/AccountantSalary.csv")
w = which(is.na(df$Benefits))
df <- df[-w,]


fit <- randomForest(TotalPay ~ JobTitle + Benefits, data = df)

#View Summary Stats
print(fit)

importance(fit)

sqrt(62087296)

lm <- lm(TotalPay ~ JobTitle + Benefits, data = df)
summary(lm)

