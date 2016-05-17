install.packages("faraway")
library(faraway)
data(pima)

model <- lm(diabetes ~ bmi + triceps, data = pima)
summary(model)

#Standardizing Coefficients
#(y - mean(y))/sd(y)

#Standardize model predictors by hand
standard.bmi <- (pima$bmi - mean(pima$bmi))/sd(pima$bmi)
standard.triceps <- (pima$triceps - mean(pima$triceps))/sd(pima$triceps)
standard.diabetes <- (pima$diabetes - mean(pima$diabetes))/sd(pima$diabetes)

#Create New Model with standardized values

standardized.model <- lm(standard.diabetes ~ standard.bmi + standard.triceps)

summary(standardized.model)

#Package that standardizes values
install.packages("QuantPsyc")
library(QuantPsyc)